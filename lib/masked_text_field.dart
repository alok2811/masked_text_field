library masked_text_field;

import 'package:flutter/material.dart';

class MaskedTextField extends StatelessWidget {
  final TextEditingController textFieldController;

  final String mask;
  final String escapeCharacter;

  final int maxLength;
  final TextInputType keyboardType;
  final InputDecoration inputDecoration;
  final bool autofocus;

  final ValueChanged<String> onChange;

  const MaskedTextField(
      {Key? key,
      required this.mask,
      this.escapeCharacter = "x",
      required this.textFieldController,
      this.maxLength = 100,
      this.keyboardType = TextInputType.text,
      this.inputDecoration = const InputDecoration(),
      this.autofocus = false,
      required this.onChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var lastTextSize = 0;

    return TextField(
      controller: textFieldController,
      maxLength: maxLength,
      keyboardType: keyboardType,
      decoration: inputDecoration,
      autofocus: autofocus,
      onChanged: (String text) {
        // its deleting text
        if (text.length < lastTextSize) {
          if (mask[text.length] != escapeCharacter) {
            textFieldController.selection = TextSelection.fromPosition(
                TextPosition(offset: textFieldController.text.length));
          }
        } else {
          // its typing
          if (text.length >= lastTextSize) {
            var position = text.length;

            if ((mask[position - 1] != escapeCharacter) &&
                (text[position - 1] != mask[position - 1])) {
              textFieldController.text = _buildText(text);
            }

            if (mask[position] != escapeCharacter) {
              textFieldController.text =
                  "${textFieldController.text}${mask[position]}";
            }
          }

          // Android on change resets cursor position(cursor goes to 0)
          // so you have to check if it reset, then put in the end(just on android)
          // as IOS bugs if you simply put it in the end
          if (textFieldController.selection.start <
              textFieldController.text.length) {
            textFieldController.selection = TextSelection.fromPosition(
                TextPosition(offset: textFieldController.text.length));
          }
        }

        // update cursor position
        lastTextSize = textFieldController.text.length;

        onChange(textFieldController.text);
      },
    );
  }

  String _buildText(String text) {
    var result = "";

    for (int i = 0; i < text.length - 1; i++) {
      result += text[i];
    }

    result += mask[text.length - 1];
    result += text[text.length - 1];

    return result;
  }
}
