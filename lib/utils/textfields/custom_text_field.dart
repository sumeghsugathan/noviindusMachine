import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final TextInputType keyboardType;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.hintText,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: labelText,
          hintText: hintText,
          hintStyle: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 14,
            fontWeight: FontWeight.w300,
            color: Color.fromRGBO(0, 0, 0, 0.4),
          ),
          labelStyle: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Color.fromRGBO(64, 64, 64, 1),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.53),
              borderSide: BorderSide.none),
          filled: true,
          fillColor: const Color.fromARGB(73, 217, 217, 217),
        ),
        keyboardType: keyboardType,
      ),
    );
  }
}
