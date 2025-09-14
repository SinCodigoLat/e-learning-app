// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'promote_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PromoteResponseDto _$PromoteResponseDtoFromJson(Map<String, dynamic> json) {
  return _PromoteResponseDto.fromJson(json);
}

/// @nodoc
mixin _$PromoteResponseDto {
  String? get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get discount => throw _privateConstructorUsedError;
  bool? get isActive => throw _privateConstructorUsedError;
  String? get expiryDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PromoteResponseDtoCopyWith<PromoteResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PromoteResponseDtoCopyWith<$Res> {
  factory $PromoteResponseDtoCopyWith(
          PromoteResponseDto value, $Res Function(PromoteResponseDto) then) =
      _$PromoteResponseDtoCopyWithImpl<$Res, PromoteResponseDto>;
  @useResult
  $Res call(
      {String? id,
      String? title,
      String? description,
      String? discount,
      bool? isActive,
      String? expiryDate});
}

/// @nodoc
class _$PromoteResponseDtoCopyWithImpl<$Res, $Val extends PromoteResponseDto>
    implements $PromoteResponseDtoCopyWith<$Res> {
  _$PromoteResponseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? discount = freezed,
    Object? isActive = freezed,
    Object? expiryDate = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      discount: freezed == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      expiryDate: freezed == expiryDate
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PromoteResponseDtoImplCopyWith<$Res>
    implements $PromoteResponseDtoCopyWith<$Res> {
  factory _$$PromoteResponseDtoImplCopyWith(_$PromoteResponseDtoImpl value,
          $Res Function(_$PromoteResponseDtoImpl) then) =
      __$$PromoteResponseDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? title,
      String? description,
      String? discount,
      bool? isActive,
      String? expiryDate});
}

/// @nodoc
class __$$PromoteResponseDtoImplCopyWithImpl<$Res>
    extends _$PromoteResponseDtoCopyWithImpl<$Res, _$PromoteResponseDtoImpl>
    implements _$$PromoteResponseDtoImplCopyWith<$Res> {
  __$$PromoteResponseDtoImplCopyWithImpl(_$PromoteResponseDtoImpl _value,
      $Res Function(_$PromoteResponseDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? discount = freezed,
    Object? isActive = freezed,
    Object? expiryDate = freezed,
  }) {
    return _then(_$PromoteResponseDtoImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      discount: freezed == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      expiryDate: freezed == expiryDate
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PromoteResponseDtoImpl implements _PromoteResponseDto {
  const _$PromoteResponseDtoImpl(
      {this.id,
      this.title,
      this.description,
      this.discount,
      this.isActive,
      this.expiryDate});

  factory _$PromoteResponseDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PromoteResponseDtoImplFromJson(json);

  @override
  final String? id;
  @override
  final String? title;
  @override
  final String? description;
  @override
  final String? discount;
  @override
  final bool? isActive;
  @override
  final String? expiryDate;

  @override
  String toString() {
    return 'PromoteResponseDto(id: $id, title: $title, description: $description, discount: $discount, isActive: $isActive, expiryDate: $expiryDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PromoteResponseDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.expiryDate, expiryDate) ||
                other.expiryDate == expiryDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, title, description, discount, isActive, expiryDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PromoteResponseDtoImplCopyWith<_$PromoteResponseDtoImpl> get copyWith =>
      __$$PromoteResponseDtoImplCopyWithImpl<_$PromoteResponseDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PromoteResponseDtoImplToJson(
      this,
    );
  }
}

abstract class _PromoteResponseDto implements PromoteResponseDto {
  const factory _PromoteResponseDto(
      {final String? id,
      final String? title,
      final String? description,
      final String? discount,
      final bool? isActive,
      final String? expiryDate}) = _$PromoteResponseDtoImpl;

  factory _PromoteResponseDto.fromJson(Map<String, dynamic> json) =
      _$PromoteResponseDtoImpl.fromJson;

  @override
  String? get id;
  @override
  String? get title;
  @override
  String? get description;
  @override
  String? get discount;
  @override
  bool? get isActive;
  @override
  String? get expiryDate;
  @override
  @JsonKey(ignore: true)
  _$$PromoteResponseDtoImplCopyWith<_$PromoteResponseDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
