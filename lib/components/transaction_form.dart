import 'dart:ffi';

import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {

  final titleController = TextEditingController();
  final valueController = TextEditingController();

  final void Function (String,double) onSubmit;
  
  TransactionForm(this.onSubmit);

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
                    decoration: InputDecoration(
                      labelText: "Titulo",
                    ),),
                  TextField(
                    controller: valueController,
                    decoration: InputDecoration(
                      labelText: "Valor (€)",
                    ),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        child: const Text('Nova Transação', style: TextStyle(color: Colors.purple),),
                        onPressed: (){
                          onSubmit(titleController.text, double.tryParse(valueController.text) ?? 0.0);
                          //print(titleController.text);
                          //print(valueController.text);
                        })
                      ,
                    ],
                  ),
                ]),
            ),
          );
  }
}