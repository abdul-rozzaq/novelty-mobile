import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:novelty/models/book_model.dart';
import 'package:novelty/models/location_models.dart';
import 'package:novelty/models/user_model.dart';
import 'package:novelty/services/local_storage.dart';
import 'package:novelty/services/requests.dart';

class AppController extends GetxController {
  List<String> carousel = [];
  bool isCarouselLoaded = false;

  List<Genre> genres = [];
  List<Region> regions = [];

  List<String> likedBooksIds = [];
  List<Book> get likedBooks => List.from(books.where((element) => likedBooksIds.contains(element.id)));

  List<Book> books = [];
  bool isBookLoaded = false;

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
    loadLikedBooks();

    await loadBooks();
    await loadCarouselItems();
    await loadGenres();
    await loadLocations();

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

    isCarouselLoaded = true;

    update();
  }

  Future<void> loadBooks() async {
    final response = await Requests.fetchData('/api/get-books/');

    if (response.statusCode == 200) {
      books = Book.fromListMap(response.body);
      isBookLoaded = true;

      popularBooks = shuffler(books.where((book) => book.genres.where((genre) => [4, 3, 9, 7].contains(genre.id)).isNotEmpty).toList());
      scientificBooks = shuffler(books.where((book) => book.genres.where((genre) => [5, 2, 10, 11, 14].contains(genre.id)).isNotEmpty).toList());

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
    likedBooksIds = Get.put(LikedBooksService()).get() != null ? List<String>.from(Get.put(LikedBooksService()).get().map<String>((e) => e.toString())) : [];
  }

  addLikeToBook(String id) {
    if (likedBooksIds.contains(id)) {
      likedBooksIds.remove(id);
    } else {
      likedBooksIds.add(id);
    }

    Get.find<LikedBooksService>().save(likedBooksIds);

    update();
  }
}
