import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  DialogBox(
      {super.key,
      required this.controller,
      required this.onCancel,
      required this.onSave});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).primaryColor,
      content: Container(
        height: 120,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextField(
                controller: controller,
                decoration: InputDecoration(
                    hintText: 'Add a New Task', border: OutlineInputBorder()),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  //add button
                  Button(
                    onPressed: onSave,
                    title: 'Save',
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  //Cancil button
                  Button(
                    onPressed: onCancel,
                    title: 'Cancel',
                  ),
                ],
              )
            ]),
      ),
    );
  }
}
