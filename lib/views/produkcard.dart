import 'package:flutter/material.dart';
import 'package:api/models/produk.dart';
import 'package:intl/intl.dart';

class ProductTile extends StatelessWidget {
  final Product produk;
  const ProductTile(this.produk);


  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 180,
                  width: double.infinity,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Image.network(
                    produk.picture,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              produk.productName,
              maxLines: 2,
              style:
                  TextStyle(fontFamily: 'avenir', fontWeight: FontWeight.w800),
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 8),
            Text(NumberFormat.currency(locale:'id', symbol: 'Rp ', decimalDigits: 0).format(int.parse(produk.price)),
                style: TextStyle(fontSize: 20, fontFamily: 'avenir')
            ),
            // Text('Rp '+ produk.price,
            //     style: TextStyle(fontSize: 20, fontFamily: 'avenir')
            // ),
          ],
        ),
      ),
    );
  }
}