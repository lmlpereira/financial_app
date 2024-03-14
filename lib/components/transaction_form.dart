
// ignore_for_file: use_key_in_widget_constructors, sort_child_properties_last

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

  _showDatePicker(){
    
    showDatePicker(
      context: context, 
      initialDate: DateTime.now(), 
      firstDate: DateTime(2019), 
      lastDate: DateTime.now()
    ).then((value) { 
      //selectedDate = value
      if(value == null){
        return;

      }
      setState(() {
        _selectedDate = value;

      });

    });


  }

  @override
  Widget build(BuildContext context) {
    return Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  TextField(
                    controller: titleController,
                    onSubmitted: (_) => _submitform(),
                    decoration:  const  InputDecoration(
                      labelText: "Titulo",
                    ),),
                  TextField(
                    controller: valueController,
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    onSubmitted: (_) => _submitform(),
                    decoration: const InputDecoration(
                      labelText: "Valor (€)",
                    ),),
                  Container(
                    height: 70,
                    child: Row(
                      children: [
                        Expanded(
                          child: 
                            Text(_selectedDate == null ? 'Nenhuma data selecionada!' : 'Data Selecionada: ${DateFormat("dd/MM/y").format(_selectedDate!)}')
                        ),
                        TextButton(               
                          onPressed: _showDatePicker, 
                          child: Text("Selecionar Data", style: TextStyle(color:Theme.of(context).primaryColor, fontWeight: FontWeight.bold ),))
                      ],
                    ),
                  ),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                      
                        child: const Text('Nova Transação', style: TextStyle(color: Colors.white),),
                        onPressed: _submitform)
                      ,
                    ],
                  ),
                ]),
            ),
          );
  }
}