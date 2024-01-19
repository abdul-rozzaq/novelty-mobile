import 'package:get/get.dart';
import 'package:novelty/models/location_models.dart';
import 'package:novelty/models/user_model.dart';
import 'package:novelty/services/local_storage.dart';
import 'package:novelty/services/requests.dart';

class AppController extends GetxController {
  List<String> carousel = [];
  List<Map<String, dynamic>> genres = [];
  List<Region> regions = [];

  late User? user;
  District? get district => user?.district;

  @override
  void onInit() {
    super.onInit();

    startLoad();
  }

  Future startLoad() async {
    await loadUser();
    await loadCarouselItems();
    await loadGenres();
    await loadLocations();

    update();
  }

  loadUser() {
    user = Get.put(UserService()).get();
  }

  Future<void> loadCarouselItems() async {
    final response = await Requests.fetchData('/api/carousel-items/');

    if (response.statusCode == 200) {
      carousel = (response.body as List).map<String>((e) => e.toString()).toList();
    }
  }

  Future<void> loadGenres() async {
    final response = await Requests.fetchData('/api/genres/');

    if (response.statusCode == 200) {
      genres = (response.body as List).map<Map<String, dynamic>>((e) => {'id': e['id'], 'name': e['name']}).toList();
    }
  }

  Future<void> loadLocations() async {
    final response = await Requests.fetchData('/api/locations/');

    if (response.statusCode == 200) {
      regions = (response.body as List).map<Region>((e) => Region.fromJson(e)).toList();

      regions.sort((a, b) => a.name.substring(0, 1).compareTo(b.name.substring(0, 1)));
    }
  }
}
