import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class BookingStorage {

  static const String key =
      "booking_history";

  static Future<void> saveBooking(
    Map<String, dynamic> booking,
  ) async {

    final prefs =
        await SharedPreferences
            .getInstance();

    List<String> bookings =
        prefs.getStringList(key) ?? [];

    bookings.add(
      jsonEncode(booking),
    );

    await prefs.setStringList(
      key,
      bookings,
    );
  }

  static Future<List<Map<String, dynamic>>>
      getBookings() async {

    final prefs =
        await SharedPreferences
            .getInstance();

    List<String> bookings =
        prefs.getStringList(key) ?? [];

    return bookings
        .map(
          (e) => jsonDecode(e)
              as Map<String, dynamic>,
        )
        .toList();
  }
}