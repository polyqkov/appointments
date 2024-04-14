import 'package:flutter/material.dart';

import '../extensions/app_extension.dart';

class EmptyTextWidget extends StatelessWidget {
  const EmptyTextWidget({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) =>
      Center(child: Text(text, style: context.textStyles.title2Bold));
}
