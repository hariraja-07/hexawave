import 'package:flutter/material.dart';

class RecentPanel extends StatelessWidget{
  const RecentPanel({super.key});

  @override 
  Widget build(BuildContext context){
    return  Column(
      children: [
        Expanded(
          flex: 3,
          child: Text("Recent Songs")
        ),
    
        Expanded(
          flex: 2,
          child: Text("Recent Folders")
        )
      ],
    );
  }
}