// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class StudentModel {
  final int rollNo;
  final String name;
  final String email;
  final String phone;
  final double cGPA;
  StudentModel({
    required this.rollNo,
    required this.name,
    required this.email,
    required this.phone,
    required this.cGPA,
  });

  // Creating the table commands in this Student Model Class
  // create the variables for the table name and column names

  static const String tableName = 'Student';
  static const String columnRollNo = 'RollNo';
  static const String columnName = 'Name';
  static const String columnEmail = 'Email';
  static const String columnPhone = 'Phone';
  static const String columnCGPA = 'CGPA';

  // this is the commands for creating the table for the database
  static const String createTableCommand =
      "CREATE TABLE IF NOT EXISTS $tableName ("
      "$columnRollNo INTEGER PRIMARY KEY AUTOINCREMENT, "
      "$columnName TEXT NOT NULL, "
      "$columnEmail TEXT NOT NULL, "
      "$columnPhone TEXT NOT NULL, "
      "$columnCGPA REAL NOT NULL)";

  StudentModel copyWith({
    int? rollNo,
    String? name,
    String? email,
    String? phone,
    double? cGPA,
  }) {
    return StudentModel(
      rollNo: rollNo ?? this.rollNo,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      cGPA: cGPA ?? this.cGPA,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'rollNo': rollNo,
      'name': name,
      'email': email,
      'phone': phone,
      'cGPA': cGPA,
    };
  }

  factory StudentModel.fromMap(Map<String, dynamic> map) {
    return StudentModel(
      rollNo: map['rollNo'] as int,
      name: map['name'] as String,
      email: map['email'] as String,
      phone: map['phone'] as String,
      cGPA: map['cGPA'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory StudentModel.fromJson(String source) =>
      StudentModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'StudentModel(rollNo: $rollNo, name: $name, email: $email, phone: $phone, cGPA: $cGPA)';
  }

  @override
  bool operator ==(covariant StudentModel other) {
    if (identical(this, other)) return true;

    return other.rollNo == rollNo &&
        other.name == name &&
        other.email == email &&
        other.phone == phone &&
        other.cGPA == cGPA;
  }

  @override
  int get hashCode {
    return rollNo.hashCode ^
        name.hashCode ^
        email.hashCode ^
        phone.hashCode ^
        cGPA.hashCode;
  }
}
