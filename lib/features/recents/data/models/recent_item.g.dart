// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recent_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecentItemImpl _$$RecentItemImplFromJson(Map<String, dynamic> json) =>
    _$RecentItemImpl(
      type: $enumDecodeNullable(_$RecentTypeEnumMap, json['type']) ??
          RecentType.track,
      path: json['path'] as String,
      title: json['title'] as String,
      lastAccessedMs: (json['lastAccessedMs'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$RecentItemImplToJson(_$RecentItemImpl instance) =>
    <String, dynamic>{
      'type': _$RecentTypeEnumMap[instance.type]!,
      'path': instance.path,
      'title': instance.title,
      'lastAccessedMs': instance.lastAccessedMs,
    };

const _$RecentTypeEnumMap = {
  RecentType.track: 'track',
  RecentType.folder: 'folder',
};
