import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  const InputWidget({
    super.key,
    required this.labelText,
    required this.hintText,
  });

  final String labelText;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // TODO: Find a way to align the Text Right.

        Text(
          labelText,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.right,
        ),
        const SizedBox(
          height: 5,
        ),
        TextField(
          // controller: _titleController,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            hintText: hintText,
            hintStyle: const TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        )
      ],
    );
  }
}
