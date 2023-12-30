import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:drift_cast/core/constants/country.dart';
import 'package:drift_cast/core/utils/secret.dart';
import 'package:drift_cast/features/drift_cast/data/model/drift_cast.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'database.g.dart';

@DriftDatabase(
  tables: [
    DriftCast,
  ],
  include: {'tables.drift'},
)
class EncryptedDatabase extends _$EncryptedDatabase {
  EncryptedDatabase() : super(_openDatabase());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      beforeOpen: (details) async {},
    );
  }
}

QueryExecutor _openDatabase() {
  return LazyDatabase(() async {
    final path = await getApplicationDocumentsDirectory();

    String? encryptionPassword = await getSecret();
    if (encryptionPassword == null) {
      throw StateError(
        'Issue with database. No access.',
      );
    }

    return NativeDatabase(
      File(p.join(path.path, 'app.db.enc')),
      setup: (db) {
        // Check that we're actually running with SQLCipher by quering the
        // cipher_version pragma.
        final result = db.select('pragma cipher_version');
        if (result.isEmpty) {
          throw UnsupportedError(
            'This database needs to run with SQLCipher, but that library is '
            'not available!',
          );
        }

        if (kDebugMode) {
          print("Database location: ${p.join(path.path, 'app.db.enc')}");
        }

        // Then, apply the key to encrypt the database. Unfortunately, this
        // pragma doesn't seem to support prepared statements so we inline the
        // key.
        final escapedKey = encryptionPassword.replaceAll("'", "''");

        db.execute("pragma key = '$escapedKey'");

        // Test that the key is correct by selecting from a table
        db.execute('select count(*) from sqlite_master');
      },
    );
  });
}
