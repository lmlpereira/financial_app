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

  final _transactions = [];


  _addTransaction(String title, double value, DateTime data){
    final newTransaction = Transaction(id: Random().nextDouble().toString(), title: title, value: value, date: data);

    setState(() {
      _transactions.add(newTransaction);
    });
  }

          
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //TransactionList(_transactions, _re),
        TransactionForm(_addTransaction),
      ],
    );
  }
}