import 'package:flutter/material.dart';
import 'package:loja_virtual_principal/screens/home_screen.dart';

void main() {
  runApp(MaterialApp(
      title: "Flutter Clothing",
      theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: Color.fromARGB(255, 4, 125, 141)),
      debugShowCheckedModeBanner: false,
      home: HomeScreen()));
}
