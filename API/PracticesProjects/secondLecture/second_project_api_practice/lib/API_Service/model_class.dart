// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UerAPIModel {
  final int id;
  final String name;
  final String companyName;
  final String location;
  UerAPIModel({
    required this.id,
    required this.name,
    required this.companyName,
    required this.location,
  });

  UerAPIModel copyWith({
    int? id,
    String? name,
    String? companyName,
    String? location,
  }) {
    return UerAPIModel(
      id: id ?? this.id,
      name: name ?? this.name,
      companyName: companyName ?? this.companyName,
      location: location ?? this.location,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'companyName': companyName,
      'location': location,
    };
  }

  factory UerAPIModel.fromMap(Map<String, dynamic> map) {
    return UerAPIModel(
      id: map['id'] as int,
      name: map['name'] as String,
      companyName: map['companyName'] as String,
      location: map['location'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UerAPIModel.fromJson(String source) =>
      UerAPIModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UerAPIModel(id: $id, name: $name, companyName: $companyName, location: $location)';
  }

  @override
  bool operator ==(covariant UerAPIModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.companyName == companyName &&
        other.location == location;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        companyName.hashCode ^
        location.hashCode;
  }
}
