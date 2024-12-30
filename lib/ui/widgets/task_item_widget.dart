import 'package:flutter/material.dart';

class TaskItemWidget extends StatelessWidget {
  const TaskItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 0,
      child: ListTile(
          title: Text('Title will be here'),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Description will be here'),
              Text('Date: 30-12-2024'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16,vertical: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.lightBlue,
                    ),
                    child: Text('New', style: TextStyle(
                        color: Colors.white
                    ),),
                  ),
                  Row(
                    children: [
                      IconButton(onPressed: (){}, icon: Icon(Icons.delete,color: Colors.red,)),
                      IconButton(onPressed: (){}, icon: Icon(Icons.edit, color: Colors.indigoAccent,)),
                    ],
                  )
                ],
              )
            ],
          )
      ),
    );
  }
}
