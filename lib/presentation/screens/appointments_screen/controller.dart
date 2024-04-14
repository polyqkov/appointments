import '../../../domain/entities/appointment.dart';
import '../../../domain/entities/certificate.dart';
import '../../../domain/repos/certificate_repo.dart';
import '../../../domain/repos/service_repo.dart';
import 'package:get/get.dart';

import '../../../common/injector/app_injector.dart';
import '../../../domain/entities/service.dart';
import '../../../domain/repos/appointment_repo.dart';

class AppointmentsScreenController extends GetxController {
  final RxBool isLoading = false.obs;
  final RxList<Appointment> appointments = <Appointment>[].obs;
  final RxList<Certificate> certificates = <Certificate>[].obs;
  final RxList<Service> services = <Service>[].obs;

  Future<void> init() async {
    isLoading.toggle();
    await getAppointments();
    await _getCertificates();
    await _getServices();
    isLoading.toggle();
  }

  Future<void> getAppointments() async {
    final List<Appointment>? result =
        await AppInjector.injector.get<AppointmentRepo>().getAppointments();
    if (result != null) {
      appointments.value = result;
    }
  }

  Future<void> _getCertificates() async {
    List<Certificate>? result =
        await AppInjector.injector.get<CertificateRepo>().getCertificates();
    if (result != null) {
      certificates.value = result;
    }
  }

  Future<void> _getServices() async {
    List<Service>? result =
        await AppInjector.injector.get<ServiceRepo>().getServices();
    if (result != null) {
      services.value = result;
    }
  }
}
