import 'package:http/http.dart' as http;
import 'package:api/models/produk.dart';

class Ws {
  static var client = http.Client();

  static Future<List<Product>> fetchProduk() async {
    var response = await client.get(
        'https://recommender.nggonepixel.com/api/webservices/product');

    if(response.statusCode == 200) {
      var jsonString = response.body;
      return productFromJson(jsonString);
    } 
    else {
      return null;
    }

  }
}