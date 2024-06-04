import 'package:app_polirubro/models/product.dart';
import 'package:app_polirubro/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class CardProduct extends StatelessWidget {
  final Product product;

  const CardProduct({super.key, required this.product});

  void _showConfirmationDialog(BuildContext context, int productId, ProductProvider productProvider) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirmar Eliminación'),
        content: const Text('¿Estás seguro de que deseas eliminar este producto?'),
        actions: <Widget>[
          TextButton(
            child: const Text('Cancelar'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text('Eliminar'),
            onPressed: () async {
              Navigator.of(context).pop();
              try {
                await productProvider.delete(productId);
                await productProvider.findAll();
              } catch (e) {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Error al Eliminar el producto'),
                    content: Text(e.toString().split(': ')[1]),
                    actions: <Widget>[
                      TextButton(
                        child: const Text('Aceptar'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  void _onDeleteProduct(BuildContext context, int productId, ProductProvider productProvider) {
    _showConfirmationDialog(context, productId, productProvider);
  }

  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider = Provider.of<ProductProvider>(context);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 3),
      height: 135,
      width: double.infinity,
      child: Row(
        children: [
          GestureDetector(
            onTap: () async {
              context.go(Uri(
                path: "/image-full",
                queryParameters: {
                  "url": product.image!.url
                }
              ).toString());
            },
            child: Container(
                padding: const EdgeInsets.all(5),
                width: 100,
                height: 100,
                child: product.image == null
                    ? const Center(
                  child: Text("No image"),
                )
                    : ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    product.image!.url,
                    fit: BoxFit.fill,
                  ),
                )
            ),
          ),
          Expanded(
              child: ListTile(
                title: Text(product.name, style: const TextStyle(color: Colors.indigo, fontSize: 18)),
                subtitle: Text(product.description, style: const TextStyle(fontSize: 11)),
              )),
          IconButton(
              onPressed: () => _onDeleteProduct(context, product.id, productProvider),
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              )),
        ],
      ),
    );
  }
}
