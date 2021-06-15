import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:loja_virtual_principal/datas/products_data.dart';

class CardProduct {
  String cid;
  String category;
  String pid;
  int quantity;
  String size;

  ProductData productData;

  CardProduct.fromDocument(DocumentSnapshot document) {
    cid = document.documentID;
    category = document.data["category"];
    pid = document.data["pid"];
    quantity = document.data["quantity"];
    size = document.data["size"];
  }

  Map<String, dynamic> toMap() {
    return {
      "category": category,
      "pid": pid,
      "quantity": quantity,
      "size": size,
      "product": productData.toResumeMap(),
    };
  }
}
