import 'package:drift/drift.dart';
import 'package:drift_cast/core/constants/country.dart';

@UseRowClass(TaskModel)
class DriftCast extends Table {
  IntColumn get id => integer().autoIncrement().nullable()();
  TextColumn get country => textEnum<COUNTRY>().nullable()();
}

class TaskModel extends Insertable<TaskModel> {
  final int? id;
  final COUNTRY? country;

  TaskModel({
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
