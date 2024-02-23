import 'dart:ffi';

import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {

  final void Function (String,double) onSubmit;
  
  TransactionForm(this.onSubmit);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleController = TextEditingController();

  final valueController = TextEditingController();

  _submitform(){

    final title = titleController.text;
    final value  = double.tryParse(valueController.text) ?? 0.0;

    if(title.isEmpty || value <= 0){
      return;
    }
    
    widget.onSubmit(title, value);

    
  }

  @override
  Widget build(BuildContext context) {
    return Card(
            elevation: 5,
            child: Padding(
              padding: EdgeInsets.all(10),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        child: const Text('Nova Transação', style: TextStyle(color: Colors.purple),),
                        onPressed: _submitform)
                      ,
                    ],
                  ),
                ]),
            ),
          );
  }
}