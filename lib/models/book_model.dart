// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Book {
  String id;
  List<List<String>> images;
  String name;
  String description;
  int price;
  String shop;
  String author;

  List<Genre> genres;

  Book({
    required this.id,
    required this.images,
    required this.name,
    required this.description,
    required this.price,
    required this.shop,
    required this.author,
    required this.genres,
  });

  static List<Book> fromListMap(List data) => List.from(data.map((e) => Book.fromMap(e)));

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'image': images,
      'name': name,
      'description': description,
      'price': price,
      'shop': shop,
      'author': author,
      'genres': genres.map((x) => x.toMap()).toList(),
    };
  }

  factory Book.fromMap(Map<String, dynamic> map) {
     

    return Book(
      id: map['id'] as String,
      images: List.from(map['images'].map((list) => list.map<String>((e) => e.toString()).toList())),
      name: map['name'] as String,
      description: map['description'] as String,
      price: map['price'] as int,
      shop: map['shop'] as String,
      author: map['author'] as String,
      genres: List<Genre>.from(
        map['genres'].map<Genre>(
          (x) => Genre.fromMap(x),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());
}

class Genre {
  int id;
  String name;

  Genre({
    required this.id,
    required this.name,
  });

  Genre copyWith({
    int? id,
    String? name,
  }) {
    return Genre(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory Genre.fromMap(Map<String, dynamic> map) {
    return Genre(
      id: map['id'] as int,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Genre.fromJson(String source) => Genre.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Genre(id: $id, name: $name)';

  @override
  bool operator ==(covariant Genre other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
