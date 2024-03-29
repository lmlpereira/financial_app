
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
    return transactions.isEmpty ? LayoutBuilder(builder: (ctx, constrainst){
      return Column(children: [
      SizedBox(height: 20),
      Text('Nenhuma transação registada', style: Theme.of(context).textTheme.titleLarge,),
      SizedBox(height: 20),
      SizedBox(height: constrainst.maxHeight * 0.6, child: Image.asset('assets/images/waiting.png', fit: BoxFit.cover,))
    ],);
    }) : ListView.builder(
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
                  trailing: MediaQuery.of(context).size.width > 480 ?
                  ElevatedButton.icon(
                    onPressed: () {
                        onRemove(tr.id);
                      },  
                    icon: Icon(Icons.delete), 
                    label: Text("Eliminar"),
                    //style: ButtonStyle(iconColor: Color(Theme.of(context).errorColor),
                    
                    //color: Theme.of(context).errorColor,
                    )
                  
                  
                  : IconButton(
                      icon: Icon(Icons.delete), 
                      onPressed: () {
                        onRemove(tr.id);
                      }, 
                      color: Theme.of(context).errorColor,
                    ),
                  
                ),
              );
          } ,
          );
  }
  

  
}