import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class AdaptativeEditText extends StatelessWidget{

  final String label;
  final Function (String) onSubmit;
  final TextEditingController controller;
  final TextInputType keyboardType;


  AdaptativeEditText({required this.label, required this.onSubmit, required this.controller, required this.keyboardType});
  
  @override
  Widget build(BuildContext context) {
    return Platform.isIOS ? Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: CupertinoTextField(
        placeholder: label,
        controller: controller,
        onSubmitted:  onSubmit,
        keyboardType: keyboardType,
        padding: EdgeInsets.symmetric(horizontal: 6, vertical: 12),
        
      ),
    ) : TextField(
                      controller: controller,
                      keyboardType: keyboardType,
                      onSubmitted: onSubmit,
                      decoration: InputDecoration(
                        labelText: label,
                      ),);
  }
  
}