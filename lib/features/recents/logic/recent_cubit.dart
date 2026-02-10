import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../data/datasources/recent_local_ds.dart';
import '../data/models/recent_item.dart';

@injectable 
class RecentCubit extends Cubit<List<RecentItem>>{
  RecentCubit(this._local) : super([]);

  final RecentLocalDataSource _local;

  void loadRecents(){
    emit(_local.getAll());
  }

  void addTrack({
    required String path,
    required String title,
  }){
    final item = RecentItem(
      type: RecentType.track,
      path: path, 
      title: title,
      lastAccessedMs: DateTime.now().millisecondsSinceEpoch,
    );

    _local.save(item);
    _local.trimToLimit(10);
    loadRecents();
  }

  void addFolder({
    required String path,
    required String title,
  }){
    final item = RecentItem(
      type: RecentType.folder,
      path: path, 
      title: title,
      lastAccessedMs: DateTime.now().microsecondsSinceEpoch,
    );

    _local.save(item);
    _local.trimToLimit(10);
    loadRecents();
  }
}