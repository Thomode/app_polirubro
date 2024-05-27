import 'package:app_polirubro/models/product.dart';
import 'package:app_polirubro/providers/auth_provider.dart';
import 'package:app_polirubro/providers/dark_theme_provider.dart';
import 'package:app_polirubro/widgets/card_product.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

/*
List<Product> products = [
  Product(
      id: 1,
      name: "Telefono",
      description: "color negro",
      image: "https://mexx-img-2019.s3.amazonaws.com/Celular-Samsung-galaxy-A14-5G-128G-Verde_46562_1.jpeg",
      price: 1000000,
      quantityStock: 10),
  Product(
      id: 2,
      name: "Telefono",
      description: "color negro",
      image: "https://mexx-img-2019.s3.amazonaws.com/Celular-Samsung-galaxy-A14-5G-128G-Verde_46562_1.jpeg",
      price: 1000000,
      quantityStock: 10),
  Product(
      id: 3,
      name: "Telefono",
      description: "color negro",
      image: "https://mexx-img-2019.s3.amazonaws.com/Celular-Samsung-galaxy-A14-5G-128G-Verde_46562_1.jpeg",
      price: 1000000,
      quantityStock: 10),
  Product(
      id: 4,
      name: "Telefono",
      description: "color negro",
      image: "https://mexx-img-2019.s3.amazonaws.com/Celular-Samsung-galaxy-A14-5G-128G-Verde_46562_1.jpeg",
      price: 1000000,
      quantityStock: 10),
  Product(
      id: 5,
      name: "Telefono",
      description: "color negro",
      image: "https://mexx-img-2019.s3.amazonaws.com/Celular-Samsung-galaxy-A14-5G-128G-Verde_46562_1.jpeg",
      price: 1000000,
      quantityStock: 10),
  Product(
      id: 6,
      name: "Telefono",
      description: "color negro",
      image: "https://mexx-img-2019.s3.amazonaws.com/Celular-Samsung-galaxy-A14-5G-128G-Verde_46562_1.jpeg",
      price: 1000000,
      quantityStock: 10),
];
*/

List<Product> products = [];

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<StatefulWidget> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    final DarkThemeProvider darkThemeProvider = Provider.of<DarkThemeProvider>(context);
    final AuthProvider authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Productos", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.indigo,
        centerTitle: true,
        leading: IconButton(
          onPressed: () async {
            await authProvider.logout();
          },
          icon: const Icon(
            Icons.logout,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                darkThemeProvider.darkTheme = !darkThemeProvider.darkTheme;
                print(darkThemeProvider.darkTheme);
              },
              icon: const Icon(
                Icons.light_mode,
                color: Colors.white,
              ))
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                  border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
                  hintText: "Buscar",
                  suffixIcon: IconButton(onPressed: () {}, icon: const Icon(Icons.search))),
            ),
            const SizedBox(height: 20),
            Expanded(
                child: ListView.separated(
              separatorBuilder: (context, index) => Divider(color: darkThemeProvider.darkTheme ? Colors.white54 : Colors.black54),
              itemCount: products.length,
              itemBuilder: (context, index) => CardProduct(
                product: products[index],
              ),
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.go("/form-product");
        },
        backgroundColor: Colors.indigo,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
