import 'dart:convert';

import 'package:ara_vnext/logic/models/user.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageServices {
  UserData user;

  final _storage = FlutterSecureStorage();

  final String userKey = 'USER-KEY';

  Future saveUserToLocalStorage(UserData userData) async {
    if (userData != null) {
      var encodedUser = json.encode(userData.toJson());
      await _storage.write(key: userKey, value: encodedUser);
      print('user saved to storage successfuly');
    }
  }

  Future<UserData> loadUserFromStorage() async {
    var jsonUser = await _storage.read(key: userKey);
    if (jsonUser != null) {
      final decodedUser = json.decode(jsonUser);
      user = UserData.fromJson(decodedUser);
      print('user loaded form storage successfuly');
    }
    return user;
  }

  get isUserLogged => user != null;

  Future deleteUser() async {
    await _storage.delete(key: userKey);
    print('user deleted');
  }
}
