class CollectionModel {
  final String id;
  final String title;
  final String description;
  final bool private;
  final int mediaCount;
  final int photosCount;
  final int videosCount;

  CollectionModel({
    required this.id,
    required this.title,
    required this.description,
    required this.private,
    required this.mediaCount,
    required this.photosCount,
    required this.videosCount,
  });

  factory CollectionModel.fromJson(Map<String, dynamic> json) {
    return CollectionModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      private: json['private'],
      mediaCount: json['media_count'],
      photosCount: json['photos_count'],
      videosCount: json['videos_count'],
    );
  }
}
