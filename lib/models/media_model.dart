class Media {
  final String id;
  final String mediaType;
  final String mediaUrl;
  final String thumbnailUrl;
  final String permalink;
  final String userId; 
  final String caption; 
  final DateTime createdAt; 
  final String tag; 

  Media({
    required this.id,
    required this.mediaType,
    required this.mediaUrl,
    required this.thumbnailUrl,
    required this.permalink,
    required this.userId,
    required this.caption,
    required this.createdAt,
    required this.tag,
  });

  factory Media.fromJson(Map<String, dynamic> json) {
    return Media(
      id: json['id'],
      mediaType: json['media_type'],
      mediaUrl: json['media_url'],
      thumbnailUrl: json['thumbnail_url'] ?? "",
      permalink: json['permalink'],
      userId: json['user_id'], 
      caption: json['caption'], 
      createdAt: DateTime.parse(json['created_at']), 
      tag: json['tag'], 
    );
  }
}
