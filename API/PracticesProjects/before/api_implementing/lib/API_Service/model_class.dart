import 'dart:convert';

class AlbumApi {
  final String title;
  final int id;

  AlbumApi({required this.title, required this.id});

  AlbumApi copyWith({String? title, int? id}) {
    return AlbumApi(title: title ?? this.title, id: id ?? this.id);
  }

  Map<String, dynamic> toMap() {
    return {'title': title, 'id': id};
  }

  factory AlbumApi.fromMap(Map<String, dynamic> map) {
    return AlbumApi(
      title: map['title'] as String,
      id: map['id'] is int ? map['id'] : int.parse(map['id'].toString()),
    );
  }

  String toJson() => json.encode(toMap());

  factory AlbumApi.fromJson(String source) =>
      AlbumApi.fromMap(json.decode(source));

  @override
  String toString() => 'AlbumApi(title: $title, id: $id)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AlbumApi && title == other.title && id == other.id;

  @override
  int get hashCode => title.hashCode ^ id.hashCode;
}
