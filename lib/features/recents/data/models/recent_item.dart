import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'recent_item.freezed.dart';
part 'recent_item.g.dart';

@freezed 
@HiveType(typeId:1)
class RecentItem with _$RecentItem {  
  factory RecentItem({
    @HiveField(0) 
    @Default(RecentType.track)
    RecentType type,
    @HiveField(1) required String path,
    @HiveField(2) required String title,
    @HiveField(3) 
    @Default(0)
    int lastAccessedMs,

  }) = _RecentItem;
}

@HiveType(typeId:2)
enum RecentType {
  @HiveField(0)
  track,

  @HiveField(1)
  folder,
}