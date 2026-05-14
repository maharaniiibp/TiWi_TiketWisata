import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class FavoriteStorage {

  static const String key =
      "favorite_destinations";

  // SAVE FAVORITE
  static Future<void> saveFavorite(
    Map<String, dynamic> data,
  ) async {

    final prefs =
        await SharedPreferences
            .getInstance();

    List<String> favorites =
        prefs.getStringList(key) ?? [];

    final encoded =
        jsonEncode(data);

    // jangan duplicate
    if (!favorites.contains(encoded)) {

      favorites.add(encoded);

      await prefs.setStringList(
        key,
        favorites,
      );
    }
  }

  // GET FAVORITES
  static Future<List<Map<String, dynamic>>>
      getFavorites() async {

    final prefs =
        await SharedPreferences
            .getInstance();

    List<String> favorites =
        prefs.getStringList(key) ?? [];

    return favorites
        .map(
          (e) => jsonDecode(e)
              as Map<String, dynamic>,
        )
        .toList();
  }

  // REMOVE FAVORITE
  static Future<void> removeFavorite(
    Map<String, dynamic> data,
  ) async {

    final prefs =
        await SharedPreferences
            .getInstance();

    List<String> favorites =
        prefs.getStringList(key) ?? [];

    favorites.remove(
      jsonEncode(data),
    );

    await prefs.setStringList(
      key,
      favorites,
    );
  }
}