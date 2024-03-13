import 'package:financial_app/components/chart_bar.dart';
import 'package:financial_app/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class Chart extends StatelessWidget{

  final List<Transaction> recentTransaction;

  Chart(this.recentTransaction);

  List<Map<String, Object>> get groupedTrasaction{
    return List.generate(7, (index){

      //vai buscas o dia da semana
      final weekDay = DateTime.now().subtract(Duration(days: index));

      double totalsum = 0.0;

      for(var tr in recentTransaction){
        
        bool sameday = tr.date.day == weekDay.day;
        bool samemoth = tr.date.month == weekDay.month;
        bool sameyear = tr.date.year == weekDay.year;

        if(sameyear && samemoth && sameday){
          totalsum += tr.value;
        }

      }

      //print(DateFormat.E().format(weekDay)[0]);
      //print(totalsum);

      return {'day': DateFormat.E().format(weekDay)[0], 'value': totalsum};
    });
  }

  double get _weekTotalValue{
    return groupedTrasaction.fold(0.0, (previousValue, element) {
      return previousValue + (element['value'] as double);
    });
  }
 
  @override
  Widget build(BuildContext context){
    groupedTrasaction;

    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTrasaction.map((tr) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(tr['day'].toString(),double.parse(tr['value'].toString()), (tr['value'] as double) / _weekTotalValue)
            );
          }).toList()
          ),
      ),
      );
  }
}