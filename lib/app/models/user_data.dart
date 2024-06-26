import 'package:praciar/app/models/project.dart';

import 'category.dart';

export 'package:praciar/app/helper/all_imports.dart';

class UserData {
  UserData({
    required this.projects,
    required this.categories,
    required this.tags,
  });

  final List<Project> projects;
  static const String projectsKey = "projects";

  final List<Category> categories;
  static const String categoriesKey = "categories";

  final List<Category> tags;
  static const String tagsKey = "tags";

  UserData copyWith({
    List<Project>? projects,
    List<Category>? categories,
    List<Category>? tags,
  }) {
    return UserData(
      projects: projects ?? this.projects,
      categories: categories ?? this.categories,
      tags: tags ?? this.tags,
    );
  }

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      projects: json["projects"] == null
          ? []
          : List<Project>.from(
              json["projects"]!.map((x) => Project.fromJson(x))),
      categories: json["categories"] == null
          ? []
          : List<Category>.from(
              json["categories"]!.map((x) => Category.fromJson(x))),
      tags: json["tags"] == null
          ? []
          : List<Category>.from(json["tags"]!.map((x) => Category.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "projects": projects.map((x) => x?.toJson()).toList(),
        "categories": categories.map((x) => x?.toJson()).toList(),
        "tags": tags.map((x) => x?.toJson()).toList(),
      };

  @override
  String toString() {
    return "$projects, $categories, $tags, ";
  }
}
