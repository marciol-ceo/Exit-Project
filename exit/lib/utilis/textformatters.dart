import 'package:flutter/services.dart';

class TextFormatter extends TextInputFormatter{
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    return newValue.copyWith(text: newValue.text.toLowerCase().replaceAll(" ", "_").replaceAll(",", "_"));
  }
}