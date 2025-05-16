// product_model.dart
class Product {
  final int id;
  final String title;
  final String description;
  final double price;
  final double rating;
  final List<String> images;
  final double height;
  final List<Review> reviews;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.rating,
    required this.images,
    required this.height,
    required this.reviews,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: json['price'].toDouble(),
      rating: json['rating'].toDouble(),
      images: List<String>.from(json['images']),
      height: json['dimensions']['height'].toDouble(),
      reviews: List<Review>.from(
        json['reviews'].map((x) => Review.fromJson(x)),
      ),
    );
  }
}

class Review {
  final int rating;
  final String comment;
  final String reviewerName;

  Review({
    required this.rating,
    required this.comment,
    required this.reviewerName,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      rating: json['rating'],
      comment: json['comment'],
      reviewerName: json['reviewerName'],
    );
  }
}
