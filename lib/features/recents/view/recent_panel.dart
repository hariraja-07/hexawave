import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/models/recent_item.dart';
import '../logic/recent_cubit.dart';

class RecentPanel extends StatelessWidget{
  const RecentPanel({super.key});

  @override 
  Widget build(BuildContext context){
    return BlocBuilder<RecentCubit,List<RecentItem>>(
      builder: (context,recents){
        final tracks = recents
          .where((item)=>item.type == RecentType.track)
          .toList();
        
        final folders = recents
          .where((item)=>item.type == RecentType.folder)
          .toList();

        return Column(
          children: [
            Expanded(
              flex: 3,
              child: tracks.isEmpty 
              ? const Center(child: Text("No Recent Songs"),)
              : ListView.builder(
                itemCount:tracks.length ,
                itemBuilder: (context,index){
                  final item = tracks[index];
                  return ListTile(
                    leading: const Icon(Icons.music_note),
                    title: Text(item.title),
                    subtitle: Text(item.path),
                  );
                },
              ),
            ),

            Expanded(
              flex: 2,
              child: folders.isEmpty
              ? const Center(child: Text("No Recent Folders"),)
              : ListView.builder(
                itemCount: folders.length,
                itemBuilder: (context,index){
                  final item = folders[index];
                  return ListTile(
                    leading: const Icon(Icons.folder),
                    title: Text(item.title),
                    subtitle: Text(item.path),
                  );
                },
              ),
            )
          ],
        );
      }
    );
  }
}