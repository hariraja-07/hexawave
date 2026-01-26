import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../logic/player_cubit.dart';

class ControlButtons extends StatelessWidget {
  const ControlButtons({super.key});

  @override   
  Widget build(BuildContext context){
    final cubit = context.read<PlayerCubit>() ; 

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          iconSize: 40,
          onPressed: cubit.play,
          icon: const Icon(Icons.play_arrow)
        ),
        IconButton(
          iconSize: 40,
          onPressed: cubit.pause, 
          icon: const Icon(Icons.pause)
        ),
        IconButton(
          iconSize: 40,
          onPressed: cubit.stop, 
          icon: Icon(Icons.stop)
        )
      ],
    );
  }
}