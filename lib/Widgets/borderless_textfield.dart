import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_flashcard/Controllers/AddNewFlashcard/add_new_flashcard_controller.dart';
import 'package:getx_flashcard/Controllers/Register/register_controller.dart';
import 'package:getx_flashcard/Utils/color_utils.dart';

class BorderLessInput extends StatelessWidget {
  const BorderLessInput({
    required this.label,
    required this.controller,
    this.focusNode,
    this.isPassword = false,
    this.onChanged,
    this.maxLength,
    Key? key,
  }) : super(key: key);
  final String label;
  final TextEditingController controller;
  final bool isPassword;
  final int? maxLength;
  final FocusNode? focusNode;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      focusNode: focusNode,
      maxLength: maxLength,
      onChanged: (value) => {onChanged},
      decoration: InputDecoration(
        label: Text(
          label,
          style: const TextStyle(color: DarkThemeColors.secondaryTextColor),
        ),
      ),
    );
  }
}
