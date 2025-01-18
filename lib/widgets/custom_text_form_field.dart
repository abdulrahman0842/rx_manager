import 'package:flutter/material.dart';
import 'package:rx_manager/utils/utils.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool isObscure;
  final FocusNode currentNode;
  final FocusNode? nextNode;

  const CustomTextFormField(
      {super.key,
      required this.hintText,
      required this.controller,
      this.isObscure = false,
      required this.currentNode,
      required this.nextNode});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: currentNode,
      obscureText: isObscure,
      controller: controller,
      decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          )),
      onFieldSubmitted: (_) {
        if (nextNode != null) {
          Utils.changeFocus(context, currentNode, nextNode!);
        } else {
          currentNode.unfocus();
        }
      },
    );
  }
}
