import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/product.dart';
import 'package:shop/utils/app_routes.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Estou acessando a lista de produtos pelo meu provider
    final product = Provider.of<Product>(
      context,
      //O false aqui quer dizer que nada será alterado, apenas o que está dentro de Consumer
      listen: false,
    );
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
            product.name,
            textAlign: TextAlign.center,
          ),
          //Consumer usado apenas para envolver o widget onde irá ocorrer a mudança de estado
          leading: Consumer<Product>(
            builder: (context, product, _) => IconButton(
                icon: Icon(product.isFavorite
                    ? Icons.favorite_rounded
                    : Icons.favorite_border_rounded),
                onPressed: () {
                  product.toggleFavorite();
                },
                color: Theme.of(context).colorScheme.secondary),
          ),
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
