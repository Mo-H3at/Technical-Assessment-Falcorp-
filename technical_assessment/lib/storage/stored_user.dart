import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StoredUser {
  final _storage = const FlutterSecureStorage();

  Future<void> setUser(String user) async{
    await _storage.write(key: 'id', value: user);
  }

  Future<String?> getUser() async {
    final String? user = await _storage.read(key: 'id');
    return user;
  }

  Future<void> removeUser() async {
    await _storage.deleteAll();
  }
}
