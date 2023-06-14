import 'dart:convert';

class Post {
  String? name;
  String? title;
  String? description;
  String? time;
  Post({
    required this.name,
    required this.title,
    required this.description,
  });

  Post copyWith({
    String? name,
    String? title,
    String? description,
  }) {
    return Post(
      name: name ?? this.name,
      title: title ?? this.title,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'title': title,
      'description': description,
    };
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      name: map['name'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
    );
  }

  Post.fromjson(Map<String, dynamic> json) {
    name = json['name'];
    title = json['title'];
    description = json['description'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = name;
    data['title'] = title;
    data['description'] = description;
    return data;
  }

  static List<Post> postFromSnapshot(List posts) {
    return posts.map((data) {
      return Post.fromjson(data);
    }).toList();
  }

  @override
  String toString() =>
      'Post(name: $name, title: $title, description: $description, time: $time)';

  @override
  bool operator ==(covariant Post other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.title == title &&
        other.description == description &&
        other.time == time;
  }

  @override
  int get hashCode =>
      name.hashCode ^ title.hashCode ^ description.hashCode ^ time.hashCode;
}
