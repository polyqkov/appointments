import '../../domain/repos/service_repo.dart';
import '../data_sources/services_data_source/services_local_data_source_impl.dart';
import '../models/service_model.dart';

class ServiceRepoImpl implements ServiceRepo {
  final ServicesLocalDataSource servicesLocalDataSource;

  ServiceRepoImpl({required this.servicesLocalDataSource});

  @override
  Future<List<ServiceModel>?> getServices() =>
      servicesLocalDataSource.getServices();
}
