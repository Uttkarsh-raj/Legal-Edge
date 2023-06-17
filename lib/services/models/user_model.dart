class User {
  String? name;
  String? uid;
  String? profilePic;
  String? email;
  String? contact;
  User({
    this.name,
    this.profilePic,
    this.email,
    this.contact,
  });

  User copyWith({
    String? name,
    String? uid,
    String? profilePic,
    String? email,
    String? contact,
  }) {
    return User(
      name: name ?? this.name,
      profilePic: profilePic ?? this.profilePic,
      email: email ?? this.email,
      contact: contact ?? this.contact,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'url': profilePic,
      '_id': uid,
      'email': email,
      'contact': contact,
    };
  }

  User.fromjson(Map<String, dynamic> json) {
    uid = json['_id'];
    name = json['name'];
    email = json['email'];
    profilePic = json['avatar']['url'];
    contact = json['contact'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = name;
    data['email'] = email;
    data['avatar']['url'] = profilePic;
    data['contact'] = contact;
    return data;
  }

  static List<User> usersFromSnapshot(List users) {
    return users.map((data) {
      return User.fromjson(data);
    }).toList();
  }

  static User userfromSnapshot(dynamic json) {
    return User.fromjson(json);
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'] != null ? map['name'] as String : null,
      profilePic:
          map['profilePic'] != null ? map['profilePic'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      contact: map['contact'] != null ? map['contact'] as String : null,
    );
  }

  // String toJson() => json.encode(toMap());

  // factory User.fromJson(String source) => User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(name: $name, profilePic: $profilePic, email: $email, contact: $contact)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.profilePic == profilePic &&
        other.email == email &&
        other.contact == contact;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        profilePic.hashCode ^
        email.hashCode ^
        contact.hashCode;
  }
}
