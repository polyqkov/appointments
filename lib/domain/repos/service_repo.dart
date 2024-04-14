import '../../data/models/service_model.dart';

abstract class ServiceRepo {
  Future<List<ServiceModel>?> getServices();
}
