class Comment {
  String? postId;
  String? userName;
  String? profilePic;
  String? comment;
  String? time;
  bool? isLawyer;
  Comment({
    this.postId,
    this.profilePic,
    this.comment,
    this.time,
    this.isLawyer,
  });

  Comment copyWith({
    String? postId,
    String? profilePic,
    String? comment,
    String? time,
    bool? isLawyer,
  }) {
    return Comment(
      postId: postId ?? this.postId,
      profilePic: profilePic ?? this.profilePic,
      comment: comment ?? this.comment,
      time: time ?? this.time,
      isLawyer: isLawyer ?? this.isLawyer,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'postId': postId,
      'profilePic': profilePic,
      'comment': comment,
      'time': time,
      'isLawyer': isLawyer,
    };
  }

  factory Comment.fromMap(Map<String, dynamic> map) {
    return Comment(
      postId: map['postId'] != null ? map['postId'] as String : null,
      profilePic:
          map['profilePic'] != null ? map['profilePic'] as String : null,
      comment: map['comment'] != null ? map['comment'] as String : null,
      time: map['time'] != null ? map['time'] as String : null,
      isLawyer: map['isLawyer'] != null ? map['isLawyer'] as bool : null,
    );
  }

  Comment.fromJson(Map<String, dynamic> json) {
    postId = json['_id'];
    userName =
        (json['user'] != null) ? json['user']['name'] : json['lawyer']['name'];
    profilePic =
        (json['user'] != null) ? json['user']['url'] : json['lawyer']['url'];
    comment = json['commentDesc'];
    time = json['createdAt'];
    isLawyer = json['isLawyer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user']['url'] = profilePic;
    data['commentDesc'] = comment;
    data['isLawyer'] = isLawyer;
    return data;
  }

  static List<Comment> commentFromSnapshot(List comments) {
    return comments.map((data) {
      return Comment.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'Comment(postId: $postId,profilePic: $profilePic, comment: $comment, time: $time, isLawyer: $isLawyer)';
  }

  @override
  bool operator ==(covariant Comment other) {
    if (identical(this, other)) return true;

    return other.postId == postId &&
        other.profilePic == profilePic &&
        other.comment == comment &&
        other.time == time &&
        other.isLawyer == isLawyer;
  }

  @override
  int get hashCode {
    return postId.hashCode ^
        profilePic.hashCode ^
        comment.hashCode ^
        time.hashCode ^
        isLawyer.hashCode;
  }
}
