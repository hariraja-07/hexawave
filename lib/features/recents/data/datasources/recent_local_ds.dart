import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

import '../models/recent_item.dart';

@lazySingleton
class RecentLocalDataSource {
  static const _boxName = 'recents';

  Box<String> get _box => Hive.box<String>(_boxName);

  List<RecentItem> getAll() {
    final items = _box.values
       .map((jsonString){
          final json = jsonDecode(jsonString) as Map<String,dynamic>;
          return RecentItem.fromJson(json);
        })
       .toList()
      ..sort((a,b)=>b.lastAccessedMs.compareTo(a.lastAccessedMs));
    return items;  
  }

  void save(RecentItem item){
    final jsonString = jsonEncode(item.toJson());
    _box.put(item.path,jsonString);
  }

  void trimToLimit(int limit){
    final allItems = getAll();

    final tracks = allItems.where((i) => i.type == RecentType.track).toList();
    final folders = allItems.where((i) => i.type == RecentType.folder).toList();

    if(tracks.length > limit){
      for(final item in tracks.skip(limit)){
        _box.delete(item.path);
      }
    }

    if(folders.length > limit){
      for(final item in folders.skip(limit)){
        _box.delete(item.path);
      }
    }
  }
}