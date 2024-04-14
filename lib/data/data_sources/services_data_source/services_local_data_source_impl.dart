import '../../mocks.dart';
import '../../models/service_model.dart';

abstract class ServicesLocalDataSource {
  Future<List<ServiceModel>?> getServices();
}

class ServicesLocalDataSourceImpl implements ServicesLocalDataSource {
  @override
  Future<List<ServiceModel>?> getServices() =>
      Future.delayed(const Duration(seconds: 1)).then((value) =>
          Mocks.servicesMock.map((e) => ServiceModel.fromJson(e)).toList());
}
