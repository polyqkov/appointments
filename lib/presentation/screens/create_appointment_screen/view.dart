import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../common/app_offset_box.dart';
import '../../common/sizes.dart';
import '../../extensions/app_extension.dart';
import '../appointments_screen/controller.dart';
import 'controller.dart';
import 'widgets/service_widget.dart';

class CreateAppointmentScreenView extends StatefulWidget {
  const CreateAppointmentScreenView({super.key});

  @override
  State<CreateAppointmentScreenView> createState() =>
      _CreateAppointmentScreenViewState();
}

class _CreateAppointmentScreenViewState
    extends State<CreateAppointmentScreenView> {
  late final AppointmentsScreenController appointmentsController;
  late final CreateAppointmentScreenController createAppointmentController;

  @override
  void initState() {
    super.initState();
    appointmentsController = Get.find();
    createAppointmentController = Get.put(CreateAppointmentScreenController());
  }

  Future<void> _showCalendar(DateTime dateTime) async => showDatePicker(
        context: context,
        initialDate: dateTime,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 7)),
      ).then(
          (dateTime) => createAppointmentController.updateDateTime(dateTime));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add appointment', style: context.textStyles.title2Medium),
      ),
      body: Obx(
        () {
          final services = appointmentsController.services;
          final certificates = appointmentsController.certificates;

          final selectedServices = createAppointmentController.selectedServices;
          final selectedDateTime =
              createAppointmentController.selectedDateTime.value;
          final selectedCertificate =
              createAppointmentController.selectedCertificate.value;
          final total = createAppointmentController.total.value;
          final currency = createAppointmentController.currency.value;

          return ListView(
            children: [
              AppOffsetBox.size4x,
              ...services.map(
                (service) => ServiceWidget(
                  service: service,
                  isSelected: selectedServices.contains(service),
                  onChanged: (value) =>
                      createAppointmentController.updateServices(
                          service: service, isChecked: value ?? false),
                ),
              ),
              AppOffsetBox.size2x,
              SizedBox(
                height: 50,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    AppOffsetBox.size4x,
                    ...certificates
                        .where((certificate) =>
                            appointmentsController.appointments
                                .firstWhereOrNull((element) =>
                                    element.certificateId == certificate.id) ==
                            null)
                        .map(
                          (certificate) => Padding(
                            padding:
                                const EdgeInsets.only(right: AppSizes.size2x),
                            child: ChoiceChip(
                              selected: certificate == selectedCertificate,
                              label: Text('Certificate #${certificate.id}'),
                              onSelected: (value) =>
                                  createAppointmentController.updateCertificate(
                                      certificate: certificate,
                                      isChecked: value),
                            ),
                          ),
                        ),
                    AppOffsetBox.size2x,
                  ],
                ),
              ),
              AppOffsetBox.size2x,
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: AppSizes.size4x),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        'Select date',
                        style: context.textStyles.bodyMedium,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    AppOffsetBox.size2x,
                    GestureDetector(
                      onTap: () => _showCalendar(selectedDateTime),
                      child: Text(
                        DateFormat.yMd('ru_RU')
                            .format(selectedDateTime)
                            .replaceAll('/', '.'),
                        style: context.textStyles.bodyBold,
                      ),
                    ),
                  ],
                ),
              ),
              AppOffsetBox.size4x,
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: AppSizes.size4x),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        'Total',
                        style: context.textStyles.bodyMedium,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    AppOffsetBox.size2x,
                    Text(
                      selectedCertificate != null
                          ? 'Free'
                          : '${total.round()} ${currency.name}',
                      style: context.textStyles.bodyBold,
                    ),
                  ],
                ),
              ),
              AppOffsetBox.size4x,
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: AppSizes.size4x),
                child: FilledButton(
                  onPressed: selectedServices.isEmpty
                      ? null
                      : () => createAppointmentController.addApointment(
                            services: selectedServices,
                            appointmentDateTime: selectedDateTime,
                            certificateId: selectedCertificate?.id,
                          ),
                  child: Text('Continue',
                      style: context.textStyles.calloutSemiBold),
                ),
              ),
              AppOffsetBox.size4x,
            ],
          );
        },
      ),
    );
  }
}
