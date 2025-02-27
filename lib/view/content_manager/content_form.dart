import 'package:flutter/material.dart';
import 'package:rx_manager/widgets/action_buttons.dart';
import 'package:rx_manager/widgets/custom_text_form_field.dart';

class ContentForm extends StatelessWidget {
  ContentForm({super.key, this.isEditing = false, this.content});
  final bool isEditing;
  final String? content;
  final TextEditingController _contentController = TextEditingController();
  final FocusNode contentNode = FocusNode();
  final FocusNode submitNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isEditing
          ? MediaQuery.of(context).size.width * 0.3
          : MediaQuery.of(context).size.width * 0.4,
      child: Form(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 15,
        children: [
          CustomTextFormField(
              hintText: 'Content',
              controller: _contentController,
              currentNode: contentNode,
              nextNode: submitNode),
          isEditing
              ? Container()
              : ActionButtons(
                  textButtonLabel: 'Cancel',
                  elevatedButtonLabel: 'Save',
                  textButtonOnTap: () {
                    Navigator.pop(context);
                  },
                  elevatedButtonOnTap: () {})
        ],
      )),
    );
  }
}
