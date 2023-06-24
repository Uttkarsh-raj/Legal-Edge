class UserModle {
  String? name;
  String? uid;
  String? profilePic;
  String? email;
  String? contact;
  UserModle({
    this.name,
    this.profilePic,
    this.email,
    this.contact,
  });

  UserModle copyWith({
    String? name,
    String? uid,
    String? profilePic,
    String? email,
    String? contact,
  }) {
    return UserModle(
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

  UserModle.fromjson(Map<String, dynamic> json) {
    uid = json['_id'];
    name = json['name'];
    email = json['email'];
    profilePic = json['url'];
    contact = json['contact'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = name;
    data['email'] = email;
    data['url'] = profilePic;
    data['contact'] = contact;
    return data;
  }

  static List<UserModle> usersFromSnapshot(List users) {
    return users.map((data) {
      return UserModle.fromjson(data);
    }).toList();
  }

  static UserModle userfromSnapshot(dynamic json) {
    return UserModle.fromjson(json);
  }

  factory UserModle.fromMap(Map<String, dynamic> map) {
    return UserModle(
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
  bool operator ==(covariant UserModle other) {
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
