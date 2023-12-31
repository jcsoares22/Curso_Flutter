import 'package:expenses/components/adaptative_button.dart';
import 'package:flutter/material.dart';
import 'adaptative_text_field.dart';
import 'package:expenses/components/adaptative_date_picker.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double, DateTime) onSubmit;

  TransactionForm(this.onSubmit) {
    print('contrutor transactionform');
  }

  @override
  State<TransactionForm> createState() {
    print('contrutor transactionform');
    return _TransactionFormState();
  }
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  DateTime? _selectedDate = DateTime.now();

  _TransactionFormState() {
    print('contrutor _TransactionFormState');
  }

  @override
  void iniState() {
    super.initState();
    print('initState() transactionformState');
  }

  @override
  void didUpdateWidget(covariant Widget oldWidget) {
    // super.didUpdateWidget(oldWidget);
    print('initState() transactionformState');
  }

  void dispose() {
    super.dispose();
  print('dispose() transactionformState');
  }

  _submitForm() {
    final title = _titleController.text;
    final value = double.tryParse(_valueController.text) ?? 0;

    if (title.isEmpty || value <= 0 || _selectedDate == null) {
      return;
    }

    widget.onSubmit(title, value, _selectedDate!);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.only(
            top: 10,
            right: 10,
            left: 10,
            bottom: 10 + MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            children: [
              AdaptativeTextField(
                controller: _titleController,
                onSubmitted: (_) => _submitForm(),
                label: 'titulo',
              ),
              AdaptativeTextField(
                label: 'Valor (R\$)',
                controller: _valueController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onSubmitted: (_) => _submitForm(),
              ),
              AdaptativeDatePicker(
                  selectedDate: _selectedDate!,
                  onDateChanged: (NewDate) {
                    setState(() {
                      _selectedDate = NewDate;
                    });
                  }),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  AdaptativeButton(
                    label: 'Nova transação ',
                    onPressed: _submitForm,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
