// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Dimension _$DimensionFromJson(Map<String, dynamic> json) => Dimension(
      width: json['width'] as int,
      height: json['height'] as int,
    );

Map<String, dynamic> _$DimensionToJson(Dimension instance) => <String, dynamic>{
      'width': instance.width,
      'height': instance.height,
    };

PreviewImage _$PreviewImageFromJson(Map<String, dynamic> json) => PreviewImage(
      id: json['id'] as int,
      url: json['url'] as String,
      dimension: Dimension.fromJson(json['dimentions'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PreviewImageToJson(PreviewImage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'dimentions': instance.dimension,
    };

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      id: json['id'] as int,
      name: json['name'] as String,
      previewImage:
          PreviewImage.fromJson(json['preview_image'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'preview_image': instance.previewImage,
    };

PostImage _$PostImageFromJson(Map<String, dynamic> json) => PostImage(
      url: json['url'] as String,
      preview: json['preview'] as String?,
      video: json['video'] as String?,
      dimension: Dimension.fromJson(json['dimentions'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PostImageToJson(PostImage instance) => <String, dynamic>{
      'url': instance.url,
      'dimentions': instance.dimension,
      'video': instance.video,
      'preview': instance.preview,
    };

Post _$PostFromJson(Map<String, dynamic> json) => Post(
      id: json['id'] as int,
      name: json['name'] as String,
      image: PostImage.fromJson(json['image'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
    };

Holiday _$HolidayFromJson(Map<String, dynamic> json) => Holiday(
      day: json['day'] as int,
      month: json['month'] as int,
      year: json['year'] as int,
      title: json['title'] as String,
      postId: json['element_id'] as int,
      url: json['url'] as String,
    );

Map<String, dynamic> _$HolidayToJson(Holiday instance) => <String, dynamic>{
      'day': instance.day,
      'month': instance.month,
      'year': instance.year,
      'title': instance.title,
      'element_id': instance.postId,
      'url': instance.url,
    };

ImageHoliday _$ImageHolidayFromJson(Map<String, dynamic> json) => ImageHoliday(
      url: json['url'] as String,
      dimension: Dimension.fromJson(json['dimentions'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ImageHolidayToJson(ImageHoliday instance) =>
    <String, dynamic>{
      'url': instance.url,
      'dimentions': instance.dimension,
    };

PostHoliday _$PostHolidayFromJson(Map<String, dynamic> json) => PostHoliday(
      id: json['id'] as int,
      name: json['name'] as String,
      url: json['url'] as String,
      video: json['video'] as String?,
      preview: json['preview'] as String?,
    );

Map<String, dynamic> _$PostHolidayToJson(PostHoliday instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'url': instance.url,
      'video': instance.video,
      'preview': instance.preview,
    };
