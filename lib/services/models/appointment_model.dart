class Appointment {
  List? requests;
  Appointment({
    this.requests,
  });

  Appointment copyWith({
    List? requests,
  }) {
    return Appointment(
      requests: requests ?? this.requests,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['requests'] = requests;
    return data;
  }

  Appointment.fromJson(Map<String, dynamic> json) {
    requests = json['requests'];
  }

  @override
  String toString() => 'Appointment(requests: $requests)';

  @override
  bool operator ==(covariant Appointment other) {
    if (identical(this, other)) return true;

    return other.requests == requests;
  }

  @override
  int get hashCode => requests.hashCode;
}
