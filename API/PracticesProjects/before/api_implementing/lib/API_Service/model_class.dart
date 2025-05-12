// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AlbumApi {
  final String title;
  final String id;
  AlbumApi({required this.title, required this.id});

  AlbumApi copyWith({String? title, String? id}) {
    return AlbumApi(title: title ?? this.title, id: id ?? this.id);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'title': title, 'id': id};
  }

  factory AlbumApi.fromMap(Map<String, dynamic> map) {
    return AlbumApi(title: map['title'] as String, id: map['id'] as String);
  }

  String toJson() => json.encode(toMap());

  factory AlbumApi.fromJson(String source) =>
      AlbumApi.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'AlbumApi(title: $title, id: $id)';

  @override
  bool operator ==(covariant AlbumApi other) {
    if (identical(this, other)) return true;

    return other.title == title && other.id == id;
  }

  @override
  int get hashCode => title.hashCode ^ id.hashCode;
}
