// ignore_for_file: use_key_in_widget_constructors

import 'dart:math';

import 'package:financial_app/components/transaction_form.dart';
import 'package:financial_app/components/transaction_list.dart';
import 'package:financial_app/models/transaction.dart';
import 'package:flutter/material.dart';



class TransactionUser extends StatefulWidget {

  @override
  State<TransactionUser> createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {

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

          
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionList(_transactions),
        TransactionForm(_addTransaction),
      ],
    );
  }
}