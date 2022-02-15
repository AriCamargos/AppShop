import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/product_item.dart';
import 'package:shop/models/product.dart';
import 'package:shop/models/product_list.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Informo o provider que quero obter.
    final provider = Provider.of<ProductList>(context);
    //Acessando a lista de produtos a partir de notifier
    final List<Product> loadedProducts = provider.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      //itemCount exibe apenas os elementos da lista
      itemCount: loadedProducts.length,
      itemBuilder: (context, index) => ChangeNotifierProvider.value(
        value: loadedProducts[index],
        child: const ProductItem(),
      ),
      //Esse grid é fixo, vai mostrar uma lista fixa
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
