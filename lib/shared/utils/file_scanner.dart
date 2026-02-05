import 'dart:io';
import '../constants/audio_extensions.dart';

Future<List<String>> scanLocalMusicFiles(List<String> directories) async {
  final List<String> musicPaths = [];

  for(final dirPath in directories){
    final dir = Directory(dirPath);

    if(!await dir.exists()) continue;
    
    try{
      await for(final entity in dir.list(
        recursive: true,
        followLinks: false
      )){
        if(_isHidden(entity.path)) continue;

        if(entity is File){
print('FOUND FILE: ${entity.path}');
        }
        
        if(entity is File && _isAudioFile(entity.path)){
          musicPaths.add(entity.path);
        }
      }
    } on FileSystemException {
      continue;
    }
  }

  return musicPaths;
}

bool _isHidden(String path){
  return path
    .split(Platform.pathSeparator)
    .any((segment) => segment.startsWith("."));
}

bool _isAudioFile(String path){
  final lower = path.toLowerCase();
  return audioExtensions.any(lower.endsWith);
}