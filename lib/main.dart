// ignore_for_file: use_key_in_widget_constructors, sort_child_properties_last

import 'dart:io';
import 'dart:math';

import 'package:financial_app/components/chart.dart';
import 'package:financial_app/components/transaction_form.dart';
import 'package:financial_app/components/transaction_list.dart';
import 'package:financial_app/models/transaction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


void main(List<String> args) {
  runApp(ExpensesApp());
}

class ExpensesApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    final ThemeData tema = ThemeData();

    //SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeRight]);

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
  bool _showChart = false;


  List<Transaction> get _recentTransactions{
    return _transactions.where((tr) {
      return tr.date.isAfter(DateTime.now().subtract(const Duration(days: 7)));
    }).toList();
  }


  _addTransaction(String title, double value, DateTime date){
    final newTransaction = Transaction(id: Random().nextDouble().toString(), title: title, value: value, date: date);

    setState(() {
      _transactions.add(newTransaction);
    });

    //Fechar o modal form
    Navigator.of(context).pop();

  }

  _removeTransaction(String id){
    
    setState(() {
      _transactions.removeWhere((element) {
          return element.id == id;
      });
    });

  }

  _openTransactionFormModal(BuildContext context){
    showModalBottomSheet(
      context: context, 
      builder: (_){
        return TransactionForm(_addTransaction);
      }
    );
  }

  Widget _getIconButton(IconData icon, Function () fn){
    return Platform.isIOS ? 
      GestureDetector(
        onTap: fn, child: Icon(icon),
      ) :
      IconButton(
          onPressed: fn, 
          icon: Icon(icon)
        );
  }

  @override
  Widget build(BuildContext context) {

    bool islandscape = MediaQuery.of(context).orientation == Orientation.landscape;

    final iconList = Platform.isIOS ? CupertinoIcons.list_bullet : Icons.list;
    final chartList = Platform.isIOS ? CupertinoIcons.chart_bar : Icons.bar_chart;


    final actions = [
        if(islandscape)
          _getIconButton(
            _showChart ? iconList : chartList,
            (){
              setState(() {
                _showChart = !_showChart;
              });
            } 
          ),
          _getIconButton(
            Platform.isIOS ? CupertinoIcons.add : Icons.add,
            () => _openTransactionFormModal(context),

          ),
        ];


    final appbar =  AppBar(
      title: Text('Personal Expenses', 
        style: TextStyle(
          fontSize: 20 * MediaQuery.of(context).textScaleFactor,),
        ), 
      actions: actions,
    );

    final availableHeight = MediaQuery.of(context).size.height - appbar.preferredSize.height - MediaQuery.of(context).padding.top * 2 ;

    final pagebody = SafeArea(
      child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
    
              /*if(islandscape)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Exibir Gráfico"),
                  Switch.adaptive(value: _showChart, onChanged: (value){
                    setState(() {
                      _showChart = value;
                    });
                  }),
                ],
              ),*/
              if(_showChart || !islandscape)
                Container(      
                  height: MediaQuery.of(context).size.height * (islandscape ? 0.65 : 0.25),
                  child: Chart(_recentTransactions),
                ),
              
              if(!_showChart || !islandscape)
              Container(
                height: availableHeight * (islandscape ? 1 : 0.75),
                child: TransactionList(_transactions, _removeTransaction),
              ),
    
            ],
          ),
        ),
    );
//print(availableHeight);
    return Platform.isIOS ? CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
              middle: Text('Personal Expenses'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: actions,
              ),
            ),
      child: pagebody,
      
      ): Scaffold(
        appBar: appbar,
        body: pagebody,
        floatingActionButton: Platform.isIOS ? Container() : FloatingActionButton(child: const Icon(Icons.add), onPressed: () => _openTransactionFormModal(context),),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      );
  }
}