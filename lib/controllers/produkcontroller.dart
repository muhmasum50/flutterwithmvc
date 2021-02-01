import 'package:get/state_manager.dart';
import 'package:api/models/produk.dart';
import 'package:api/webservices/ws.dart';

class ProdukController extends GetxController {
  
  var isLoading = true.obs;
  var produkList  = List<Product>().obs;

  @override
  void onInit() {
    fetchProduk();
    super.onInit();
  }

  // fetch api
  void fetchProduk() async {
    try {
      isLoading(true);
      var produk = await Ws.fetchProduk();
      if(produk != null) {
        produkList.value = produk;
      }
    }
    finally {
      isLoading(false);
    }
  }
}