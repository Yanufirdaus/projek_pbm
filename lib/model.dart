class Album {
  final String avatar ;
  final String id;
  final String name;

  const Album({
    required this.avatar,
    required this.id,
    required this.name,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      avatar: json['avatar'],
      id: json['id'],
      name: json['name'],
    );
  }
}