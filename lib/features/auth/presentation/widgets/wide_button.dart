import 'package:flutter/material.dart';

// Project Files
import '../../../../core/core.dart';

class WideButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  const WideButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(395, 55),
        backgroundColor: AppColors.gradient3,
        shadowColor: AppColors.transparentColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0))
      ),

      child: Text(
        buttonText,
        style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
            color: AppColors.darkBackgroundColor),
      ),
    );
  }
}
