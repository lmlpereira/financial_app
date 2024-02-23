// ignore_for_file: use_key_in_widget_constructors

import 'dart:math';

import 'package:financial_app/components/transaction_form.dart';
import 'package:financial_app/components/transaction_list.dart';
import 'package:financial_app/models/transaction.dart';
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

class MyHomePage extends StatefulWidget{

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _transactions = [
        Transaction(
          id:"t1",
          title: "Tenis de corrida",
          value: 310.70,
          date: DateTime.now()),
        Transaction(
          id:"t2",
          title: "Conta de Luz",
          value: 155.70,
          date: DateTime.now()),
          Transaction(
          id:"t3",
          title: "Conta de Luz1",
          value: 155.70,
          date: DateTime.now()),
          Transaction(
          id:"t20",
          title: "Conta de Luz 3",
          value: 155.70,
          date: DateTime.now()),
          Transaction(
          id:"t10",
          title: "Conta de Luz 10",
          value: 155.70,
          date: DateTime.now()),
          Transaction(
          id:"11",
          title: "Conta de Luz 11",
          value: 155.70,
          date: DateTime.now()),
          Transaction(
          id:"12",
          title: "Conta de Luz 12",
          value: 155.70,
          date: DateTime.now()),
          Transaction(
          id:"13",
          title: "Conta de Luz 13",
          value: 155.70,
          date: DateTime.now())
          ];


  _addTransaction(String title, double value){
    final newTransaction = Transaction(id: Random().nextDouble().toString(), title: title, value: value, date: DateTime.now());

    setState(() {
      _transactions.add(newTransaction);
    });
  }



  _openTransactionFormModal(BuildContext context){
    showModalBottomSheet(
      context: context, 
      builder: (ctx){
        return TransactionForm(_addTransaction);
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Personal Expenses'), actions: [IconButton(onPressed: () => _openTransactionFormModal(context), icon: const Icon(Icons.add))],),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
             Container(
              child: 
                Card(child: Text('Grafico'), elevation: 5, color: Colors.blue,)
            ), 
            //TransactionUser()
            TransactionList(_transactions),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(child: const Icon(Icons.add), onPressed: () => _openTransactionFormModal(context),),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}