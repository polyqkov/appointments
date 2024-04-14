import 'package:flutter/material.dart';

import '../../../../domain/entities/service.dart';
import '../../../common/app_offset_box.dart';
import '../../../common/sizes.dart';
import '../../../extensions/app_extension.dart';

class ServiceWidget extends StatelessWidget {
  const ServiceWidget({
    super.key,
    required this.service,
    required this.isSelected,
    this.onChanged,
  });

  final Service service;
  final bool isSelected;
  final void Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.size4x),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      service.name,
                      style: context.textStyles.bodyMedium,
                    ),
                    AppOffsetBox.size1x,
                    Text(
                      '${service.price.round()} ${service.currency.name}',
                      style: context.textStyles.subheadSemiBold,
                    ),
                  ],
                ),
              ),
              Checkbox.adaptive(value: isSelected, onChanged: onChanged),
            ],
          ),
        ),
        const Divider(),
      ],
    );
  }
}
