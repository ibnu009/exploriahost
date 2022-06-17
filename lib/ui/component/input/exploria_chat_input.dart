import 'package:exploriahost/ui/theme/exploria_primary_theme.dart';
import 'package:flutter/material.dart';

class ExploriaChatInput extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType inputType;
  final int? maxLines, maxLength;
  final FocusNode? focusNode;
  final Function(String)? onSubmitted;
  const ExploriaChatInput({Key? key, required this.controller, this.maxLines, this.focusNode, required this.inputType, this.onSubmitted, this.maxLength}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
      child: TextFormField(
        showCursor: true,
        focusNode: focusNode,
        controller: controller,
        keyboardType: inputType,
        maxLines: maxLines,
        maxLength: maxLength,
        onFieldSubmitted: onSubmitted,
        cursorColor: Colors.black,
        validator: (value) =>
        value == null || value.isEmpty ? "Field ini tidak boleh kosong" : null,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
