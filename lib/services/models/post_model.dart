class Post {
  String? name;
  String? title;
  String? description;
  String? time;
  String? profileP;
  Post({
    required this.name,
    required this.title,
    required this.description,
    required this.profileP,
  });
  Post copyWith({
    String? email,
    String? title,
    String? description,
  }) {
    return Post(
      name: email ?? this.name,
      title: title ?? this.title,
      description: description ?? this.description,
      profileP: profileP ?? this.profileP,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'title': title,
      'desc': description,
      'url': profileP
    };
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      name: map['user']['name'] as String,
      title: map['title'] as String,
      description: map['desc'] as String,
      profileP: map['user']['url'] as String,
    );
  }

  Post.fromjson(Map<String, dynamic> json) {
    name = json['user']['name'];
    profileP = json['user']['url'];
    title = json['title'];
    description = json['desc'];
    time = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user']['name'] = name;
    data['user']['url'] = profileP;
    data['title'] = title;
    data['desc'] = description;
    return data;
  }

  static List<Post> postFromSnapshot(List posts) {
    return posts.map((data) {
      return Post.fromjson(data);
    }).toList();
  }

  @override
  String toString() =>
      'Post(name: $name, title: $title, description: $description, createdAt: $time)';

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

// import 'dart:convert';

// import 'package:hackman/services/models/user_model.dart';

// class Post {
//   User? user;
//   String? title;
//   String? description;
//   String? time;
//   Post({
//     required this.user,
//     required this.title,
//     required this.description,
//   });
//   Post copyWith({
//     User? user,
//     String? title,
//     String? description,
//   }) {
//     return Post(
//       user: user,
//       title: title ?? this.title,
//       description: description ?? this.description,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'user': user,
//       'title': title,
//       'desc': description,
//     };
//   }

//   factory Post.fromMap(Map<String, dynamic> map) {
//     return Post(
//       user: User.fromMap(map['user']),
//       title: map['title'] as String,
//       description: map['desc'] as String,
//     );
//   }

//   Post.fromjson(Map<String, dynamic> json) {
//     user = User.fromMap(json['user']);
//     print('user : ${json['user']}');
//     title = json['title'];
//     description = json['desc'];
//     time = json['time'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['user'] = jsonEncode(user);
//     data['title'] = title;
//     data['desc'] = description;
//     return data;
//   }

//   static List<Post> postFromSnapshot(List posts) {
//     return posts.map((data) {
//       return Post.fromjson(data);
//     }).toList();
//   }

//   @override
//   String toString() =>
//       'Post(user: $user, title: $title, description: $description, time: $time)';

//   @override
//   bool operator ==(covariant Post other) {
//     if (identical(this, other)) return true;

//     return other.user == user &&
//         other.title == title &&
//         other.description == description &&
//         other.time == time;
//   }

//   @override
//   int get hashCode =>
//       user.hashCode ^ title.hashCode ^ description.hashCode ^ time.hashCode;
// }
