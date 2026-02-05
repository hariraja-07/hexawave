import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../logic/player_cubit.dart';        

class PlayerScreen extends StatelessWidget{
  const PlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HexaWave"),
      ),

      body: Row(
        children: [
          Expanded(
            flex: 3,
            child: Center(
              child:Text("Library Panel"),
            ),
          ),

          const VerticalDivider(
            width: 1,
          ),

          Expanded(
            flex: 2,
            child: Center(
              child: Text("Player Panel"),
            ),
          )
        ],
      )
    );
  }
}