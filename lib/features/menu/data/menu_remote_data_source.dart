import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

import '../domain/menu_item.dart';

@injectable
class MenuRemoteDataSource {
  MenuRemoteDataSource(this._client);

  final http.Client _client;

  Future<List<MenuItem>> fetchMenuItems() async {
    final response = await _client.get(
      Uri.https('dummyjson.com', '/products', {'limit': '20'}),
    );

    if (response.statusCode != 200) {
      throw Exception('Menu request failed (${response.statusCode})');
    }

    final payload = jsonDecode(response.body) as Map<String, dynamic>;
    final products = payload['products'] as List<dynamic>;

    return products.map((product) {
      final item = product as Map<String, dynamic>;
      return MenuItem(
        id: item['id'].toString(),
        name: item['title'] as String,
        price: (item['price'] as num).toDouble(),
      );
    }).toList();
  }
}