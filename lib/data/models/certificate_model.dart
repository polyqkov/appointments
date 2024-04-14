// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/certificate.dart';

part 'certificate_model.freezed.dart';
part 'certificate_model.g.dart';

@freezed
class CertificateModel extends Certificate with _$CertificateModel {
  @JsonSerializable(explicitToJson: true)
  const factory CertificateModel({
    required int id,
  }) = _CertificateModel;

  factory CertificateModel.fromJson(Map<String, Object?> json) =>
      _$CertificateModelFromJson(json);
}
