// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recent_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RecentItem _$RecentItemFromJson(Map<String, dynamic> json) {
  return _RecentItem.fromJson(json);
}

/// @nodoc
mixin _$RecentItem {
  RecentType get type => throw _privateConstructorUsedError;
  String get path => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  int get lastAccessedMs => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecentItemCopyWith<RecentItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecentItemCopyWith<$Res> {
  factory $RecentItemCopyWith(
          RecentItem value, $Res Function(RecentItem) then) =
      _$RecentItemCopyWithImpl<$Res, RecentItem>;
  @useResult
  $Res call({RecentType type, String path, String title, int lastAccessedMs});
}

/// @nodoc
class _$RecentItemCopyWithImpl<$Res, $Val extends RecentItem>
    implements $RecentItemCopyWith<$Res> {
  _$RecentItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? path = null,
    Object? title = null,
    Object? lastAccessedMs = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as RecentType,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      lastAccessedMs: null == lastAccessedMs
          ? _value.lastAccessedMs
          : lastAccessedMs // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecentItemImplCopyWith<$Res>
    implements $RecentItemCopyWith<$Res> {
  factory _$$RecentItemImplCopyWith(
          _$RecentItemImpl value, $Res Function(_$RecentItemImpl) then) =
      __$$RecentItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({RecentType type, String path, String title, int lastAccessedMs});
}

/// @nodoc
class __$$RecentItemImplCopyWithImpl<$Res>
    extends _$RecentItemCopyWithImpl<$Res, _$RecentItemImpl>
    implements _$$RecentItemImplCopyWith<$Res> {
  __$$RecentItemImplCopyWithImpl(
      _$RecentItemImpl _value, $Res Function(_$RecentItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? path = null,
    Object? title = null,
    Object? lastAccessedMs = null,
  }) {
    return _then(_$RecentItemImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as RecentType,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      lastAccessedMs: null == lastAccessedMs
          ? _value.lastAccessedMs
          : lastAccessedMs // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RecentItemImpl implements _RecentItem {
  const _$RecentItemImpl(
      {this.type = RecentType.track,
      required this.path,
      required this.title,
      this.lastAccessedMs = 0});

  factory _$RecentItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecentItemImplFromJson(json);

  @override
  @JsonKey()
  final RecentType type;
  @override
  final String path;
  @override
  final String title;
  @override
  @JsonKey()
  final int lastAccessedMs;

  @override
  String toString() {
    return 'RecentItem(type: $type, path: $path, title: $title, lastAccessedMs: $lastAccessedMs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecentItemImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.lastAccessedMs, lastAccessedMs) ||
                other.lastAccessedMs == lastAccessedMs));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, type, path, title, lastAccessedMs);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RecentItemImplCopyWith<_$RecentItemImpl> get copyWith =>
      __$$RecentItemImplCopyWithImpl<_$RecentItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecentItemImplToJson(
      this,
    );
  }
}

abstract class _RecentItem implements RecentItem {
  const factory _RecentItem(
      {final RecentType type,
      required final String path,
      required final String title,
      final int lastAccessedMs}) = _$RecentItemImpl;

  factory _RecentItem.fromJson(Map<String, dynamic> json) =
      _$RecentItemImpl.fromJson;

  @override
  RecentType get type;
  @override
  String get path;
  @override
  String get title;
  @override
  int get lastAccessedMs;
  @override
  @JsonKey(ignore: true)
  _$$RecentItemImplCopyWith<_$RecentItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
