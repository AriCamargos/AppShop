// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/product_grid.dart';
import 'package:shop/models/product_list.dart';

enum FilterOptions {
  Favorite,
  All,
}

class ProductsOverviewPage extends StatelessWidget {
  const ProductsOverviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductList>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          //Filtro lateral superior com opções
          PopupMenuButton(
              itemBuilder: (_) => [
                    const PopupMenuItem(
                      child: Text('Somente Favoritos'),
                      value: FilterOptions.Favorite,
                    ),
                    const PopupMenuItem(
                      child: Text('Todos'),
                      value: FilterOptions.All,
                    ),
                  ],
              // ignore: avoid_print
              onSelected: (FilterOptions selectedValue) {
                if (selectedValue == FilterOptions.Favorite) {
                  provider.showFavoriteOnly();
                } else {
                  provider.showAll();
                }
              }),
        ],
        title: const Center(
          child: Text('Minha Loja'),
        ),
      ),
      body: const ProductGrid(),
    );
  }
}
