class Model {
  final int id;
  final String title;
  final String image;

  Model({required this.id, required this.title, required this.image});
  factory Model.fromJson(Map<String, dynamic> json) {
    return Model(
      id: json['id'] as int,
      title: json['title'] as String,
      image: json['image'] as String,
    );
  }
}
