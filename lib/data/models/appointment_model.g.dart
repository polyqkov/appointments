// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppointmentModelImpl _$$AppointmentModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AppointmentModelImpl(
      services: (json['services'] as List<dynamic>)
          .map((e) => ServiceModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      appointmentDateTime:
          DateTime.parse(json['appointmentDateTime'] as String),
      certificateId: json['certificateId'] as int?,
    );

Map<String, dynamic> _$$AppointmentModelImplToJson(
        _$AppointmentModelImpl instance) =>
    <String, dynamic>{
      'services': instance.services.map((e) => e.toJson()).toList(),
      'appointmentDateTime': instance.appointmentDateTime.toIso8601String(),
      'certificateId': instance.certificateId,
    };
