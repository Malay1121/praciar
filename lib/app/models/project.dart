class Project {
  Project({
    required this.id,
    required this.name,
    required this.description,
    required this.createdAt,
    required this.tags,
    required this.category,
  });

  final String? id;
  static const String idKey = "id";

  final String? name;
  static const String nameKey = "name";

  final String? description;
  static const String descriptionKey = "description";

  final String? createdAt;
  static const String createdAtKey = "createdAt";

  final List<String> tags;
  static const String tagsKey = "tags";

  final List<String> category;
  static const String categoryKey = "category";

  Project copyWith({
    String? id,
    String? name,
    String? description,
    String? createdAt,
    List<String>? tags,
    List<String>? category,
  }) {
    return Project(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      tags: tags ?? this.tags,
      category: category ?? this.category,
    );
  }

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      id: json["id"],
      name: json["name"],
      description: json["description"],
      createdAt: json["createdAt"],
      tags: json["tags"] == null
          ? []
          : List<String>.from(json["tags"]!.map((x) => x)),
      category: json["category"] == null
          ? []
          : List<String>.from(json["category"]!.map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "createdAt": createdAt,
        "tags": tags.map((x) => x).toList(),
        "category": category.map((x) => x).toList(),
      };

  @override
  String toString() {
    return "$id, $name, $description, $createdAt, $tags, $category, ";
  }
}
