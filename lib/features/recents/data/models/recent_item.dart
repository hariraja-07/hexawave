import 'package:freezed_annotation/freezed_annotation.dart';

part 'recent_item.freezed.dart';
part 'recent_item.g.dart';

@freezed
class RecentItem with _$RecentItem {  
  const factory RecentItem({
    @Default(RecentType.track) RecentType type,
    required String path,
    required String title,
    @Default(0) int lastAccessedMs,
  }) = _RecentItem;

  factory RecentItem.fromJson(Map<String,dynamic> json) => 
    _$RecentItemFromJson(json);
}

enum RecentType {track,folder}