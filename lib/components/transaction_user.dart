// ignore_for_file: use_key_in_widget_constructors

import 'package:financial_app/models/transaction.dart';
import 'package:flutter/material.dart';
import 'transaction_form.dart';
import 'transaction_list.dart';


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
          value: 55.70,
          date: DateTime.now())
          ];

          
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionList(_transactions),
        TransactionForm(),
      ],
    );
  }
}