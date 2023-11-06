import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final TextEditingController _controller;
  final String _label;
  final int _maxLines;

  const CustomInput({
    super.key,
    required TextEditingController controller,
    required String label,
    int maxLines = 1,
    required Key Key,
  })  : _controller = controller,
        _label = label,
        _maxLines = maxLines;

  @override
  Widget build(BuildContext context) {
    return TextField(
      key: const Key("tituloDeck"),
      controller: _controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: _label,
        labelStyle: const TextStyle(
          color: Colors.black,
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
      cursorColor: Colors.black,
      maxLines: _maxLines,
    );
  }
}
