// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'course_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CourseResponseDto _$CourseResponseDtoFromJson(Map<String, dynamic> json) {
  return _CourseResponseDto.fromJson(json);
}

/// @nodoc
mixin _$CourseResponseDto {
  String? get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_url')
  String? get imageUrl => throw _privateConstructorUsedError;
  double? get rating => throw _privateConstructorUsedError;
  @JsonKey(name: 'reviews_count')
  int? get reviewsCount => throw _privateConstructorUsedError;
  int? get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'original_price')
  int? get originalPrice => throw _privateConstructorUsedError;
  int? get students => throw _privateConstructorUsedError;
  @JsonKey(name: 'students_count')
  int? get studentsCount => throw _privateConstructorUsedError;
  int? get duration => throw _privateConstructorUsedError;
  @JsonKey(name: 'duration_hours')
  int? get durationHours => throw _privateConstructorUsedError;
  bool? get certificate => throw _privateConstructorUsedError;
  MentorResponseDto? get mentor => throw _privateConstructorUsedError;
  String? get about => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  List<ToolResponseDto>? get tools => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_favourite')
  bool? get isFavourite => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_featured')
  bool? get isFeatured => throw _privateConstructorUsedError;
  @JsonKey(name: 'views_count')
  int? get viewsCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'likes_count')
  int? get likesCount => throw _privateConstructorUsedError;
  String? get level => throw _privateConstructorUsedError;
  String? get language => throw _privateConstructorUsedError;
  @JsonKey(name: 'popularity_score')
  double? get popularityScore => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CourseResponseDtoCopyWith<CourseResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CourseResponseDtoCopyWith<$Res> {
  factory $CourseResponseDtoCopyWith(
          CourseResponseDto value, $Res Function(CourseResponseDto) then) =
      _$CourseResponseDtoCopyWithImpl<$Res, CourseResponseDto>;
  @useResult
  $Res call(
      {String? id,
      String? title,
      String? category,
      String? image,
      @JsonKey(name: 'image_url') String? imageUrl,
      double? rating,
      @JsonKey(name: 'reviews_count') int? reviewsCount,
      int? price,
      @JsonKey(name: 'original_price') int? originalPrice,
      int? students,
      @JsonKey(name: 'students_count') int? studentsCount,
      int? duration,
      @JsonKey(name: 'duration_hours') int? durationHours,
      bool? certificate,
      MentorResponseDto? mentor,
      String? about,
      String? description,
      List<ToolResponseDto>? tools,
      @JsonKey(name: 'is_favourite') bool? isFavourite,
      @JsonKey(name: 'is_featured') bool? isFeatured,
      @JsonKey(name: 'views_count') int? viewsCount,
      @JsonKey(name: 'likes_count') int? likesCount,
      String? level,
      String? language,
      @JsonKey(name: 'popularity_score') double? popularityScore});

  $MentorResponseDtoCopyWith<$Res>? get mentor;
}

