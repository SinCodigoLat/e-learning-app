// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReviewResponseDto _$ReviewResponseDtoFromJson(Map<String, dynamic> json) {
  return _ReviewResponseDto.fromJson(json);
}

/// @nodoc
mixin _$ReviewResponseDto {
  String? get id => throw _privateConstructorUsedError;
  String? get courseId => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;
  double? get rating => throw _privateConstructorUsedError;
  String? get comment => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReviewResponseDtoCopyWith<ReviewResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewResponseDtoCopyWith<$Res> {
  factory $ReviewResponseDtoCopyWith(
          ReviewResponseDto value, $Res Function(ReviewResponseDto) then) =
      _$ReviewResponseDtoCopyWithImpl<$Res, ReviewResponseDto>;
  @useResult
  $Res call(
      {String? id,
      String? courseId,
      String? userId,
      double? rating,
      String? comment,
      String? createdAt});
}

/// @nodoc
class _$ReviewResponseDtoCopyWithImpl<$Res, $Val extends ReviewResponseDto>
    implements $ReviewResponseDtoCopyWith<$Res> {
  _$ReviewResponseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? courseId = freezed,
    Object? userId = freezed,
    Object? rating = freezed,
    Object? comment = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      courseId: freezed == courseId
          ? _value.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReviewResponseDtoImplCopyWith<$Res>
    implements $ReviewResponseDtoCopyWith<$Res> {
  factory _$$ReviewResponseDtoImplCopyWith(_$ReviewResponseDtoImpl value,
          $Res Function(_$ReviewResponseDtoImpl) then) =
      __$$ReviewResponseDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? courseId,
      String? userId,
      double? rating,
      String? comment,
      String? createdAt});
}

/// @nodoc
class __$$ReviewResponseDtoImplCopyWithImpl<$Res>
    extends _$ReviewResponseDtoCopyWithImpl<$Res, _$ReviewResponseDtoImpl>
    implements _$$ReviewResponseDtoImplCopyWith<$Res> {
  __$$ReviewResponseDtoImplCopyWithImpl(_$ReviewResponseDtoImpl _value,
      $Res Function(_$ReviewResponseDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? courseId = freezed,
    Object? userId = freezed,
    Object? rating = freezed,
    Object? comment = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$ReviewResponseDtoImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      courseId: freezed == courseId
          ? _value.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReviewResponseDtoImpl implements _ReviewResponseDto {
  const _$ReviewResponseDtoImpl(
      {this.id,
      this.courseId,
      this.userId,
      this.rating,
      this.comment,
      this.createdAt});

  factory _$ReviewResponseDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReviewResponseDtoImplFromJson(json);

  @override
  final String? id;
  @override
  final String? courseId;
  @override
  final String? userId;
  @override
  final double? rating;
  @override
  final String? comment;
  @override
  final String? createdAt;

  @override
  String toString() {
    return 'ReviewResponseDto(id: $id, courseId: $courseId, userId: $userId, rating: $rating, comment: $comment, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewResponseDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.courseId, courseId) ||
                other.courseId == courseId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, courseId, userId, rating, comment, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReviewResponseDtoImplCopyWith<_$ReviewResponseDtoImpl> get copyWith =>
      __$$ReviewResponseDtoImplCopyWithImpl<_$ReviewResponseDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReviewResponseDtoImplToJson(
      this,
    );
  }
}

abstract class _ReviewResponseDto implements ReviewResponseDto {
  const factory _ReviewResponseDto(
      {final String? id,
      final String? courseId,
      final String? userId,
      final double? rating,
      final String? comment,
      final String? createdAt}) = _$ReviewResponseDtoImpl;

  factory _ReviewResponseDto.fromJson(Map<String, dynamic> json) =
      _$ReviewResponseDtoImpl.fromJson;

  @override
  String? get id;
  @override
  String? get courseId;
  @override
  String? get userId;
  @override
  double? get rating;
  @override
  String? get comment;
  @override
  String? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$ReviewResponseDtoImplCopyWith<_$ReviewResponseDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
