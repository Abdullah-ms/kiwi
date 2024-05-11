import 'package:flutter/material.dart';
import '../constants/colors.dart';

class SharedCustomButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const SharedCustomButton({Key? key, required this.text, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, right: 20, left: 20),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),),
        padding: const EdgeInsets.symmetric(vertical: 5),
        onPressed: onPressed,
        color: AppColors.primaryColor,
        textColor: Colors.white,
        child: Text(text, style: const TextStyle(fontSize: 16),),
      ),

    );
  }
}