/// @nodoc
class _$CourseResponseDtoCopyWithImpl<$Res, $Val extends CourseResponseDto>
    implements $CourseResponseDtoCopyWith<$Res> {
  _$CourseResponseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? category = freezed,
    Object? image = freezed,
    Object? imageUrl = freezed,
    Object? rating = freezed,
    Object? reviewsCount = freezed,
    Object? price = freezed,
    Object? originalPrice = freezed,
    Object? students = freezed,
    Object? studentsCount = freezed,
    Object? duration = freezed,
    Object? durationHours = freezed,
    Object? certificate = freezed,
    Object? mentor = freezed,
    Object? about = freezed,
    Object? description = freezed,
    Object? tools = freezed,
    Object? isFavourite = freezed,
    Object? isFeatured = freezed,
    Object? viewsCount = freezed,
    Object? likesCount = freezed,
    Object? level = freezed,
    Object? language = freezed,
    Object? popularityScore = freezed,
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
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
      reviewsCount: freezed == reviewsCount
          ? _value.reviewsCount
          : reviewsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      originalPrice: freezed == originalPrice
          ? _value.originalPrice
          : originalPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      students: freezed == students
          ? _value.students
          : students // ignore: cast_nullable_to_non_nullable
              as int?,
      studentsCount: freezed == studentsCount
          ? _value.studentsCount
          : studentsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int?,
      durationHours: freezed == durationHours
          ? _value.durationHours
          : durationHours // ignore: cast_nullable_to_non_nullable
              as int?,
      certificate: freezed == certificate
          ? _value.certificate
          : certificate // ignore: cast_nullable_to_non_nullable
              as bool?,
      mentor: freezed == mentor
          ? _value.mentor
          : mentor // ignore: cast_nullable_to_non_nullable
              as MentorResponseDto?,
      about: freezed == about
          ? _value.about
          : about // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      tools: freezed == tools
          ? _value.tools
          : tools // ignore: cast_nullable_to_non_nullable
              as List<ToolResponseDto>?,
      isFavourite: freezed == isFavourite
          ? _value.isFavourite
          : isFavourite // ignore: cast_nullable_to_non_nullable
              as bool?,
      isFeatured: freezed == isFeatured
          ? _value.isFeatured
          : isFeatured // ignore: cast_nullable_to_non_nullable
              as bool?,
      viewsCount: freezed == viewsCount
          ? _value.viewsCount
          : viewsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      likesCount: freezed == likesCount
          ? _value.likesCount
          : likesCount // ignore: cast_nullable_to_non_nullable
              as int?,
      level: freezed == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as String?,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      popularityScore: freezed == popularityScore
          ? _value.popularityScore
          : popularityScore // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MentorResponseDtoCopyWith<$Res>? get mentor {
    if (_value.mentor == null) {
      return null;
    }

    return $MentorResponseDtoCopyWith<$Res>(_value.mentor!, (value) {
      return _then(_value.copyWith(mentor: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CourseResponseDtoImplCopyWith<$Res>
    implements $CourseResponseDtoCopyWith<$Res> {
  factory _$$CourseResponseDtoImplCopyWith(_$CourseResponseDtoImpl value,
          $Res Function(_$CourseResponseDtoImpl) then) =
      __$$CourseResponseDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? title,
      String? category,
      String? image,
      @JsonKey(name: 'image_url') String? imageUrl,
      double? rating,
      @JsonKey(name: 'reviews_count') int? reviewsCount,
      int? price,
      @JsonKey(name: 'original_price') int? originalPrice,
      int? students,
      @JsonKey(name: 'students_count') int? studentsCount,
      int? duration,
      @JsonKey(name: 'duration_hours') int? durationHours,
      bool? certificate,
      MentorResponseDto? mentor,
      String? about,
      String? description,
      List<ToolResponseDto>? tools,
      @JsonKey(name: 'is_favourite') bool? isFavourite,
      @JsonKey(name: 'is_featured') bool? isFeatured,
      @JsonKey(name: 'views_count') int? viewsCount,
      @JsonKey(name: 'likes_count') int? likesCount,
      String? level,
      String? language,
      @JsonKey(name: 'popularity_score') double? popularityScore});

  @override
  $MentorResponseDtoCopyWith<$Res>? get mentor;
}

/// @nodoc
class __$$CourseResponseDtoImplCopyWithImpl<$Res>
    extends _$CourseResponseDtoCopyWithImpl<$Res, _$CourseResponseDtoImpl>
    implements _$$CourseResponseDtoImplCopyWith<$Res> {
  __$$CourseResponseDtoImplCopyWithImpl(_$CourseResponseDtoImpl _value,
      $Res Function(_$CourseResponseDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? category = freezed,
    Object? image = freezed,
    Object? imageUrl = freezed,
    Object? rating = freezed,
    Object? reviewsCount = freezed,
    Object? price = freezed,
    Object? originalPrice = freezed,
    Object? students = freezed,
    Object? studentsCount = freezed,
    Object? duration = freezed,
    Object? durationHours = freezed,
    Object? certificate = freezed,
    Object? mentor = freezed,
    Object? about = freezed,
    Object? description = freezed,
    Object? tools = freezed,
    Object? isFavourite = freezed,
    Object? isFeatured = freezed,
    Object? viewsCount = freezed,
    Object? likesCount = freezed,
    Object? level = freezed,
    Object? language = freezed,
    Object? popularityScore = freezed,
  }) {
    return _then(_$CourseResponseDtoImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
      reviewsCount: freezed == reviewsCount
          ? _value.reviewsCount
          : reviewsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      originalPrice: freezed == originalPrice
          ? _value.originalPrice
          : originalPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      students: freezed == students
          ? _value.students
          : students // ignore: cast_nullable_to_non_nullable
              as int?,
      studentsCount: freezed == studentsCount
          ? _value.studentsCount
          : studentsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int?,
      durationHours: freezed == durationHours
          ? _value.durationHours
          : durationHours // ignore: cast_nullable_to_non_nullable
              as int?,
      certificate: freezed == certificate
          ? _value.certificate
          : certificate // ignore: cast_nullable_to_non_nullable
              as bool?,
      mentor: freezed == mentor
          ? _value.mentor
          : mentor // ignore: cast_nullable_to_non_nullable
              as MentorResponseDto?,
      about: freezed == about
          ? _value.about
          : about // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      tools: freezed == tools
          ? _value._tools
          : tools // ignore: cast_nullable_to_non_nullable
              as List<ToolResponseDto>?,
      isFavourite: freezed == isFavourite
          ? _value.isFavourite
          : isFavourite // ignore: cast_nullable_to_non_nullable
              as bool?,
      isFeatured: freezed == isFeatured
          ? _value.isFeatured
          : isFeatured // ignore: cast_nullable_to_non_nullable
              as bool?,
      viewsCount: freezed == viewsCount
          ? _value.viewsCount
          : viewsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      likesCount: freezed == likesCount
          ? _value.likesCount
          : likesCount // ignore: cast_nullable_to_non_nullable
              as int?,
      level: freezed == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as String?,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      popularityScore: freezed == popularityScore
          ? _value.popularityScore
          : popularityScore // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CourseResponseDtoImpl implements _CourseResponseDto {
  const _$CourseResponseDtoImpl(
      {this.id,
      this.title,
      this.category,
      this.image,
      @JsonKey(name: 'image_url') this.imageUrl,
      this.rating,
      @JsonKey(name: 'reviews_count') this.reviewsCount,
      this.price,
      @JsonKey(name: 'original_price') this.originalPrice,
      this.students,
      @JsonKey(name: 'students_count') this.studentsCount,
      this.duration,
      @JsonKey(name: 'duration_hours') this.durationHours,
      this.certificate,
      this.mentor,
      this.about,
      this.description,
      final List<ToolResponseDto>? tools,
      @JsonKey(name: 'is_favourite') this.isFavourite,
      @JsonKey(name: 'is_featured') this.isFeatured,
      @JsonKey(name: 'views_count') this.viewsCount,
      @JsonKey(name: 'likes_count') this.likesCount,
      this.level,
      this.language,
      @JsonKey(name: 'popularity_score') this.popularityScore})
      : _tools = tools;

  factory _$CourseResponseDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CourseResponseDtoImplFromJson(json);

  @override
  final String? id;
  @override
  final String? title;
  @override
  final String? category;
  @override
  final String? image;
  @override
  @JsonKey(name: 'image_url')
  final String? imageUrl;
  @override
  final double? rating;
  @override
  @JsonKey(name: 'reviews_count')
  final int? reviewsCount;
  @override
  final int? price;
  @override
  @JsonKey(name: 'original_price')
  final int? originalPrice;
  @override
  final int? students;
  @override
  @JsonKey(name: 'students_count')
  final int? studentsCount;
  @override
  final int? duration;
  @override
  @JsonKey(name: 'duration_hours')
  final int? durationHours;
  @override
  final bool? certificate;
  @override
  final MentorResponseDto? mentor;
  @override
  final String? about;
  @override
  final String? description;
  final List<ToolResponseDto>? _tools;
  @override
  List<ToolResponseDto>? get tools {
    final value = _tools;
    if (value == null) return null;
    if (_tools is EqualUnmodifiableListView) return _tools;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'is_favourite')
  final bool? isFavourite;
  @override
  @JsonKey(name: 'is_featured')
  final bool? isFeatured;
  @override
  @JsonKey(name: 'views_count')
  final int? viewsCount;
  @override
  @JsonKey(name: 'likes_count')
  final int? likesCount;
  @override
  final String? level;
  @override
  final String? language;
  @override
  @JsonKey(name: 'popularity_score')
  final double? popularityScore;

  @override
  String toString() {
    return 'CourseResponseDto(id: $id, title: $title, category: $category, image: $image, imageUrl: $imageUrl, rating: $rating, reviewsCount: $reviewsCount, price: $price, originalPrice: $originalPrice, students: $students, studentsCount: $studentsCount, duration: $duration, durationHours: $durationHours, certificate: $certificate, mentor: $mentor, about: $about, description: $description, tools: $tools, isFavourite: $isFavourite, isFeatured: $isFeatured, viewsCount: $viewsCount, likesCount: $likesCount, level: $level, language: $language, popularityScore: $popularityScore)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CourseResponseDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.reviewsCount, reviewsCount) ||
                other.reviewsCount == reviewsCount) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.originalPrice, originalPrice) ||
                other.originalPrice == originalPrice) &&
            (identical(other.students, students) ||
                other.students == students) &&
            (identical(other.studentsCount, studentsCount) ||
                other.studentsCount == studentsCount) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.durationHours, durationHours) ||
                other.durationHours == durationHours) &&
            (identical(other.certificate, certificate) ||
                other.certificate == certificate) &&
            (identical(other.mentor, mentor) || other.mentor == mentor) &&
            (identical(other.about, about) || other.about == about) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._tools, _tools) &&
            (identical(other.isFavourite, isFavourite) ||
                other.isFavourite == isFavourite) &&
            (identical(other.isFeatured, isFeatured) ||
                other.isFeatured == isFeatured) &&
            (identical(other.viewsCount, viewsCount) ||
                other.viewsCount == viewsCount) &&
            (identical(other.likesCount, likesCount) ||
                other.likesCount == likesCount) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.popularityScore, popularityScore) ||
                other.popularityScore == popularityScore));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        title,
        category,
        image,
        imageUrl,
        rating,
        reviewsCount,
        price,
        originalPrice,
        students,
        studentsCount,
        duration,
        durationHours,
        certificate,
        mentor,
        about,
        description,
        const DeepCollectionEquality().hash(_tools),
        isFavourite,
        isFeatured,
        viewsCount,
        likesCount,
        level,
        language,
        popularityScore
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CourseResponseDtoImplCopyWith<_$CourseResponseDtoImpl> get copyWith =>
      __$$CourseResponseDtoImplCopyWithImpl<_$CourseResponseDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CourseResponseDtoImplToJson(
      this,
    );
  }
}

