import 'package:flutter/material.dart';
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
    return MaterialApp(
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
      home: ProductsOverviewPage(),
      routes: {
        AppRoutes.Product_Detail: (context) => const ProductDetailPage(),
      },
    );
  }
}
