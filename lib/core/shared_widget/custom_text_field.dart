// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String labelText;
  final String? initialValue;
  final Color? colorIcon;
  final Widget? prefixIcon;
  final IconData? suffixIcon;
  final TextInputType keyBoardTyp;
  final VoidCallback? onTap;
  final double? width;
  final double? hight;
  final int? maxLines;
  final int? maxLength;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final bool obscureText;
  final bool readOnly;
  final Function(String)? onChange;
  final List<TextInputFormatter>? inputFormatters;
  const CustomTextField({
    Key? key,
    this.controller,
    this.hintText,
    this.labelText = '',
    this.initialValue,
    this.colorIcon = Colors.black,
    this.prefixIcon,
    this.suffixIcon,
    this.keyBoardTyp = TextInputType.emailAddress,
    this.onTap,
    this.width,
    this.hight,
    this.maxLines,
    this.maxLength,
    this.textInputAction = TextInputAction.next,
    this.validator,
    this.obscureText = false,
    this.readOnly = false,
    this.onChange,
    this.inputFormatters,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // textDirection: TextDirection.rtl,
      // textAlign: TextAlign.right,
      // textAlignVertical: TextAlignVertical.center,
      onFieldSubmitted: (v) {},
      // autofocus: true,
      onChanged: onChange,
      onTap: onTap,
      controller: controller,
      initialValue: initialValue,
      keyboardType: keyBoardTyp,
      validator: validator,
      obscureText: obscureText,
      cursorColor: Colors.black,
      inputFormatters: inputFormatters,
      style: const TextStyle(
          // fontSize: isLocalEn(context) ? 18.sp : 16.sp,
          // fontWeight: FontWeight.bold,
          ),
      readOnly: readOnly,
      enableInteractiveSelection: false,
      maxLines: maxLines,
      maxLength: maxLength,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        // label: Text(
        //   labelText,
        // ),
        hintText: hintText,
        // floatingLabelAlignment: FloatingLabelAlignment.center,
        // floatingLabelBehavior: FloatingLabelBehavior.auto,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        fillColor: Colors.white,
        filled: true,
        floatingLabelStyle: const TextStyle(
          fontSize: 18,
          color: Colors.black,
          // fontWeight: FontWeight.bold,
        ),
        labelStyle: const TextStyle(
          fontSize: 16,
          color: Colors.black,
          // fontWeight: FontWeight.bold,
        ),
        errorStyle: const TextStyle(fontSize: 12, color: Colors.red),
        prefixIconColor: Colors.black,
        prefixIcon: prefixIcon,
        suffixIcon: Icon(
          suffixIcon,
          color: Colors.black,
        ),
        // border: InputBorder.none
        errorBorder: _outlineInputBorder(),
        border: _outlineInputBorder(),
        focusedBorder: _outlineInputBorder(),
        enabledBorder: _outlineInputBorder(),
      ),
    );
  }

  OutlineInputBorder _outlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
        color: Colors.grey.withOpacity(0.8),
        width: 1,
      ),
    );
  }
}
