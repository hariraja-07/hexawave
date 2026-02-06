import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexawave/features/player/widgets/library_panel.dart';
import 'package:hexawave/features/player/widgets/player_panel.dart';
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
            child: LibraryPanel() 
          ),

          const VerticalDivider(
            width: 1,
          ),

          Expanded(
            flex: 2,
            child: Center(
              child: PlayerPanel(),
            ),
          )
        ],
      )
    );
  }
}