abstract class _CourseResponseDto implements CourseResponseDto {
  const factory _CourseResponseDto(
          {final String? id,
          final String? title,
          final String? category,
          final String? image,
          @JsonKey(name: 'image_url') final String? imageUrl,
          final double? rating,
          @JsonKey(name: 'reviews_count') final int? reviewsCount,
          final int? price,
          @JsonKey(name: 'original_price') final int? originalPrice,
          final int? students,
          @JsonKey(name: 'students_count') final int? studentsCount,
          final int? duration,
          @JsonKey(name: 'duration_hours') final int? durationHours,
          final bool? certificate,
          final MentorResponseDto? mentor,
          final String? about,
          final String? description,
          final List<ToolResponseDto>? tools,
          @JsonKey(name: 'is_favourite') final bool? isFavourite,
          @JsonKey(name: 'is_featured') final bool? isFeatured,
          @JsonKey(name: 'views_count') final int? viewsCount,
          @JsonKey(name: 'likes_count') final int? likesCount,
          final String? level,
          final String? language,
          @JsonKey(name: 'popularity_score') final double? popularityScore}) =
      _$CourseResponseDtoImpl;

  factory _CourseResponseDto.fromJson(Map<String, dynamic> json) =
      _$CourseResponseDtoImpl.fromJson;

