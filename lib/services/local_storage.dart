import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:novelty/models/token_model.dart';
import 'package:novelty/models/user_model.dart';

class AbstractStorage extends GetxService {
  String get key => '';
  Object get model => Object();

  GetStorage box = GetStorage();

  Future save(dynamic object) => box.write(key, object);

  Future delete() async => box.remove(key);

  Future<bool> isValid() async => await get() != null;

  get() => box.read(key);
}

class AuthService extends AbstractStorage {
  @override
  get key => 'token';

  @override
  get() {
    var x = super.get() != null
        ? super.get() is Token
            ? super.get()
            : Token.fromJson(super.get())
        : null;

    return x;
  }
}

class UserService extends AbstractStorage {
  @override
  get key => 'user';

  @override
  get() => super.get() is User ? super.get() : User.fromJson(super.get());
}

class LikedBooksService extends AbstractStorage {
  @override
  get key => 'liked_books';
}
