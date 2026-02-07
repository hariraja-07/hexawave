import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexawave/features/player/logic/player_cubit.dart';

class LibraryPanel extends StatefulWidget {
  const LibraryPanel({super.key});

  @override
  State<LibraryPanel> createState() => _LibraryPanelState();
}

class _LibraryPanelState extends State<LibraryPanel> {
  bool showFileScreen = false;
  String? selectedFolder;

  Future<void> selectFolder() async{
    final folderPath = await FilePicker.platform.getDirectoryPath();
    if(folderPath == null) return;

    if(!mounted) return;

    context.read<PlayerCubit>().loadMusicFolder(folderPath);
    setState(() {
      selectedFolder= folderPath;
      showFileScreen = true;
    });
  }

  void goBack(){
    setState(() {
      showFileScreen = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      child: showFileScreen 
      ? FileScreen(onBack : goBack) 
      : BaseScreen(onSelectFolder : selectFolder),
    );
  }
}

class BaseScreen extends StatelessWidget{
  final VoidCallback onSelectFolder;

  const BaseScreen({
    super.key,
    required this.onSelectFolder,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Container(
              color: Colors.blue,
            ),
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: onSelectFolder,
            child: Text("Select Folder")
            ),
        )
      ],
    );
  }
}

class FileScreen extends StatelessWidget{
  final VoidCallback onBack;

  const FileScreen({
    super.key,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            children: [
              IconButton(
                onPressed:onBack, 
                icon: Icon(Icons.arrow_back,size: 20,)
              ),
              const SizedBox(width: 8,),
              const Text("Selected Folder")
            ],
          ),
        ),
        Expanded(
          child: BlocBuilder<PlayerCubit,PlayerState>(
            builder: (context,state){
              if(state.songs.isEmpty){
                return const Center(
                  child: Text("No Music found"),
                );
              }

              return ListView.builder(
                itemCount: state.songs.length,
                itemBuilder: (context,index){
                  return ListTile(
                    title: Text(
                      state.songs[index].split('/').last,
                      maxLines: 1,
                    ),
                    onTap: (){
                      context
                        .read<PlayerCubit>()
                        .loadPath(state.songs[index]);
                    },
                  );
                },
              );
            },
          ),
        )
      ],
    );
  }
}
