import 'package:flutter/material.dart';
import 'package:loja_virtual_principal/models/cart_model.dart';
import 'package:loja_virtual_principal/models/user_model.dart';
import 'package:loja_virtual_principal/screens/login_screen.dart';
import 'package:loja_virtual_principal/tiles/cart_tile.dart';
import 'package:scoped_model/scoped_model.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meu Carrinho"),
        actions: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(right: 8),
            child: ScopedModelDescendant<CartModel>(
              builder: (context, child, model) {
                int p = model.products.length;
                return Text(
                  "${p ?? 0} ${p == 1 ? "ITEM" : "ITENS"}",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                );
              },
            ),
          )
        ],
      ),
      body: ScopedModelDescendant<CartModel>(
        // ignore: missing_return
        builder: (context, child, model) {
          if (model.isLoading && UserModel.of(context).isLoggedIn()) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (!UserModel.of(context).isLoggedIn()) {
            return notLoginWidget(context);
          } else if (model.products == null || model.products.isEmpty) {
            return notProductsWidget();
          } else {}
        },
      ),
    );
  }

  Widget notLoginWidget(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.remove_shopping_cart,
            size: 80,
            color: Theme.of(context).primaryColor,
          ),
          SizedBox(height: 16),
          Text(
            "Faça o login para adicionar produtos",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16),
          RaisedButton(
            child: Text(
              "Entrar",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            textColor: Colors.white,
            color: Theme.of(context).primaryColor,
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => LoginScreen()));
            },
          ),
        ],
      ),
    );
  }

  Widget notProductsWidget() {
    return Center(
      child: Text(
        "Nenhum Produto no Carrinho!",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget withProductsWidget(CartModel model) {
    return ListView(
      children: [
        Column(
          children: model.products.map((p) {
            CartTile(p);
          }).toList(),
        )
      ],
    );
  }
}
