class Pokemon {
  String name;
  String? url;
  String? image;
  int? id;

  Pokemon({
    required this.name,
    this.url,
    this.image,
    this.id,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
        name  : json['name'],
        image : json['image'],
        url   : json['url'],
        id    : json['id'],
    );
  }
}
