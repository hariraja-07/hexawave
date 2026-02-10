import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

import '../models/recent_item.dart';

@lazySingleton
class RecentLocalDataSource {
  static const _boxName = 'recents';

  Box<RecentItem> get _box => Hive.box<RecentItem>(_boxName);

  List<RecentItem> getAll() {
    final items = _box.values.toList()
      ..sort((a,b)=>b.lastAccessedMs.compareTo(a.lastAccessedMs));
    return items;
  }

  void save(RecentItem item){
    _box.put(item.path, item);
  }

  void trimToLimit(int limit){
    final items = getAll();
    if(items.length<=limit) return;

    for(final item in items.skip(limit)){
      _box.delete(item.path);
    }
  }
}