// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CategoryResponseDto _$CategoryResponseDtoFromJson(Map<String, dynamic> json) {
  return _CategoryResponseDto.fromJson(json);
}

/// @nodoc
mixin _$CategoryResponseDto {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategoryResponseDtoCopyWith<CategoryResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryResponseDtoCopyWith<$Res> {
  factory $CategoryResponseDtoCopyWith(
          CategoryResponseDto value, $Res Function(CategoryResponseDto) then) =
      _$CategoryResponseDtoCopyWithImpl<$Res, CategoryResponseDto>;
  @useResult
  $Res call({String? id, String? name});
}

/// @nodoc
class _$CategoryResponseDtoCopyWithImpl<$Res, $Val extends CategoryResponseDto>
    implements $CategoryResponseDtoCopyWith<$Res> {
  _$CategoryResponseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategoryResponseDtoImplCopyWith<$Res>
    implements $CategoryResponseDtoCopyWith<$Res> {
  factory _$$CategoryResponseDtoImplCopyWith(_$CategoryResponseDtoImpl value,
          $Res Function(_$CategoryResponseDtoImpl) then) =
      __$$CategoryResponseDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, String? name});
}

/// @nodoc
class __$$CategoryResponseDtoImplCopyWithImpl<$Res>
    extends _$CategoryResponseDtoCopyWithImpl<$Res, _$CategoryResponseDtoImpl>
    implements _$$CategoryResponseDtoImplCopyWith<$Res> {
  __$$CategoryResponseDtoImplCopyWithImpl(_$CategoryResponseDtoImpl _value,
      $Res Function(_$CategoryResponseDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_$CategoryResponseDtoImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryResponseDtoImpl implements _CategoryResponseDto {
  const _$CategoryResponseDtoImpl({this.id, this.name});

  factory _$CategoryResponseDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryResponseDtoImplFromJson(json);

  @override
  final String? id;
  @override
  final String? name;

  @override
  String toString() {
    return 'CategoryResponseDto(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryResponseDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryResponseDtoImplCopyWith<_$CategoryResponseDtoImpl> get copyWith =>
      __$$CategoryResponseDtoImplCopyWithImpl<_$CategoryResponseDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryResponseDtoImplToJson(
      this,
    );
  }
}

abstract class _CategoryResponseDto implements CategoryResponseDto {
  const factory _CategoryResponseDto({final String? id, final String? name}) =
      _$CategoryResponseDtoImpl;

  factory _CategoryResponseDto.fromJson(Map<String, dynamic> json) =
      _$CategoryResponseDtoImpl.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  @JsonKey(ignore: true)
  _$$CategoryResponseDtoImplCopyWith<_$CategoryResponseDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
