import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexawave/features/player/widgets/control_buttons.dart';
import 'package:hexawave/features/player/logic/player_cubit.dart';

class PlayerPanel extends StatelessWidget{
  const PlayerPanel({super.key});     

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Expanded(child: Text("")),
          BlocSelector<PlayerCubit,PlayerState,String>(
            selector: (state)=>state.getPath(), 
            builder: (context,path){
              return Text(context.read<PlayerCubit>().getSongTitle(path));
            }
          ),
          ControlButtons(),
          Expanded(child: Text(""))
        ],
      ),
    );
  }
}