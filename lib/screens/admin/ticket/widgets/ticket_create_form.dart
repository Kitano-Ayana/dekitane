import 'package:dekitane/dto/ticket_create_dto.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'ticket_input_row.dart';
import '../../../../validators/ticket_validator.dart';

class TicketCreateForm extends StatefulWidget {
  final Future<void> Function(TicketCreateDto dto) onSubmit;

  const TicketCreateForm({
    super.key,
    required this.onSubmit,
  });

  @override
  State<TicketCreateForm> createState() => _TicketCreateFormState();
}

class _TicketCreateFormState extends State<TicketCreateForm> {
  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final pointController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    pointController.dispose();
    super.dispose();
  }

  void _submit() async {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) return;

    final dto = TicketCreateDto(
        title: titleController.text, point: int.parse(pointController.text));

    await widget.onSubmit(dto);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  '新しいタスクを追加する',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 12),
              TicketInputRow(
                label: 'タスク名',
                controller: titleController,
                validator: TicketValidator.title,
                fieldKey: const ValueKey('titleField'),
              ),
              const SizedBox(height: 8),
              TicketInputRow(
                label: '付与ポイント',
                controller: pointController,
                isNumber: true,
                validator: TicketValidator.point,
                fieldKey: const ValueKey('pointField'),
              ),
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: _submit,
                  child: const Text('タスク追加'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
