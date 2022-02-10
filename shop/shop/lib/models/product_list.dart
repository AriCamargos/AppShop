import 'package:flutter/material.dart';
import 'package:shop/data/dummy_data.dart';
import 'package:shop/models/product.dart';

//Acessando as lista de produtos pelo provider com o MIXIN.
class ProductList with ChangeNotifier {
  //Lista sendo inicalizada
  final List<Product> _items = dummyProducts;

  //Retorno um clone para não acessar diretamente minha lista.
  List<Product> get items => [..._items];

  //Método de add produto
  void addProduct(Product product) {
    //Add um produto, ou seja, vai ter uma mudança.
    _items.add(product);
    //Notificando a mudança a minha lista que é a Subject.
    notifyListeners();
  }
}
