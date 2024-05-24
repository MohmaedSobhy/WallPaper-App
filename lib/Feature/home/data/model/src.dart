class SrcPhotoModel {
  String? original;
  String? large2x;
  String? large;
  String? medium;
  String? small;
  String? portrait;
  String? landscape;
  String? tiny;

  SrcPhotoModel({
    this.original,
    this.large2x,
    this.large,
    this.medium,
    this.small,
    this.portrait,
    this.landscape,
    this.tiny,
  });

  factory SrcPhotoModel.fromJson(Map<String, dynamic> json) => SrcPhotoModel(
        original: json['original'] as String?,
        large2x: json['large2x'] as String?,
        large: json['large'] as String?,
        medium: json['medium'] as String?,
        small: json['small'] as String?,
        portrait: json['portrait'] as String?,
        landscape: json['landscape'] as String?,
        tiny: json['tiny'] as String?,
      );
}
