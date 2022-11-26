import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../core/resources/palette.dart';

enum FieldType { name, email, mobileNumber, password, confirmPassword }

class InfoTextField extends StatelessWidget {
  final String hintText;
  final String keyValue;
  final TextEditingController fieldController;
  final List<TextInputFormatter>? inputFormatters;
  final FieldType? fieldType;
  final TextInputType keyboardType;
  final Widget? suffixIcon;
  final String? Function(String?) validator;
  // final bool isSecured;

  const InfoTextField({
    Key? key,
    required this.hintText,
    required this.keyValue,
    required this.fieldController,
    this.fieldType,
    required this.keyboardType,
    this.inputFormatters,
    this.suffixIcon,

    required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.only(left: 20, right: 20, top: 12),
      padding: const EdgeInsets.only(top: 20,),
      child: TextFormField(
        key: Key(keyValue),
        controller: fieldController,
        validator: validator,
        inputFormatters: inputFormatters,
        keyboardType: keyboardType,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            hintText: hintText,
            suffixIcon: suffixIcon,
            hintStyle:const TextStyle(
                color: Palette.hint,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
      ),
    );
  }
}
