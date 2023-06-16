class Source{
  String id;
  String name;

  Source({required this.id, required this.name});

  factory Source.formJson(Map<String, dynamic> json){
    return Source(id:json['id'], name: json['name']);
  }
}