import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

class Products {
  Products({
    required this.title,
    required this.category,
    required this.description,
    required this.price,
    required this.image,
    required this.id,
  });
  late String title, category, description, image;
  var price, id;

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
      title: json['title'],
      category: json['category'],
      description: json['description'],
      price: json['price'],
      id: json['id'],
      image: json['image'],
    );
  }
}

String url = 'https://fakestoreapi.com/products';

Future<List<Products>> fetchProductsData() async {
  http.Response response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((data) => Products.fromJson(data)).toList();
  } else {
    throw Exception('Unexpected error occured!');
  }
}
