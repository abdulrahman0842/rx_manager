import 'package:flutter/material.dart';
import 'package:rx_manager/widgets/action_buttons.dart';
import 'package:rx_manager/widgets/custom_text_form_field.dart';

class AddContent extends StatelessWidget {
  AddContent({super.key});
  final TextEditingController _contentController = TextEditingController();
  final FocusNode contentNode = FocusNode();
  final FocusNode submitNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        CustomTextFormField(
            hintText: 'Content',
            controller: _contentController,
            currentNode: contentNode,
            nextNode: submitNode),
        ActionButtons(
            textButtonLabel: 'Cancel',
            elevatedButtonLabel: 'Save',
            textButtonOnTap: () {
              Navigator.pop(context);
            },
            elevatedButtonOnTap: () {})
      ],
    ));
  }
}
