// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class DriftCastViewData extends DataClass {
  final int id;
  final String country;
  const DriftCastViewData({required this.id, required this.country});
  factory DriftCastViewData.fromJson(Map<String, dynamic> json, {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DriftCastViewData(
      id: serializer.fromJson<int>(json['id']),
      country: serializer.fromJson<String>(json['country']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'country': serializer.toJson<String>(country),
    };
  }

  DriftCastViewData copyWith({int? id, String? country}) => DriftCastViewData(
        id: id ?? this.id,
        country: country ?? this.country,
      );
  @override
  String toString() {
    return (StringBuffer('DriftCastViewData(')
          ..write('id: $id, ')
          ..write('country: $country')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, country);
  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is DriftCastViewData && other.id == this.id && other.country == this.country);
}

class DriftCastView extends ViewInfo<DriftCastView, DriftCastViewData> implements HasResultSet {
  final String? _alias;
  @override
  final _$EncryptedDatabase attachedDatabase;
  DriftCastView(this.attachedDatabase, [this._alias]);
  @override
  List<GeneratedColumn> get $columns => [id, country];
  @override
  String get aliasedName => _alias ?? entityName;
  @override
  String get entityName => 'drift_cast_view';
  @override
  Map<SqlDialect, String> get createViewStatements => {
        SqlDialect.sqlite:
            'CREATE VIEW drift_cast_view AS SELECT CAST(id AS INTEGER) AS id, CAST(country AS TEXT) AS country FROM DriftCast',
      };
  @override
  DriftCastView get asDslTable => this;
  @override
  DriftCastViewData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DriftCastViewData(
      id: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      country: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}country'])!,
    );
  }

  late final GeneratedColumn<int> id = GeneratedColumn<int>('id', aliasedName, false, type: DriftSqlType.int);
  late final GeneratedColumn<String> country =
      GeneratedColumn<String>('country', aliasedName, false, type: DriftSqlType.string);
  @override
  DriftCastView createAlias(String alias) {
    return DriftCastView(attachedDatabase, alias);
  }

  @override
  Query? get query => null;
  @override
  Set<String> get readTables => const {};
}

class $DriftCastTable extends DriftCast with TableInfo<$DriftCastTable, DriftCastModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DriftCastTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>('id', aliasedName, true,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _countryMeta = const VerificationMeta('country');
  @override
  late final GeneratedColumnWithTypeConverter<COUNTRY?, String> country =
      GeneratedColumn<String>('country', aliasedName, true, type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<COUNTRY?>($DriftCastTable.$convertercountryn);
  @override
  List<GeneratedColumn> get $columns => [id, country];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'drift_cast';
  @override
  VerificationContext validateIntegrity(Insertable<DriftCastModel> instance, {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    context.handle(_countryMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DriftCastModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DriftCastModel(
      id: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}id']),
      country: $DriftCastTable.$convertercountryn
          .fromSql(attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}country'])),
    );
  }

  @override
  $DriftCastTable createAlias(String alias) {
    return $DriftCastTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<COUNTRY, String, String> $convertercountry =
      const EnumNameConverter<COUNTRY>(COUNTRY.values);
  static JsonTypeConverter2<COUNTRY?, String?, String?> $convertercountryn =
      JsonTypeConverter2.asNullable($convertercountry);
}

class DriftCastCompanion extends UpdateCompanion<DriftCastModel> {
  final Value<int?> id;
  final Value<COUNTRY?> country;
  const DriftCastCompanion({
    this.id = const Value.absent(),
    this.country = const Value.absent(),
  });
  DriftCastCompanion.insert({
    this.id = const Value.absent(),
    this.country = const Value.absent(),
  });
  static Insertable<DriftCastModel> custom({
    Expression<int>? id,
    Expression<String>? country,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (country != null) 'country': country,
    });
  }

  DriftCastCompanion copyWith({Value<int?>? id, Value<COUNTRY?>? country}) {
    return DriftCastCompanion(
      id: id ?? this.id,
      country: country ?? this.country,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (country.present) {
      map['country'] = Variable<String>($DriftCastTable.$convertercountryn.toSql(country.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DriftCastCompanion(')
          ..write('id: $id, ')
          ..write('country: $country')
          ..write(')'))
        .toString();
  }
}

abstract class _$EncryptedDatabase extends GeneratedDatabase {
  _$EncryptedDatabase(QueryExecutor e) : super(e);
  late final DriftCastView driftCastView = DriftCastView(this);
  late final $DriftCastTable driftCast = $DriftCastTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables => allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [driftCastView, driftCast];
}
