// see: https://github.com/robert-muriithi/TDD-Clean-Architecture-Beers-App-Flutter/blob/master/lib/injector.dart

//Service Locator
import 'package:drift_cast/core/common/drift/database.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Encrypted Drift database
  final encryptedDatabase = EncryptedDatabase();
  sl.registerSingleton<EncryptedDatabase>(encryptedDatabase);
}
