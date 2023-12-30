import 'package:drift/drift.dart';
import 'package:drift_cast/core/common/drift/database.dart';
import 'package:drift_cast/core/constants/country.dart';

@UseRowClass(DriftCastModel)
class DriftCast extends Table {
  IntColumn get id => integer().autoIncrement().nullable()();
  TextColumn get country => textEnum<COUNTRY>().nullable()();
}

class DriftCastModel extends Insertable<DriftCastModel> {
  final int? id;
  final COUNTRY? country;

  DriftCastModel({
    this.id,
    this.country,
  });

  @override
  Map<String, Expression<Object>> toColumns(bool nullToAbsent) {
    return DriftCastCompanion(
      country: Value.ofNullable(country),
    ).toColumns(nullToAbsent);
  }
}
