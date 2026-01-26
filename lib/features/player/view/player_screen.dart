import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../logic/player_cubit.dart';
import '../widgets/control_buttons.dart';

class PlayerScreen extends StatelessWidget{
    const PlayerScreen({super.key});

    Future<void> _pickMusic(BuildContext context) async{
        final result = await FilePicker.platform.pickFiles(
            type: FileType.audio,
        );
        if(result != null && result.files.single.path != null){
            context
                .read<PlayerCubit>()
                .loadPath(result.files.single.path!);
        }
    }

    @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("HexaWave"),
        ),

        body: BlocBuilder<PlayerCubit,PlayerState>(
            builder: (context , state){
                return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        Text(
                            state.filePath ?? 'No file selected',
                            textAlign: TextAlign.center,
                        ),

                        const SizedBox(height: 20,),

                        ElevatedButton(onPressed: () => _pickMusic(context), child: const Text("Choose Music")),

                        const SizedBox(height: 30,),

                        const ControlButtons(),

                        const SizedBox(height: 20,),                        

                        Text('Status : ${state.status.name}')
                    ],
                );
            },
        ),
    );
  }
}
