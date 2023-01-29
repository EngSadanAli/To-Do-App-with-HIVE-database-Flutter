import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:to_do_app/utils/dialog_box.dart';

import 'button.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  ToDoTile({
    super.key,
    required this.onChanged,
    required this.taskCompleted,
    required this.taskName,
    required this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Slidable(
        //delete Task Action slidable
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
        
            SlidableAction(
              foregroundColor: Colors.white54,
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Color.fromARGB(255, 97, 63, 13),
              borderRadius: BorderRadius.circular(15),
            ),
          ],
        ),
        //Edidt Task sliedable

        child: Card(
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  // Checkbox
                  Checkbox(
                    value: taskCompleted,
                    onChanged: onChanged,
                    activeColor: Color.fromARGB(255, 97, 63, 13),
                    checkColor: Colors.white54,
                  ),
                  // Task Name
                  Text(taskName,
                      style: TextStyle(
                          decoration: taskCompleted
                              ? TextDecoration.lineThrough
                              : TextDecoration.none)),
                ],
              ),
            )),
      ),
    );
  }
}
