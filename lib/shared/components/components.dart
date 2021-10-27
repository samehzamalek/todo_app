import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/shared/cubit/cubit.dart';

Widget buildtaskItem(Map model, context) => Dismissible(
      key: Key(model["id"].toString()),
      onDismissed: (direction) {
        AppCubit.get(context).deleteData(id: model["id"]);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 40,
              child: Text(
                '${model["time"]}',
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,

                crossAxisAlignment: CrossAxisAlignment.start,

                //  mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Text(
                    '${model["title"]}',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${model["date"]}',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 20,
            ),
            IconButton(
                onPressed: () {
                  AppCubit.get(context)
                      .updateData(status: "done", id: model["id"]);
                },
                icon: Icon(
                  Icons.check_box,
                  color: Colors.green,
                )),
            IconButton(
                onPressed: () {
                  AppCubit.get(context)
                      .updateData(status: "archive", id: model["id"]);
                },
                icon: Icon(
                  Icons.archive,
                  color: Colors.grey,
                )),
          ],
        ),
      ),
    );
