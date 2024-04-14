import '../../../common/injector/app_injector.dart';
import '../../../domain/repos/appointment_repo.dart';
import 'package:get/get.dart';

import '../../../common/etc/currency.dart';
import '../../../domain/entities/appointment.dart';
import '../../../domain/entities/certificate.dart';
import '../../../domain/entities/service.dart';
import '../appointments_screen/controller.dart';

class CreateAppointmentScreenController extends GetxController {
  final RxList<Service> selectedServices = <Service>[].obs;
  final Rx<Certificate?> selectedCertificate = (null as Certificate?).obs;
  final Rx<DateTime> selectedDateTime = DateTime.now().obs;
  final RxDouble total = 0.0.obs;
  final Rx<Currencies> currency = Currencies.RUB.obs;

  Future<void> addApointment({
    required List<Service> services,
    required DateTime appointmentDateTime,
    int? certificateId,
  }) async {
    final AppointmentsScreenController appointmentsController = Get.find();
    await AppInjector.injector.get<AppointmentRepo>().addAppointment(
          Appointment(
            services: services,
            appointmentDateTime: appointmentDateTime,
            certificateId: certificateId,
          ),
        );
    await appointmentsController.getAppointments();
    Get.back();
  }

  updateTotal() {
    total.value = 0.0;

    if (selectedServices.isNotEmpty) {
      for (final service in selectedServices) {
        total.value += service.price;
        currency.value = service.currency;
      }
    }
  }

  updateDateTime(DateTime? dateTime) {
    if (dateTime != null) {
      selectedDateTime.value = dateTime;
    }
  }

  updateServices({
    required Service service,
    required bool isChecked,
  }) {
    if (isChecked) {
      selectedServices.add(service);
    } else {
      selectedServices.remove(service);
    }
    updateTotal();
  }

  updateCertificate({
    required Certificate certificate,
    required bool isChecked,
  }) {
    selectedCertificate.value = isChecked ? certificate : null;
    updateTotal();
  }
}
