import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:intl/intl.dart';

class AdaptativeDatePicker extends StatelessWidget{


  final DateTime selectedDate;
  final Function(DateTime) onDateChange;

  _showDatePicker(BuildContext context){
    
    showDatePicker(
      context: context, 
      initialDate: DateTime.now(), 
      firstDate: DateTime(2019), 
      lastDate: DateTime.now()
    ).then((value) { 
      //selectedDate = value
      if(value == null){
        return;

      }
      
      onDateChange(value);
      /*setState(() {
        _selectedDate = value;

      });*/

    });
  }



  AdaptativeDatePicker({required this.selectedDate, required this.onDateChange });
  
  @override
  Widget build(BuildContext context) {
    return Platform.isIOS ? Container(
      height: 180,
      child: CupertinoDatePicker(
        mode: CupertinoDatePickerMode.date,
        maximumDate: DateTime.now(),
        initialDateTime: DateTime.now(),
        minimumDate: DateTime(1995),
        onDateTimeChanged: onDateChange,
        
      ),
    ) : Container(
                      height: 70,
                      child: Row(
                        children: [
                          Expanded(
                            child: 
                              Text(selectedDate == null ? 'Nenhuma data selecionada!' : 'Data Selecionada: ${DateFormat("dd/MM/y").format(selectedDate)}')
                          ),
                          TextButton(               
                            onPressed: () =>  _showDatePicker(context), 
                            child: Text("Selecionar Data", style: TextStyle(color:Theme.of(context).primaryColor, fontWeight: FontWeight.bold ),))
                        ],
                      ),
                    );
  }
  
}