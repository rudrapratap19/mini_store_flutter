import 'package:shared_preferences/shared_preferences.dart';

class WishlistService {
  static const _key = 'wishlist_ids';
  static late SharedPreferences _prefs;

  static Future<void> initialize() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static List<int> getWishlist() {
    final list = _prefs.getStringList(_key) ?? <String>[];
    return list.map(int.parse).toList();
  }

  static Future<void> saveWishlist(List<int> ids) async {
    final strList = ids.map((e) => e.toString()).toList();
    await _prefs.setStringList(_key, strList);
  }

  static Future<void> addToWishlist(int id) async {
    final ids = getWishlist();
    if (!ids.contains(id)) {
      ids.add(id);
      await saveWishlist(ids);
    }
  }

  static Future<void> removeFromWishlist(int id) async {
    final ids = getWishlist();
    ids.remove(id);
    await saveWishlist(ids);
  }

  static bool isInWishlist(int id) {
    final ids = getWishlist();
    return ids.contains(id);
  }
}
