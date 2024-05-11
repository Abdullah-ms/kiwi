import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';

class CustomTextFormField extends StatelessWidget {
  final String label;

  final String hintText;

  final IconData iconData;

  final TextEditingController myController;

  final String? Function(String?)? myValidator;

  final bool isNumber;

  final bool? obscureText;

  final void Function()? onTapIcon;

  const CustomTextFormField(
      {super.key,
      this.obscureText,
      this.onTapIcon,
      required this.label,
      required this.hintText,
      required this.iconData,
      required this.myController,
      required this.myValidator,
      required this.isNumber,
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        obscureText: obscureText == null || obscureText == false ? false : true,
        keyboardType: isNumber
            ? const TextInputType.numberWithOptions(decimal: true)
            : TextInputType.text,
        validator: myValidator,
        controller: myController,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 40.0),
          label: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(label , style: TextStyle(color: AppColors.primaryColor , fontSize: 18),)),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: InkWell(
            onTap: onTapIcon,
            child: Icon(iconData , color: AppColors.primaryColor,),
          ),
          hintText: hintText,
          hintStyle:
              TextStyle(color: AppColors.blackIntermediate, fontSize: 12),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(30.0),
            ),
          ),
        ),
      ),
    );
  }
}
