// ignore_for_file: use_key_in_widget_constructors

import 'package:financial_app/components/transaction_user.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(ExpensesApp());
}

class ExpensesApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(home: MyHomePage(),);
  }

}

class MyHomePage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Personal Expenses')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
             Container(
              child: 
                Card(child: Text('Grafico'), elevation: 5, color: Colors.blue,)
            ), 
            TransactionUser()
          ],
        ),
      )
    );
  }

  
    
 }