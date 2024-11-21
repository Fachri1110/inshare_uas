class Stories {
  final String imageUrl;
  final String userName;

  Stories({required this.imageUrl, required this.userName});
  factory Stories.fromJson(Map<String, dynamic> json) {
    return Stories(
      userName: json['UserName'],
      imageUrl: json['imageUrl'],
    );
  }
}
