import 'dart:convert';

class Lawyer {
  String? profilePic;
  String? uid;
  String? name;
  String? email;
  String? address;
  String? city;
  String? regNo;
  List<String?>? cases;
  List<String?>? courts;
  String? contact;
  String? discription;
  String? calendlylink;
  Lawyer({
    this.profilePic,
    this.name,
    this.email,
    this.address,
    this.city,
    this.regNo,
    this.cases,
    this.courts,
    this.contact,
    this.discription,
    this.calendlylink,
  });

  Lawyer copyWith({
    String? profilePic,
    String? uid,
    String? name,
    String? email,
    String? address,
    String? city,
    String? regNo,
    List<String?>? cases,
    List<String?>? courts,
    String? contact,
    String? discription,
  }) {
    return Lawyer(
      profilePic: profilePic ?? this.profilePic,
      name: name ?? this.name,
      email: email ?? this.email,
      address: address ?? this.address,
      city: city ?? this.city,
      regNo: regNo ?? this.regNo,
      cases: cases ?? this.cases,
      courts: courts ?? this.courts,
      contact: contact ?? this.contact,
      discription: discription ?? this.discription,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'profilePic': profilePic,
      '_id': uid,
      'name': name,
      'email': email,
      'address': address,
      'city': city,
      'regNo': regNo,
      'cases': cases,
      'courts': courts,
      'contact': contact,
      'desc': discription,
    };
  }

  factory Lawyer.fromMap(Map<String, dynamic> map) {
    return Lawyer(
      profilePic:
          map['profilePic'] != null ? map['profilePic'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      address: map['address'] != null ? map['address'] as String : null,
      city: map['city'] != null ? map['city'] as String : null,
      regNo: map['regNo'] != null ? map['regNo'] as String : null,
      cases: map['cases'] != null ? map['cases'] as List<String?> : null,
      courts: map['courts'] != null ? map['courts'] as List<String?> : null,
      contact: map['contact'] != null ? map['contact'] as String : null,
      discription: map['desc'] != null ? map['desc'] as String : null,
    );
  }

  Lawyer.fromJson(dynamic json) {
    uid = json['_id'];
    name = json['name'];
    email = json['email'];
    profilePic = json['url'];
    contact = json['contact'];
    address = json['address'];
    city = json['city'];
    regNo = json['regNo'];
    cases = List<String>.from(json['cases']);
    courts = List<String>.from(json['courts']);
    discription = json['desc'];
    calendlylink = json['calendly'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = name;
    data['email'] = email;
    data['url'] = profilePic;
    data['contact'] = contact;
    data['address'] = address;
    data['city'] = city;
    data['regNo'] = regNo;
    data['cases'] = json.encode(cases);
    data['courts'] = json.encode(courts);
    data['desc'] = discription;
    data['calendly'] = calendlylink;
    return data;
  }

  static List<Lawyer> lawyersFromSnapshot(List lawyers) {
    return lawyers.map((data) {
      return Lawyer.fromJson(data);
    }).toList();
  }

  static Lawyer lawyerfromSnapshot(dynamic json) {
    return Lawyer.fromJson(json);
  }

  @override
  String toString() {
    return 'Lawyer(profilePic: $profilePic, name: $name, email: $email, address: $address, city: $city, regNo: $regNo, cases: $cases, courts: $courts, contact: $contact, discription: $discription)';
  }

  @override
  bool operator ==(covariant Lawyer other) {
    if (identical(this, other)) return true;

    return other.profilePic == profilePic &&
        other.name == name &&
        other.email == email &&
        other.address == address &&
        other.city == city &&
        other.regNo == regNo &&
        // listEquals(other.cases, cases) &&
        // listEquals(other.courts, courts) &&
        other.contact == contact &&
        other.discription == discription;
  }

  @override
  int get hashCode {
    return profilePic.hashCode ^
        name.hashCode ^
        email.hashCode ^
        address.hashCode ^
        city.hashCode ^
        regNo.hashCode ^
        cases.hashCode ^
        courts.hashCode ^
        contact.hashCode ^
        discription.hashCode;
  }
}
