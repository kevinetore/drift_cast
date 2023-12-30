# drift_cast

Flutter project which displays the non null issue with Drift casting

**Enum class**
`COUNTRY`

**Drift Table**

```
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

  ...
}
```

**And a view via tables.drift**

```sql
CREATE VIEW drift_cast_view AS
    SELECT
        CAST(id AS INTEGER) AS id,
        CAST(country AS ENUMNAME(COUNTRY)) AS country
    FROM DriftCast;
```

**Which generates**

```dart
class DriftCastViewData extends DataClass {
  final int id;
  final String country;
  const DriftCastViewData({required this.id, required this.country});
  ...
}
```
