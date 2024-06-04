import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ImageFullScreen extends StatelessWidget {
  final String? imageUrl;

  const ImageFullScreen({super.key, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Imagen",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              context.go("/products");
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.black,
        ),
        body: Container(
          color: Colors.black,
          child: Center(
              child: SizedBox.expand(
                  child: Hero(
            tag: "image",
            child: imageUrl != null
                ? Image.network(imageUrl!)
                : Icon(
                    Icons.photo,
                    color: Colors.grey,
                    size: MediaQuery.of(context).size.width,
                  ),
          ))),
        ));
  }
}
