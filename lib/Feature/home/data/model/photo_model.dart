import 'src.dart';

class PhotoModel {
  int? id;
  int? width;
  int? height;
  String? url;
  String? photographer;
  String? photographerUrl;
  int? photographerId;
  String? avgColor;
  SrcPhotoModel? src;
  bool? liked;
  String? alt;

  PhotoModel({
    this.id,
    this.width,
    this.height,
    this.url,
    this.photographer,
    this.photographerUrl,
    this.photographerId,
    this.avgColor,
    this.src,
    this.liked,
    this.alt,
  });

  factory PhotoModel.fromJson(Map<String, dynamic> json) => PhotoModel(
        id: json['id'] as int?,
        width: json['width'] as int?,
        height: json['height'] as int?,
        url: json['url'] as String?,
        photographer: json['photographer'] as String?,
        photographerUrl: json['photographer_url'] as String?,
        photographerId: json['photographer_id'] as int?,
        avgColor: json['avg_color'] as String?,
        src: json['src'] == null
            ? null
            : SrcPhotoModel.fromJson(json['src'] as Map<String, dynamic>),
        liked: json['liked'] as bool?,
        alt: json['alt'] as String?,
      );
}
