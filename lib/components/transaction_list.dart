
// ignore_for_file: use_key_in_widget_constructors

import 'package:financial_app/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget{

  final List<Transaction> transactions;
  final void Function (String) onRemove;

  const TransactionList(this.transactions, this.onRemove);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: transactions.isEmpty ? Column(children: [
        const SizedBox(height: 20),
        Text('Nenhuma transação registada', style: Theme.of(context).textTheme.titleLarge,),
        const SizedBox(height: 20),
        SizedBox(height: 200, child: Image.asset('assets/images/waiting.png', fit: BoxFit.cover,))
      ],) : ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (context, index){
                final tr = transactions[index];
                return Card(
                  elevation: 5,
                  margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: FittedBox(
                          child: Text('€${tr.value}'),
                        ),
                      ),
                    ),
                    title: Text(tr.title, style: Theme.of(context).textTheme.titleLarge,),
                    subtitle: Text(DateFormat('d MMM y').format(tr.date),),
                    trailing:IconButton(
                        icon: Icon(Icons.delete), 
                        onPressed: () {
                          onRemove(tr.id);
                        }, 
                        color: Theme.of(context).errorColor,
                      ),
                    
                  ),
                );
            } ,
            ),
    );
  }
  

  
}