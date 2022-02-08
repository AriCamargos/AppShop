import 'package:flutter/material.dart';
import 'package:shop/models/product.dart';
import 'package:shop/utils/app_routes.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: GridTile(
        //Para a imagem ser clicável
        child: GestureDetector(
          //Quando a pessoa clicar na tela fará a navegação
          onTap: () {
            Navigator.of(context).pushNamed(
              AppRoutes.Product_Detail,
              arguments: product,
            );
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
          leading: IconButton(
              icon: const Icon(Icons.favorite_rounded),
              onPressed: () {},
              color: Theme.of(context).colorScheme.secondary),
          trailing: IconButton(
            icon: const Icon(Icons.shopping_cart_rounded),
            onPressed: () {},
            color: Theme.of(context).colorScheme.secondary,
          ),
          backgroundColor: Colors.black45,
        ),
      ),
    );
  }
}
