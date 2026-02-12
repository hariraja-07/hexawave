import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexawave/features/player/logic/player_cubit.dart';
import 'package:hexawave/features/recents/logic/recent_cubit.dart';
import 'package:hexawave/features/recents/view/recent_panel.dart';
import 'package:hexawave/injection.dart';

class LibraryPanel extends StatelessWidget {
  const LibraryPanel({super.key});

  Future<void> _pickFolder(BuildContext context) async{
    final folderPath = await FilePicker.platform.getDirectoryPath();
    if(folderPath != null && context.mounted) {
      context.read<PlayerCubit>().selectFolder(folderPath);
    
        addFolderToRecent(context, folderPath);
    }
  }

  void addFolderToRecent(BuildContext context,String path){
    final title = context.read<PlayerCubit>().getSongTitle(path);
    context.read<RecentCubit>().addFolder(path: path, title: title);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      child: BlocSelector<PlayerCubit,PlayerState,bool>(
        selector: (state)=> state.currentFolder != null, 
        builder: (context,hasFolder){
          return hasFolder
            ? FileScreen(
              onBack: () => context.read<PlayerCubit>().clearFolder(),
            )
            : BaseScreen(
              onSelectFolder: () =>   _pickFolder(context),
            );
        }
      )
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
          child: BlocProvider(
            create: (_) => getIt<RecentCubit>(),
            child: const RecentPanel(),
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
              
              BlocSelector<PlayerCubit,PlayerState,String?>(
                selector:(state) => state.currentFolder,
                builder: (context,folder){
                  return Text(folder ?? "Selected Folder");
                },
              ),
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
                      state.songNameAt(index),
                      maxLines: 1,
                    ),
                    onTap: (){
                      context
                        .read<PlayerCubit>()
                        .selectSong(index:index);

                      final path = state.songs[index];
                      final title = context.read<PlayerCubit>().getSongTitle(path);

                      context
                        .read<RecentCubit>()
                        .addTrack(path: path, title: title );
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
