// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../common/etc/currency.dart';
import '../../domain/entities/service.dart';

part 'service_model.freezed.dart';
part 'service_model.g.dart';

@freezed
class ServiceModel extends Service with _$ServiceModel {
  @JsonSerializable(explicitToJson: true)
  const factory ServiceModel({
    required int id,
    required String name,
    required double price,
    required Currencies currency,
  }) = _ServiceModel;

  factory ServiceModel.fromJson(Map<String, Object?> json) =>
      _$ServiceModelFromJson(json);
}
