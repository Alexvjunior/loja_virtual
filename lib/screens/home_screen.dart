import 'package:flutter/material.dart';
import 'package:loja_virtual_principal/tabs/home_tap.dart';
import 'package:loja_virtual_principal/tabs/products_tap.dart';
import 'package:loja_virtual_principal/widgets/cart_button.dart';
import 'package:loja_virtual_principal/widgets/custom_drawer.dart';

class HomeScreen extends StatelessWidget {
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      children: [
        Scaffold(
          body: HomeTap(),
          drawer: CustomDrawer(_pageController),
          floatingActionButton: CartButton(),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text("Produtos"),
            centerTitle: true,
          ),
          drawer: CustomDrawer(_pageController),
          body: ProductsTap(),
          floatingActionButton: CartButton(),
        ),
        Container(color: Colors.yellow),
        Container(color: Colors.green),
      ],
    );
  }
}
