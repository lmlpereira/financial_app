import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class AdaptativeEditText extends StatelessWidget{

  final String label;
  final Function () onSubmit;
  final TextEditingController controller;
  final TextInputType keyboardType;


  AdaptativeEditText({required this.label, required this.onSubmit, required this.controller, required this.keyboardType});
  
  @override
  Widget build(BuildContext context) {
    return Platform.isIOS ? CupertinoTextField(
      placeholder: label,
      controller: controller,
      onSubmitted: (_) => onSubmit,
      keyboardType: keyboardType,
    ) : TextField(
                      controller: controller,
                      keyboardType: keyboardType,
                      onSubmitted: (_) => onSubmit,
                      decoration: InputDecoration(
                        labelText: label,
                      ),);
  }
  
}