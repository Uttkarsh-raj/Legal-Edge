class Post {
  String? name;
  String? email;
  String? id;
  String? title;
  String? description;
  String? time;
  String? profileP;
  int? likes;
  List<String?>? likedBy;
  Post({
    required this.name,
    required this.email,
    required this.title,
    required this.description,
    required this.profileP,
    required this.likes,
    this.likedBy,
    this.id,
  });
  Post copyWith({
    String? email,
    String? title,
    String? description,
  }) {
    return Post(
      name: name ?? this.name,
      email: email ?? this.name,
      title: title ?? this.title,
      description: description ?? this.description,
      profileP: profileP ?? this.profileP,
      likes: likes ?? this.likes,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'title': title,
      'desc': description,
      'url': profileP,
      'likes': likes,
    };
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      id: map['_id'],
      name: map['user']['name'] as String,
      email: map['user']['email'] as String,
      title: map['title'] as String,
      description: map['desc'] as String,
      profileP: map['user']['url'] as String,
      likes: map['likes']['noOFLikes'] as int,
    );
  }

  List<String?>? fromDynamic(List<dynamic> list) {
    List<String> temp = [];
    for (var v in list) {
      temp.add(v.toString());
    }
    return temp;
  }

  Post.fromjson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['user']['name'];
    email = json['user']['email'];
    profileP = json['user']['url'];
    title = json['title'];
    description = json['desc'];
    time = json['createdAt'];
    likes = json['likes']['noOFLikes'];
    likedBy = fromDynamic(json['likes']['user']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user']['name'] = name;
    data['user']['email'] = email;
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
