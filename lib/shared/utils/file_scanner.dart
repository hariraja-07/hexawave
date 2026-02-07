import 'dart:io';
import '../constants/audio_extensions.dart';

Future<List<String>> scanLocalMusicFiles(String dirPath) async {
  final List<String> musicPaths = [];

  final dir = Directory(dirPath);
  if(!await dir.exists()) return musicPaths;
  try{
    await for(final entity in dir.list()){
      if(_isHidden(entity.path)) continue;

      if(entity is File && _isAudioFile(entity.path)){
        musicPaths.add(entity.path);
      }
    }
  } on FileSystemException {
    return musicPaths;
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