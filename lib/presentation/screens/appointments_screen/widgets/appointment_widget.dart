import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../common/etc/currency.dart';
import '../../../../domain/entities/appointment.dart';
import '../../../common/app_offset_box.dart';
import '../../../common/sizes.dart';
import '../../../extensions/app_extension.dart';

class AppointmentWidget extends StatelessWidget {
  const AppointmentWidget({
    super.key,
    required this.appointment,
  });

  final Appointment appointment;

  String _getPrice(Appointment appointment) {
    double price = 0.0;
    Currencies currency = Currencies.RUB;
    for (var element in appointment.services) {
      price += element.price;
      currency = element.currency;
    }

    return '${price.round()} ${currency.name}';
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.size4x),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Services',
              style: context.textStyles.bodySemiBold,
            ),
            ...appointment.services.map(
              (service) => Text(
                service.name,
                style: context.textStyles.subheadMedium,
              ),
            ),
            AppOffsetBox.size2x,
            Text(
              'Date',
              style: context.textStyles.bodySemiBold,
            ),
            Text(
              DateFormat.yMd('ru_RU')
                  .format(appointment.appointmentDateTime)
                  .replaceAll('/', '.'),
              style: context.textStyles.subheadMedium,
            ),
            AppOffsetBox.size2x,
            Text(
              appointment.certificateId != null ? 'Certificate' : 'Price',
              style: context.textStyles.bodySemiBold,
            ),
            Text(
              appointment.certificateId != null
                  ? 'Certificate #${appointment.certificateId}'
                  : _getPrice(appointment),
              style: context.textStyles.subheadMedium,
            ),
          ],
        ),
      ),
    );
  }
}
