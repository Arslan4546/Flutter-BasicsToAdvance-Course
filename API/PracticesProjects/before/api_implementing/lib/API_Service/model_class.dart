// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserApi {
  final String name;
  final String email;
  final String companyName;
  final String address;

  UserApi({
    required this.name,
    required this.email,
    required this.companyName,
    required this.address,
  });

  UserApi copyWith({
    String? name,
    String? email,
    String? companyName,
    String? address,
  }) {
    return UserApi(
      name: name ?? this.name,
      email: email ?? this.email,
      companyName: companyName ?? this.companyName,
      address: address ?? this.address,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'companyName': companyName,
      'address': address,
    };
  }

  factory UserApi.fromMap(Map<String, dynamic> map) {
    return UserApi(
      name: map['name'] as String,
      email: map['email'] as String,
      companyName: map['companyName'] as String,
      address: map['address'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserApi.fromJson(String source) =>
      UserApi.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AlbumApi(name: $name, email: $email, companyName: $companyName, address: $address)';
  }

  @override
  bool operator ==(covariant UserApi other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.email == email &&
        other.companyName == companyName &&
        other.address == address;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        email.hashCode ^
        companyName.hashCode ^
        address.hashCode;
  }
}
