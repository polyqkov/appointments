import 'dart:convert';

import 'package:drift/drift.dart';

import '../models/service_model.dart';

class ServicesModelConverter extends TypeConverter<List<ServiceModel>, String> {
  const ServicesModelConverter();

  @override
  List<ServiceModel> fromSql(String fromDb) {
    return List<Map<String, dynamic>>.from(jsonDecode(fromDb))
        .map((e) => ServiceModel.fromJson(e))
        .toList();
  }

  @override
  String toSql(List<ServiceModel> value) => jsonEncode(value);
}
