import 'package:flutter/material.dart';

class TaskInputRow extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String? Function(String?) ? validator;
  final bool isNumber;

  const TaskInputRow({
    super.key,
    required this.label,
    required this.controller,
    this.validator,
    this.isNumber = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 120,
          child: Text(label),
        ),
        Expanded(
          child: TextFormField(
            controller: controller,
            keyboardType: isNumber ? TextInputType.number : TextInputType.text,
            validator: validator,
            decoration: const InputDecoration(
              isDense: true,
            ),
          ),
        ),
      ],
    );
  }
}
