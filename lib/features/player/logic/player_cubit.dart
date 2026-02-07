import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:audioplayers/audioplayers.dart';

import '../../../shared/utils/file_scanner.dart';

enum PlayerStatus {idle , playing , paused , stopped}

class PlayerState{
  final PlayerStatus status;
  final String? filePath;
  final List<String> songs;
  
  const PlayerState({
    required this.status,
    this.filePath,
    this.songs =const [],
  });

  String getPath(){
    return filePath ?? '';
  }

  PlayerState copyWith({
    PlayerStatus? status,
    String? filePath,
    List<String>? songs,
  }){
    return PlayerState(
      status: status ?? this.status,
      filePath: filePath ?? this.filePath,
      songs: songs ?? this.songs
    );
  }
}

class PlayerCubit extends Cubit<PlayerState>{
  final AudioPlayer _player = AudioPlayer();
  PlayerCubit() : super(const PlayerState(status: PlayerStatus.idle));
  
  void loadPath(String path){
    emit(state.copyWith(filePath: path));
  }

  Future<void> loadMusicFolder(String? path) async{
    if(path==null){
      emit(state.copyWith(songs:[]));
      return;
    }
    final paths = await scanLocalMusicFiles(path);
    emit(state.copyWith(songs: paths));
  }

  void play(){
    final path = state.getPath();
    if(path != ''){
      _player.play(DeviceFileSource(path));
      emit(state.copyWith(status: PlayerStatus.playing));
    }
  }

  void pause(){
    _player.pause();
    emit(state.copyWith(status: PlayerStatus.paused));
  }

  void stop(){
    _player.stop();
    emit(state.copyWith(status: PlayerStatus.stopped));
  }

  @override  
  Future<void> close(){
    _player.dispose();
    return super.close();
  }
}