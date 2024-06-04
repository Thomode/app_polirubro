import 'dart:io';

import 'package:app_polirubro/models/product_request.dart';
import 'package:app_polirubro/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class FormProductScreen extends StatefulWidget {
  const FormProductScreen({super.key});

  @override
  State<FormProductScreen> createState() => _FormProductScreenState();
}

class _FormProductScreenState extends State<FormProductScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _barcodeController = TextEditingController();
  final TextEditingController _buyPriceController = TextEditingController();
  final TextEditingController _salePriceController = TextEditingController();
  final TextEditingController _quantityStockController = TextEditingController();

  File? _image = null;
  late String filename;

  Future<void> _pickerCam() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);

    if (image == null) return;

    final imageTemp = File(image.path);

    setState(() {
      _image = imageTemp;
    });
  }

  Future<void> _pickerGallery() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (image == null) return;

    final imageTemp = File(image.path);

    setState(() {
      _image = imageTemp;
    });
  }

  Future<void> _scanBarcodeNormal() async {
    String barcodesScanRes;

    barcodesScanRes = await FlutterBarcodeScanner.scanBarcode("#ff6666", "Cancelar", true, ScanMode.BARCODE);

    if (!mounted) return;

    setState(() {
      _barcodeController.text = barcodesScanRes != "-1" ? barcodesScanRes : "";
    });
  }

  @override
  Widget build(BuildContext context) {
    final ProductProvider productProvider = Provider.of<ProductProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Agregar Producto",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            context.go("/products");
          },
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        child: ListView(
          children: [
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    width: 120,
                    height: 120,
                    child: _image != null ?
                    GestureDetector(
                      onTap: () {},
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.file(
                          _image!,
                          fit: BoxFit.cover,
                        ),
                    ),
                    )
                        : const Icon(
                      Icons.photo,
                      size: 120,
                      color: Colors.grey,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ElevatedButton.icon(
                        onPressed: _pickerCam,
                      style: ElevatedButton.styleFrom(shape: const StadiumBorder(), padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16), backgroundColor: Colors.indigo),
                        icon: const Icon(Icons.photo_camera, color: Colors.white,),
                        label: const Text('Camara', style: TextStyle(color: Colors.white),),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton.icon(
                        onPressed: _pickerGallery,
                        style: ElevatedButton.styleFrom(shape: const StadiumBorder(), padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16), backgroundColor: Colors.indigo),
                        icon: const Icon(Icons.folder, color: Colors.white,),
                        label: const Text('Galeria', style: TextStyle(color: Colors.white),),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(width: 10),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              child: TextField(
                controller: _nameController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
                    hintText: "Nombre",
                    prefixIcon: Icon(Icons.drive_file_rename_outline)),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              child: TextField(
                controller: _descriptionController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
                  hintText: "Descripcion",
                  prefixIcon: Icon(Icons.description),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              child: TextField(
                controller: _barcodeController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
                    hintText: "Codigo de Barras",
                    prefixIcon: const Icon(Icons.numbers),
                    suffixIcon: IconButton(onPressed: _scanBarcodeNormal, icon: const Icon(Icons.barcode_reader))),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              child: TextField(
                controller: _buyPriceController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
                    hintText: "Precio de Compra",
                    prefixIcon: Icon(Icons.price_change)),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              child: TextField(
                controller: _salePriceController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
                    hintText: "Precio de Venta",
                    prefixIcon: Icon(Icons.price_change_outlined)),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              child: TextField(
                controller: _quantityStockController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
                    hintText: "Cantidad de Stock",
                    prefixIcon: Icon(Icons.production_quantity_limits)),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            ElevatedButton(
              onPressed: () async {
                try{
                  ProductRequest productRequest = ProductRequest(
                      name: _nameController.text,
                      description: _descriptionController.text,
                      buyPrice: double.parse(_buyPriceController.text),
                      salePrice: double.parse(_salePriceController.text),
                      quantityStock: int.parse(_quantityStockController.text),
                      categoryId: 1
                  );

                  await productProvider.save(productRequest);
                  context.go("/products");

                } catch(e){
                  print(e.toString());
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Error al guardar el producto'),
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
              style: ElevatedButton.styleFrom(shape: const StadiumBorder(), padding: const EdgeInsets.symmetric(vertical: 16), backgroundColor: Colors.indigo),
              child: const Center(
                  child: Text(
                'Agregar',
                style: TextStyle(fontSize: 18, color: Colors.white),
              )),
            ),
          ],
        ),
      ),
    );
  }
}
