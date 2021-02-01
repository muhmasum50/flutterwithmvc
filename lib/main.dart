import 'package:flutter/material.dart';
import 'views/main_page.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ShoesStorePage(),
    ));

