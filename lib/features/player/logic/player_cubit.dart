import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:audioplayers/audioplayers.dart';

enum PlayerStatus {idle , playing , paused , stopped}

class PlayerState{
  final PlayerStatus status;
  final String? filePath;
  
  const PlayerState({
    required this.status,
    this.filePath
  });

  String getPath(){
    return filePath ?? '';
  }

  PlayerState copyWith({
    PlayerStatus? status,
    String? filePath
  }){
    return PlayerState(
      status: status ?? this.status,
      filePath: filePath ?? this.filePath
    );
  }
}

class PlayerCubit extends Cubit<PlayerState>{
  final AudioPlayer _player = AudioPlayer();
  PlayerCubit() : super(const PlayerState(status: PlayerStatus.idle));
  
  void loadPath(String path){
    emit(state.copyWith(filePath: path));
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