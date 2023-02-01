// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:shop/components/product_grid.dart';

import '../components/badge.dart';

enum FilterOptions {
  Favorite,
  All,
}

class ProductsOverviewPage extends StatefulWidget {
  const ProductsOverviewPage({Key? key}) : super(key: key);

  @override
  State<ProductsOverviewPage> createState() => _ProductsOverviewPageState();
}

class _ProductsOverviewPageState extends State<ProductsOverviewPage> {
  bool _showFavoriteOnly = false;

  @override
  Widget build(BuildContext context) {
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
                setState(() {
                  if (selectedValue == FilterOptions.Favorite) {
                    _showFavoriteOnly = true;
                  } else {
                    _showFavoriteOnly = false;
                  }
                  // ignore: avoid_print
                  print(_showFavoriteOnly);
                });
              }),
          BadgeComponent(
            value: '2',
            child: (IconButton(
              onPressed: () {},
              icon: const Icon(Icons.shopping_cart),
            )),
          ),
        ],
        title: const Center(
          child: Text('Minha Loja'),
        ),
      ),
      body: ProductGrid(_showFavoriteOnly),
    );
  }
}
