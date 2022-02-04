library masked_text_field;

/*
* This package created by Alok Dubey
* In this we Implement Text Field where we can write Multiple text
* Like Date 01/02/2022
* Phone Number +91 98765-43210
* Zip code AND Many other things
*/


import 'package:flutter/material.dart';

class MaskedTextField extends StatelessWidget {
  final TextEditingController textFieldController;
  /*

  * This is for format which you want added in mask foe example if we want a date formate
  text (01-02-2022) then we define it text in mask (xx-xx-xxxx).

  * escapeCharacter is by defeault declear as 'x' but if change mask text then you also need to declear it in escapeCharacter.

  * maxLength is for max character length in a line.

  * Keyboard type for TextInputType like number keyboard or text keyboard etc.

   */

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

  //For build Text Method
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
