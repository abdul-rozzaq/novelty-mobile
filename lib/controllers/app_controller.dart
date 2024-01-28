import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:novelty/models/book_model.dart';
import 'package:novelty/models/location_models.dart';
import 'package:novelty/models/user_model.dart';
import 'package:novelty/services/local_storage.dart';
import 'package:novelty/services/requests.dart';

class AppController extends GetxController {
  List<String> carousel = [];
  List<Genre> genres = [];
  List<Region> regions = [];
  List<String> likedBooks = [];

  List<Book> books = [];

  List<Book> popularBooks = [];
  List<Book> scientificBooks = [];

  late User? user;
  District? get district => user?.district;

  @override
  void onInit() {
    super.onInit();

    startLoad();
  }

  Future startLoad() async {
    loadUser();
    await loadCarouselItems();
    await loadGenres();
    await loadLocations();
    await loadBooks();
    loadLikedBooks();
    update();
  }

  loadUser() {
    user = Get.put(UserService()).get();
    update();
  }

  Future<void> loadCarouselItems() async {
    final response = await Requests.fetchData('/api/carousel-items/');

    if (response.statusCode == 200) {
      carousel = (response.body as List).map<String>((e) => e.toString()).toList();
    }
  }

  Future<void> loadBooks() async {
    final response = await Requests.fetchData('/api/book/');

    if (response.statusCode == 200) {
      books = Book.fromListMap(response.body);

      books.shuffle();

      popularBooks = books.where((book) => book.genres.where((genre) => [4, 3, 9, 7].contains(genre.id)).isNotEmpty).toList();
      scientificBooks = books.where((book) => book.genres.where((genre) => [5, 2, 10, 11, 14].contains(genre.id)).isNotEmpty).toList();

      debugPrint('PopularBooks ${popularBooks.length}');
      debugPrint('ScientificBooks ${scientificBooks.length}');

      update();
    }
  }

  Future<void> loadGenres() async {
    final response = await Requests.fetchData('/api/genres/');

    if (response.statusCode == 200) {
      genres = List.from((response.body as List).map((e) => Genre.fromMap(e)));
    }
  }

  Future<void> loadLocations() async {
    final response = await Requests.fetchData('/api/locations/');

    if (response.statusCode == 200) {
      regions = (response.body as List).map<Region>((e) => Region.fromJson(e)).toList();

      regions.sort((a, b) => a.name.substring(0, 1).compareTo(b.name.substring(0, 1)));
    }
  }

  List<Book> shuffler(List<Book> books) {
    books.shuffle();

    return books;
  }

  int booksCountByGenre(Genre genre) => books.where((element) => element.genres.contains(genre)).length;

  loadLikedBooks() {
    likedBooks = Get.put(LikedBooksService()).get() != null ? List<String>.from(Get.put(LikedBooksService()).get().map<String>((e) => e.toString())) : [];
  }

  addLikeToBook(String id) {
    if (likedBooks.contains(id)) {
      likedBooks.remove(id);
    } else {
      likedBooks.add(id);
    }

    Get.find<LikedBooksService>().save(likedBooks);

    update();
  }
}
