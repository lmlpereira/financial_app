
// ignore_for_file: use_key_in_widget_constructors, sort_child_properties_last

import 'package:financial_app/components/adaptative_button.dart';
import 'package:financial_app/components/adaptative_data_picker.dart';
import 'package:financial_app/components/adaptative_edit.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionForm extends StatefulWidget {

  final void Function (String,double,DateTime) onSubmit;
  
  const TransactionForm(this.onSubmit);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleController = TextEditingController();
  final valueController = TextEditingController();

  DateTime? _selectedDate = DateTime.now();

  _submitform(){

    final title = titleController.text;
    final value  = double.tryParse(valueController.text) ?? 0.0;

    if(title.isEmpty || value <= 0 || _selectedDate == null){
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
                padding: EdgeInsets.only(top: 10, right: 10, left: 10, bottom: 10 + MediaQuery.of(context).viewInsets.bottom),
                child: Column(
                  children: [
                    /*TextField(
                      controller: titleController,
                      onSubmitted: (_) => _submitform(),
                      decoration:  const  InputDecoration(
                        labelText: "Titulo",
                      ),),*/
                    AdaptativeEditText(label: "Titulo", onSubmit: (_) => _submitform() , controller: titleController, keyboardType: TextInputType.text ),
                    
                    
                   /*TextField(
                      controller: valueController,
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      onSubmitted: (_) => _submitform(),
                      decoration: const InputDecoration(
                        labelText: "Valor (€)",
                      ),),*/

                    AdaptativeEditText(label: "Valor (€)", onSubmit: (_) => _submitform() , controller: valueController, keyboardType: TextInputType.numberWithOptions(decimal: true) ),
  
                    AdaptativeDatePicker(selectedDate: _selectedDate!, onDateChange: (newDate){
                      setState(() {
                        _selectedDate = newDate;
                      });
                    }),
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        /*ElevatedButton(
                        
                          child: const Text('Nova Transação', style: TextStyle(color: Colors.white),),
                          onPressed: _submitform),*/

                        AdaptativeButton(label: 'Nova Transação', onPressed: _submitform)
                      ],
                    ),
                  ]),
              ),
            ),
    );
  }
}