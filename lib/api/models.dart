import 'package:json_annotation/json_annotation.dart';
part 'models.g.dart';

@JsonSerializable()
class Dimension {
  final int width;
  final int height;

  Dimension({required this.width, required this.height});

  factory Dimension.fromJson(Map<String, dynamic> json) => _$DimensionFromJson(json);
  Map<String, dynamic> toJson() => _$DimensionToJson(this);
}

@JsonSerializable()
class PreviewImage {
  final int id;
  final String url;
  @JsonKey(name: 'dimentions')
  final Dimension dimension;

  PreviewImage({required this.id, required this.url, required this.dimension});

  factory PreviewImage.fromJson(Map<String, dynamic> json) => _$PreviewImageFromJson(json);
  Map<String, dynamic> toJson() => _$PreviewImageToJson(this);
}

@JsonSerializable()
class Category {
  final int id;
  final String name;
  @JsonKey(name: 'preview_image')
  final PreviewImage previewImage;

  Category({required this.id, required this.name, required this.previewImage});

  bool isPopular() {
    return id == -1;
  }

  bool isNews() {
    return id == -2;
  }

  static Category popular() {
    return Category(
      id: -1, 
      name: "Популярное", 
      previewImage: PreviewImage(id: 0, url: "", dimension: Dimension(height: 0, width: 0))
    );
  }

  static Category news() {
    return Category(
      id: -2, 
      name: "Новое", 
      previewImage: PreviewImage(id: 0, url: "", dimension: Dimension(height: 0, width: 0))
    );
  }

  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}

@JsonSerializable()
class PostImage {
  final String url;
  @JsonKey(name: 'dimentions')
  final Dimension dimension;
  final String? video;
  final String? preview;

  PostImage({required this.url, required this.preview, required this.video, required this.dimension});

  factory PostImage.fromJson(Map<String, dynamic> json) => _$PostImageFromJson(json);
  Map<String, dynamic> toJson() => _$PostImageToJson(this);
}

@JsonSerializable()
class Post {
  final int id;
  final String name;
  final PostImage image;

  Post({required this.id, required this.name, required this.image});

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
  Map<String, dynamic> toJson() => _$PostToJson(this);
}

@JsonSerializable()
class Holiday {
  final int day;
  final int month;
  final int year;
  final String title;
  @JsonKey(name: "element_id")
  final int postId;
  final String url;

  Holiday({
    required this.day,
    required this.month,
    required this.year,
    required this.title,
    required this.postId,
    required this.url
  });

  factory Holiday.fromJson(Map<String, dynamic> json) => _$HolidayFromJson(json);
  Map<String, dynamic> toJson() => _$HolidayToJson(this);
}

@JsonSerializable()
class ImageHoliday {
  final String url;
  @JsonKey(name: 'dimentions')
  final Dimension dimension;

  ImageHoliday({required this.url, required this.dimension});

  factory ImageHoliday.fromJson(Map<String, dynamic> json) => _$ImageHolidayFromJson(json);
  Map<String, dynamic> toJson() => _$ImageHolidayToJson(this);
}

@JsonSerializable()
class PostHoliday {
  final int id;
  final String name;
  final String url;
  final String? video;
  final String? preview;

  PostHoliday({
    required this.id,
    required this.name,
    required this.url,
    required this.video,
    required this.preview
  });

  factory PostHoliday.fromJson(Map<String, dynamic> json) => _$PostHolidayFromJson(json);
  Map<String, dynamic> toJson() => _$PostHolidayToJson(this);
}