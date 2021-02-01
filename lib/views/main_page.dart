import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:api/controllers/produkcontroller.dart';
import 'package:get/instance_manager.dart';
import 'package:get/get.dart';
import 'package:api/views/produkcard.dart';

const bottomBackgroundColor = Color(0xFFF1F2F7);
const brands = ['Kaos', 'Hodie', 'Jersey', 'Kemeja', 'Polo'];
const marginSide = 14.0;
const leftItemSeparator = const SizedBox(
  width: 30,
);

final ProdukController produkController = Get.put(ProdukController());

class ShoesStorePage extends StatefulWidget {
  @override
  _ShoesStorePageState createState() => _ShoesStorePageState();
}

class _ShoesStorePageState extends State<ShoesStorePage> {

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'PIXEL STORE',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 26,
                  color: Colors.black,
                ),
              ),
              Spacer(),
              CircleAvatar(
                backgroundColor: Colors.grey[200],
                child: IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  onPressed: () {},
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              CircleAvatar(
                backgroundColor: Colors.grey[200],
                child: IconButton(
                  icon: Icon(
                    Icons.notifications_none,
                    color: Colors.black,
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: brands.length,
              itemBuilder: (_, index) => Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
                child: Text(
                  brands[index],
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: index == 0 ? Colors.black : Colors.grey[400],
                    fontSize: 17,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildBottomNavigationBar() => BottomNavigationBar(
        selectedItemColor: Colors.red,
        backgroundColor: bottomBackgroundColor,
        unselectedItemColor: Colors.grey[400],
        elevation: 4,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            label: '',
            icon: Icon(
              Icons.home,
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(
              Icons.favorite_border,
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(
              Icons.location_city,
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(
              Icons.shopping_cart,
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(
              Icons.person_outline,
            ),
          )
        ],
      );


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: _buildBottomNavigationBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(marginSide),
            child: _buildHeader(), 
          ),
          Expanded(
            child: Obx(() {
              if(produkController.isLoading.value)
                return Center(child:CircularProgressIndicator());
              else 
                return StaggeredGridView.countBuilder(
                  crossAxisCount: 2, 
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  itemCount : produkController.produkList.length,
                  itemBuilder: (context, index) {
                    // return  Container(
                    //   height: 100,
                    //   width :100,
                    //   color : Colors.red
                    // );
                    return ProductTile(produkController.produkList[index]);
                  }, 
                  staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                );
            }
          )),
        ],
      ),
    );
  }
}