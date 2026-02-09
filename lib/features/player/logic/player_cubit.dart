import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:audioplayers/audioplayers.dart';

import '../../../shared/utils/file_scanner.dart';

enum PlayerStatus {idle , playing , paused , stopped}

class PlayerState{
  final PlayerStatus status;
  final String? songPath;
  final List<String> songs;
  final String? currentFolder;

  const PlayerState({
    required this.status,
    this.songPath,
    this.currentFolder,
    this.songs =const [],
  });

  String songNameAt(int index){
    return songs[index]
      .split('/')
      .last;
  }

  String getPath(){
    return songPath ?? '';
  }

  PlayerState copyWith({
    PlayerStatus? status,
    String? songPath,
    List<String>? songs,
    String? currentFolder
  }){
    return PlayerState(
      status: status ?? this.status,
      songPath: songPath ?? this.songPath,
      currentFolder: currentFolder,
      songs: songs ?? this.songs
    );
  }
}

class PlayerCubit extends Cubit<PlayerState>{
  final AudioPlayer _player = AudioPlayer();
  PlayerCubit() : super(const PlayerState(status: PlayerStatus.idle));

  void clearFolder(){
    emit(state.copyWith(currentFolder: null,songs: []));
  }

  void selectSong({
    int? index,
    String? songPath
    }){
    if(index!=null){
      emit(state.copyWith(currentFolder: state.currentFolder,songPath:state.songs[index]));
    }else if(songPath != null){
      emit(state.copyWith(currentFolder: state.currentFolder, songPath: songPath));
    }
  }

  Future<void> selectFolder(String? path) async{
    if(path==null){
      emit(state.copyWith(songs:[]));
      return;
    }
    final paths = await scanLocalMusicFiles(path);
    emit(state.copyWith(currentFolder: path,songs: paths));
  }

  void play(){
    final path = state.getPath();
    if(path != ''){
      _player.play(DeviceFileSource(path));
      emit(state.copyWith(currentFolder: state.currentFolder,status: PlayerStatus.playing));
    }
  }

  String getSong(int index){
    final path = state.songs[index];
    return path.split('/').last;
  }

  void pause(){
    _player.pause();
    emit(state.copyWith(currentFolder: state.currentFolder,status: PlayerStatus.paused));
  }

  void stop(){
    _player.stop();
    emit(state.copyWith(currentFolder: state.currentFolder,status: PlayerStatus.stopped));
  }

  @override  
  Future<void> close(){
    _player.dispose();
    return super.close();
  }
}