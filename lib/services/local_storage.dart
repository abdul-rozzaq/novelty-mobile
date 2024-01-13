import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:novelty/models/user_model.dart';

class AbstractStorage extends GetxService {
  String get key => '';
  Object get model => Object();

  GetStorage box = GetStorage();

  Future<AbstractStorage> init() async {
    await GetStorage.init();
    return this;
  }

  Future save(dynamic object) => box.write(key, object);

  Future delete() async => box.remove(key);

  Future<bool> isValid() async => await get() != null;

  get() => box.read(key);
}

class AuthService extends AbstractStorage {
  @override
  get key => 'token';
}

class UserService<T> extends AbstractStorage {
  @override
  get key => 'user';

  @override
  T get() => super.get() is User ? super.get() : User.fromJson(super.get());
}
