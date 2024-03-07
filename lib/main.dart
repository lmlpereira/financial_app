// ignore_for_file: use_key_in_widget_constructors, sort_child_properties_last

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
    final ThemeData tema = ThemeData();

    return MaterialApp(home: MyHomePage(),
     theme: tema.copyWith(
        colorScheme: tema.colorScheme.copyWith(
          primary: Colors.purple,
          secondary: Colors.amber,
          
        ),
        textTheme: tema.textTheme.copyWith(
          titleLarge: const TextStyle(
            fontFamily: 'Quicksand',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
         appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),)
        );
  }

}

class MyHomePage extends StatefulWidget{

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions = [];


  _addTransaction(String title, double value){
    final newTransaction = Transaction(id: Random().nextDouble().toString(), title: title, value: value, date: DateTime.now());

    setState(() {
      _transactions.add(newTransaction);
    });

    //Fechar o modal form
    Navigator.of(context).pop();

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
      appBar: AppBar(title: const Text('Personal Expenses',), actions: [IconButton(onPressed: () => _openTransactionFormModal(context), icon: const Icon(Icons.add))],),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
             const Card(child: Text('Grafico'), elevation: 5, color: Colors.blue,), 
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