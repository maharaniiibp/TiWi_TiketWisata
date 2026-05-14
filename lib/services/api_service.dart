import 'dart:convert';

import 'package:http/http.dart'
    as http;

import '../models/destination_model.dart';

class ApiService {

  static Future<List<DestinationModel>>
      fetchDestinations() async {

    final response = await http.get(

      Uri.parse(
        'https://6a054e35aa826ca75c09a37b.mockapi.io/api/wisataindonesia/destinations',
      ),
    );

    if (response.statusCode == 200) {

      final List data =
          jsonDecode(response.body);

      return data
          .map(
            (json) =>
                DestinationModel
                    .fromJson(json),
          )
          .toList();

    } else {

      throw Exception(
        'Failed to load destinations',
      );
    }
  }
}