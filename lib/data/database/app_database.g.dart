// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $AppointmentsTableTable extends AppointmentsTable
    with TableInfo<$AppointmentsTableTable, AppointmentsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AppointmentsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _servicesMeta =
      const VerificationMeta('services');
  @override
  late final GeneratedColumnWithTypeConverter<List<ServiceModel>, String>
      services = GeneratedColumn<String>('services', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<List<ServiceModel>>(
              $AppointmentsTableTable.$converterservices);
  static const VerificationMeta _appointmentDateTimeMeta =
      const VerificationMeta('appointmentDateTime');
  @override
  late final GeneratedColumn<DateTime> appointmentDateTime =
      GeneratedColumn<DateTime>('appointment_date_time', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _certificateIdMeta =
      const VerificationMeta('certificateId');
  @override
  late final GeneratedColumn<int> certificateId = GeneratedColumn<int>(
      'certificate_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [services, appointmentDateTime, certificateId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'appointments_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<AppointmentsTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    context.handle(_servicesMeta, const VerificationResult.success());
    if (data.containsKey('appointment_date_time')) {
      context.handle(
          _appointmentDateTimeMeta,
          appointmentDateTime.isAcceptableOrUnknown(
              data['appointment_date_time']!, _appointmentDateTimeMeta));
    } else if (isInserting) {
      context.missing(_appointmentDateTimeMeta);
    }
    if (data.containsKey('certificate_id')) {
      context.handle(
          _certificateIdMeta,
          certificateId.isAcceptableOrUnknown(
              data['certificate_id']!, _certificateIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  AppointmentsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AppointmentsTableData(
      services: $AppointmentsTableTable.$converterservices.fromSql(
          attachedDatabase.typeMapping
              .read(DriftSqlType.string, data['${effectivePrefix}services'])!),
      appointmentDateTime: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime,
          data['${effectivePrefix}appointment_date_time'])!,
      certificateId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}certificate_id']),
    );
  }

  @override
  $AppointmentsTableTable createAlias(String alias) {
    return $AppointmentsTableTable(attachedDatabase, alias);
  }

  static TypeConverter<List<ServiceModel>, String> $converterservices =
      const ServicesModelConverter();
}

class AppointmentsTableData extends DataClass
    implements Insertable<AppointmentsTableData> {
  final List<ServiceModel> services;
  final DateTime appointmentDateTime;
  final int? certificateId;
  const AppointmentsTableData(
      {required this.services,
      required this.appointmentDateTime,
      this.certificateId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    {
      map['services'] = Variable<String>(
          $AppointmentsTableTable.$converterservices.toSql(services));
    }
    map['appointment_date_time'] = Variable<DateTime>(appointmentDateTime);
    if (!nullToAbsent || certificateId != null) {
      map['certificate_id'] = Variable<int>(certificateId);
    }
    return map;
  }

  AppointmentsTableCompanion toCompanion(bool nullToAbsent) {
    return AppointmentsTableCompanion(
      services: Value(services),
      appointmentDateTime: Value(appointmentDateTime),
      certificateId: certificateId == null && nullToAbsent
          ? const Value.absent()
          : Value(certificateId),
    );
  }

  factory AppointmentsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AppointmentsTableData(
      services: serializer.fromJson<List<ServiceModel>>(json['services']),
      appointmentDateTime:
          serializer.fromJson<DateTime>(json['appointmentDateTime']),
      certificateId: serializer.fromJson<int?>(json['certificateId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'services': serializer.toJson<List<ServiceModel>>(services),
      'appointmentDateTime': serializer.toJson<DateTime>(appointmentDateTime),
      'certificateId': serializer.toJson<int?>(certificateId),
    };
  }

  AppointmentsTableData copyWith(
          {List<ServiceModel>? services,
          DateTime? appointmentDateTime,
          Value<int?> certificateId = const Value.absent()}) =>
      AppointmentsTableData(
        services: services ?? this.services,
        appointmentDateTime: appointmentDateTime ?? this.appointmentDateTime,
        certificateId:
            certificateId.present ? certificateId.value : this.certificateId,
      );
  @override
  String toString() {
    return (StringBuffer('AppointmentsTableData(')
          ..write('services: $services, ')
          ..write('appointmentDateTime: $appointmentDateTime, ')
          ..write('certificateId: $certificateId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(services, appointmentDateTime, certificateId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppointmentsTableData &&
          other.services == this.services &&
          other.appointmentDateTime == this.appointmentDateTime &&
          other.certificateId == this.certificateId);
}

class AppointmentsTableCompanion
    extends UpdateCompanion<AppointmentsTableData> {
  final Value<List<ServiceModel>> services;
  final Value<DateTime> appointmentDateTime;
  final Value<int?> certificateId;
  final Value<int> rowid;
  const AppointmentsTableCompanion({
    this.services = const Value.absent(),
    this.appointmentDateTime = const Value.absent(),
    this.certificateId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AppointmentsTableCompanion.insert({
    required List<ServiceModel> services,
    required DateTime appointmentDateTime,
    this.certificateId = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : services = Value(services),
        appointmentDateTime = Value(appointmentDateTime);
  static Insertable<AppointmentsTableData> custom({
    Expression<String>? services,
    Expression<DateTime>? appointmentDateTime,
    Expression<int>? certificateId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (services != null) 'services': services,
      if (appointmentDateTime != null)
        'appointment_date_time': appointmentDateTime,
      if (certificateId != null) 'certificate_id': certificateId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AppointmentsTableCompanion copyWith(
      {Value<List<ServiceModel>>? services,
      Value<DateTime>? appointmentDateTime,
      Value<int?>? certificateId,
      Value<int>? rowid}) {
    return AppointmentsTableCompanion(
      services: services ?? this.services,
      appointmentDateTime: appointmentDateTime ?? this.appointmentDateTime,
      certificateId: certificateId ?? this.certificateId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (services.present) {
      map['services'] = Variable<String>(
          $AppointmentsTableTable.$converterservices.toSql(services.value));
    }
    if (appointmentDateTime.present) {
      map['appointment_date_time'] =
          Variable<DateTime>(appointmentDateTime.value);
    }
    if (certificateId.present) {
      map['certificate_id'] = Variable<int>(certificateId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AppointmentsTableCompanion(')
          ..write('services: $services, ')
          ..write('appointmentDateTime: $appointmentDateTime, ')
          ..write('certificateId: $certificateId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $AppointmentsTableTable appointmentsTable =
      $AppointmentsTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [appointmentsTable];
}
