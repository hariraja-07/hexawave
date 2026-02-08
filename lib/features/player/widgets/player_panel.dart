import 'package:flutter/material.dart';
import 'package:hexawave/features/player/widgets/control_buttons.dart';

class PlayerPanel extends StatelessWidget{
  const PlayerPanel({super.key});     

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Expanded(child: Text("")),
          Text("Player Panel"),
          ControlButtons(),
          Expanded(child: Text(""))
        ],
      ),
    );
  }
}