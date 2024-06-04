import 'package:app_polirubro/models/product.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CardProduct extends StatelessWidget {
  final Product product;

  const CardProduct({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
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
                  "url": ""
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
              onPressed: () {},
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              )),
        ],
      ),
    );
  }
}
