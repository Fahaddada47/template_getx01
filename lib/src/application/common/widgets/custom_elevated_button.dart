import 'package:fahad_flutter/src/application/styling/app_colors.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;
  final Color? borderColor;

  const CustomElevatedButton({
    Key? key,
    required this.child,
    required this.onPressed,
    this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          foregroundColor: skobeloffGreen,
          backgroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 12),
          side: BorderSide(color: borderColor ?? antiFlashWhite),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(99),
          ),
        ),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
