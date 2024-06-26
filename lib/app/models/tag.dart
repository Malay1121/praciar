class Tag {
  Tag({
    required this.id,
    required this.name,
    required this.description,
  });

  final String? id;
  static const String idKey = "id";

  final String? name;
  static const String nameKey = "name";

  final String? description;
  static const String descriptionKey = "description";

  Tag copyWith({
    String? id,
    String? name,
    String? description,
  }) {
    return Tag(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
    );
  }

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      id: json["id"],
      name: json["name"],
      description: json["description"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
      };

  @override
  String toString() {
    return "$id, $name, $description, ";
  }
}
