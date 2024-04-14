import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/app_offset_box.dart';
import '../../common/sizes.dart';
import '../../extensions/app_extension.dart';
import '../../widgets/empty_text_widget.dart';
import '../../widgets/loading_widget.dart';
import '../create_appointment_screen/view.dart';
import 'controller.dart';
import 'widgets/appointment_widget.dart';

class AppointmentsScreenView extends StatefulWidget {
  const AppointmentsScreenView({super.key});

  @override
  State<AppointmentsScreenView> createState() => _AppointmentsScreenViewState();
}

class _AppointmentsScreenViewState extends State<AppointmentsScreenView> {
  late final AppointmentsScreenController appointmentsController;

  @override
  void initState() {
    super.initState();
    appointmentsController = Get.put(AppointmentsScreenController());
    appointmentsController.init();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isLoading = appointmentsController.isLoading;
      final appointments = appointmentsController.appointments;
      return isLoading.isTrue
          ? const Scaffold(body: LoadingWidget())
          : Scaffold(
              appBar: AppBar(
                  title: Text('Appointments',
                      style: context.textStyles.title2Medium)),
              body: appointments.isEmpty == true
                  ? const EmptyTextWidget(text: 'No Appointments')
                  : ListView(
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppSizes.size4x),
                      children: [
                        AppOffsetBox.size4x,
                        ...appointments
                            .map((appointment) =>
                                AppointmentWidget(appointment: appointment))
                            .toList()
                            .reversed,
                        AppOffsetBox.size4x,
                      ],
                    ),
              floatingActionButton: FloatingActionButton(
                onPressed: () =>
                    Get.to(() => const CreateAppointmentScreenView()),
                child: const Icon(Icons.add_rounded),
              ),
            );
    });
  }
}
