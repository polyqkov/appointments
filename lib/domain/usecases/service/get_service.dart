import '../../../data/models/service_model.dart';
import '../../repos/service_repo.dart';

class GetServices {
  final ServiceRepo serviceRepo;

  GetServices(this.serviceRepo);

  Future<List<ServiceModel>?> get() => serviceRepo.getServices();
}
