import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/product_list.dart';
import 'package:shop/pages/product_details_page.dart';
import 'package:shop/pages/products_oveview_page.dart';
import 'package:shop/utils/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Cadastro o Provider na árvore de componentes, onde envolvi meu MaterialApp.
    return ChangeNotifierProvider(
      //Retorno o ProductList que é onde está o meu ChangeNotifier
      create: (_) => ProductList(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'Lato',
          colorScheme: const ColorScheme.light(
            primary: Colors.purple,
            secondary: Colors.deepOrange,
          ),
          primarySwatch: Colors.purple,
        ),
        home: const ProductsOverviewPage(),
        routes: {
          AppRoutes.Product_Detail: (context) => const ProductDetailPage(),
        },
      ),
    );
  }
}
