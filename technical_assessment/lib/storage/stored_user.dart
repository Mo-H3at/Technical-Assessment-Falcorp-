import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StoredUser {
  final _storage = const FlutterSecureStorage();

  Future<void> setStoredUser(String user, String membershipId) async{
    await _storage.write(key: 'id', value: user);
    await _storage.write(key: 'membershipId', value: membershipId);
  }

  Future<String?> getStoredUser() async {
    final String? user = await _storage.read(key: 'id');
    return user;
  }

  Future<void> removeStoredUser() async {
    await _storage.deleteAll();
  }
}