  @override
  String? get id;
  @override
  String? get title;
  @override
  String? get category;
  @override
  String? get image;
  @override
  @JsonKey(name: 'image_url')
  String? get imageUrl;
  @override
  double? get rating;
  @override
  @JsonKey(name: 'reviews_count')
  int? get reviewsCount;
  @override
  int? get price;
  @override
  @JsonKey(name: 'original_price')
  int? get originalPrice;
  @override
  int? get students;
  @override
  @JsonKey(name: 'students_count')
  int? get studentsCount;
  @override
  int? get duration;
  @override
  @JsonKey(name: 'duration_hours')
  int? get durationHours;
  @override
  bool? get certificate;
  @override
  MentorResponseDto? get mentor;
  @override
  String? get about;
  @override
  String? get description;
  @override
  List<ToolResponseDto>? get tools;
  @override
  @JsonKey(name: 'is_favourite')
  bool? get isFavourite;
  @override
  @JsonKey(name: 'is_featured')
  bool? get isFeatured;
  @override
  @JsonKey(name: 'views_count')
  int? get viewsCount;
  @override
  @JsonKey(name: 'likes_count')
  int? get likesCount;
  @override
  String? get level;
  @override
  String? get language;
  @override
  @JsonKey(name: 'popularity_score')
  double? get popularityScore;
  @override
  @JsonKey(ignore: true)
  _$$CourseResponseDtoImplCopyWith<_$CourseResponseDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ToolResponseDto _$ToolResponseDtoFromJson(Map<String, dynamic> json) {
  return _ToolResponseDto.fromJson(json);
}

/// @nodoc
mixin _$ToolResponseDto {
  String? get name => throw _privateConstructorUsedError;
  String? get iconUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ToolResponseDtoCopyWith<ToolResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ToolResponseDtoCopyWith<$Res> {
  factory $ToolResponseDtoCopyWith(
          ToolResponseDto value, $Res Function(ToolResponseDto) then) =
      _$ToolResponseDtoCopyWithImpl<$Res, ToolResponseDto>;
  @useResult
  $Res call({String? name, String? iconUrl});
}

/// @nodoc
class _$ToolResponseDtoCopyWithImpl<$Res, $Val extends ToolResponseDto>
    implements $ToolResponseDtoCopyWith<$Res> {
  _$ToolResponseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? iconUrl = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      iconUrl: freezed == iconUrl
          ? _value.iconUrl
          : iconUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ToolResponseDtoImplCopyWith<$Res>
    implements $ToolResponseDtoCopyWith<$Res> {
  factory _$$ToolResponseDtoImplCopyWith(_$ToolResponseDtoImpl value,
          $Res Function(_$ToolResponseDtoImpl) then) =
      __$$ToolResponseDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? name, String? iconUrl});
}

/// @nodoc
class __$$ToolResponseDtoImplCopyWithImpl<$Res>
    extends _$ToolResponseDtoCopyWithImpl<$Res, _$ToolResponseDtoImpl>
    implements _$$ToolResponseDtoImplCopyWith<$Res> {
  __$$ToolResponseDtoImplCopyWithImpl(
      _$ToolResponseDtoImpl _value, $Res Function(_$ToolResponseDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? iconUrl = freezed,
  }) {
    return _then(_$ToolResponseDtoImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      iconUrl: freezed == iconUrl
          ? _value.iconUrl
          : iconUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ToolResponseDtoImpl implements _ToolResponseDto {
  const _$ToolResponseDtoImpl({this.name, this.iconUrl});

  factory _$ToolResponseDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ToolResponseDtoImplFromJson(json);

  @override
  final String? name;
  @override
  final String? iconUrl;

  @override
  String toString() {
    return 'ToolResponseDto(name: $name, iconUrl: $iconUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToolResponseDtoImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, iconUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ToolResponseDtoImplCopyWith<_$ToolResponseDtoImpl> get copyWith =>
      __$$ToolResponseDtoImplCopyWithImpl<_$ToolResponseDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ToolResponseDtoImplToJson(
      this,
    );
  }
}

abstract class _ToolResponseDto implements ToolResponseDto {
  const factory _ToolResponseDto({final String? name, final String? iconUrl}) =
      _$ToolResponseDtoImpl;

  factory _ToolResponseDto.fromJson(Map<String, dynamic> json) =
      _$ToolResponseDtoImpl.fromJson;

  @override
  String? get name;
  @override
  String? get iconUrl;
  @override
  @JsonKey(ignore: true)
  _$$ToolResponseDtoImplCopyWith<_$ToolResponseDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
