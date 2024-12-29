import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../styling/app_colors.dart';

class CustomLabel extends StatelessWidget {
  final String labelText;
  final bool requiredIndicator;
  final bool requiredLock;
  final TextStyle labelStyle;
  final TextStyle requiredIndicatorStyle;

  const CustomLabel({
    Key? key,
    required this.labelText,
    this.requiredIndicator = false,
    this.requiredLock = false,
    this.labelStyle = const TextStyle(fontWeight: FontWeight.w500, fontSize:12,color: blackLabel),
    this.requiredIndicatorStyle = const TextStyle(
      color: Colors.red,
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: labelText,
            style: labelStyle,
            children: [
              if (requiredIndicator)
                TextSpan(
                  text: '*',
                  style: requiredIndicatorStyle,
                ),
            ],
          ),
        ),
        Gap(6),
        if(requiredLock)
          Icon(Icons.lock,color: grey,size: 14,)
      ],
    );
  }
}
