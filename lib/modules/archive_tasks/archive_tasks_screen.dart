import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/shared/components/components.dart';
import 'package:todo_app/shared/cubit/cubit.dart';
import 'package:todo_app/shared/cubit/states.dart';

class ArchiveTasksScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<AppCubit,AppStates>(
      listener:(context,state){} ,
      builder: (context,state)

      {  var tasks=AppCubit.get(context).archivedTasks;
      return tasks.length>0?  ListView.separated(
          itemBuilder: (context,index){
            return buildtaskItem(tasks[index],context);},
          separatorBuilder:(context,index){
            return Container(
              width: double.infinity,
              height: 1,
              color: Colors.grey[300],
            );

          }  ,
          itemCount: tasks.length):Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.menu,size: 60,color: Colors.grey,),
            Text("No Tasks Yet, Please Add Some Tasks "
              ,style: TextStyle(fontSize: 20,color: Colors.grey,fontWeight: FontWeight.bold),
            )

          ],

        ),
      );},

    );
      
      
      
      
     

  }
}
