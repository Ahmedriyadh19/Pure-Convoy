import 'package:flutter/services.dart';

class ConverterString {
  final String text;

  ConverterString({
    required this.text,
  });

  String getText() {
    RegExp regex = RegExp(r":\s(.*?)$");

    List<String> lines = text.split('\n');
    for (int i = 0; i < lines.length; i++) {
      RegExpMatch? match = regex.firstMatch(lines[i]);
      if (match != null && match.groupCount > 0) {
        lines[i] = match.group(1)!;
      }
    }

    String result = lines.join('\n');
    return result;
  }

  void copyToClipboard() {
    Clipboard.setData(ClipboardData(text: getText()));
  }

  @override
  String toString() => 'ConverterString(text: $text)';
}
