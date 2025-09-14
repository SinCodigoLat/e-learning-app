// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mentor_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MentorResponseDto _$MentorResponseDtoFromJson(Map<String, dynamic> json) {
  return _MentorResponseDto.fromJson(json);
}

/// @nodoc
mixin _$MentorResponseDto {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get avatarUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MentorResponseDtoCopyWith<MentorResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MentorResponseDtoCopyWith<$Res> {
  factory $MentorResponseDtoCopyWith(
          MentorResponseDto value, $Res Function(MentorResponseDto) then) =
      _$MentorResponseDtoCopyWithImpl<$Res, MentorResponseDto>;
  @useResult
  $Res call({String? id, String? name, String? title, String? avatarUrl});
}

/// @nodoc
class _$MentorResponseDtoCopyWithImpl<$Res, $Val extends MentorResponseDto>
    implements $MentorResponseDtoCopyWith<$Res> {
  _$MentorResponseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? title = freezed,
    Object? avatarUrl = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MentorResponseDtoImplCopyWith<$Res>
    implements $MentorResponseDtoCopyWith<$Res> {
  factory _$$MentorResponseDtoImplCopyWith(_$MentorResponseDtoImpl value,
          $Res Function(_$MentorResponseDtoImpl) then) =
      __$$MentorResponseDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, String? name, String? title, String? avatarUrl});
}

/// @nodoc
class __$$MentorResponseDtoImplCopyWithImpl<$Res>
    extends _$MentorResponseDtoCopyWithImpl<$Res, _$MentorResponseDtoImpl>
    implements _$$MentorResponseDtoImplCopyWith<$Res> {
  __$$MentorResponseDtoImplCopyWithImpl(_$MentorResponseDtoImpl _value,
      $Res Function(_$MentorResponseDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? title = freezed,
    Object? avatarUrl = freezed,
  }) {
    return _then(_$MentorResponseDtoImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MentorResponseDtoImpl implements _MentorResponseDto {
  const _$MentorResponseDtoImpl(
      {this.id, this.name, this.title, this.avatarUrl});

  factory _$MentorResponseDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$MentorResponseDtoImplFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? title;
  @override
  final String? avatarUrl;

  @override
  String toString() {
    return 'MentorResponseDto(id: $id, name: $name, title: $title, avatarUrl: $avatarUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MentorResponseDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, title, avatarUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MentorResponseDtoImplCopyWith<_$MentorResponseDtoImpl> get copyWith =>
      __$$MentorResponseDtoImplCopyWithImpl<_$MentorResponseDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MentorResponseDtoImplToJson(
      this,
    );
  }
}

abstract class _MentorResponseDto implements MentorResponseDto {
  const factory _MentorResponseDto(
      {final String? id,
      final String? name,
      final String? title,
      final String? avatarUrl}) = _$MentorResponseDtoImpl;

  factory _MentorResponseDto.fromJson(Map<String, dynamic> json) =
      _$MentorResponseDtoImpl.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  String? get title;
  @override
  String? get avatarUrl;
  @override
  @JsonKey(ignore: true)
  _$$MentorResponseDtoImplCopyWith<_$MentorResponseDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
