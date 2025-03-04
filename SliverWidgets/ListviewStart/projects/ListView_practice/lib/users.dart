// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  String userName;
  String occupation;

  User({
    required this.userName,
    required this.occupation,
  });

  User copyWith({
    String? userName,
    String? occupation,
  }) {
    return User(
      userName: userName ?? this.userName,
      occupation: occupation ?? this.occupation,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userName': userName,
      'occupation': occupation,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      userName: map['userName'] as String,
      occupation: map['occupation'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Users(userName: $userName, occupation: $occupation)';

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;
  
    return 
      other.userName == userName &&
      other.occupation == occupation;
  }

  @override
  int get hashCode => userName.hashCode ^ occupation.hashCode;
}
