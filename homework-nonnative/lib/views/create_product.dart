import 'package:flutter/cupertino.dart';
import 'package:homework_nonnative/memory/app_memory.dart';
import 'package:provider/provider.dart';

import '../types/product.dart';

class CreateProductView extends StatefulWidget {
  const CreateProductView({super.key, this.product});

  final Product? product;

  @override
  State<StatefulWidget> createState() => CreateProductViewState();
}

class CreateProductViewState extends State<CreateProductView> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController imageController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController popularityController = TextEditingController();
  final TextEditingController quantityLeftController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.product != null) {
      titleController.text = widget.product!.title;
      categoryController.text = widget.product!.category;
      imageController.text = widget.product!.image;
      priceController.text = widget.product!.price.toString();
      popularityController.text = widget.product!.popularity.toString();
      quantityLeftController.text = widget.product!.quantityLeft.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    final memory = Provider.of<AppMemory>(context);

    return CupertinoPageScaffold(
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool isScrolled) {
          return <Widget>[
            CupertinoSliverNavigationBar(
              largeTitle: Text(widget.product == null ? "Create" : "Edit"),
            )
          ];
        },
        body: Column(
          children: [
            CupertinoTextField(
                placeholder: "Title", controller: titleController),
            CupertinoTextField(
                placeholder: "Category", controller: categoryController),
            CupertinoTextField(
                placeholder: "Image", controller: imageController),
            CupertinoTextField(
                placeholder: "Price", controller: priceController),
            CupertinoTextField(
                placeholder: "Popularity", controller: popularityController),
            CupertinoTextField(
                placeholder: "Quantity Left",
                controller: quantityLeftController),
            CupertinoButton.filled(
                child: Text(
                  widget.product == null ? "Create" : "Edit",
                  style: const TextStyle(color: CupertinoColors.white),
                ),
                onPressed: () {
                  addProduct(memory);
                })
          ],
        ),
      ),
    );
  }

  void addProduct(AppMemory memory) {
    if (titleController.text == "" ||
        categoryController.text == "" ||
        imageController.text == "" ||
        priceController.text == "" ||
        popularityController.text == "" ||
        quantityLeftController.text == "") {
      return;
    }

    if (!imageController.text.startsWith("https://")) return;

    if (widget.product == null) {
      memory.products = [
        ...memory.products,
        Product(
            title: titleController.text,
            category: categoryController.text,
            image: imageController.text,
            price: double.tryParse(priceController.text) ?? 0,
            popularity: int.tryParse(popularityController.text) ?? 0,
            quantityLeft: int.tryParse(quantityLeftController.text) ?? 0)
      ];
    } else {
      widget.product!.title = titleController.text;
      widget.product!.category = categoryController.text;
      widget.product!.image = imageController.text;
      widget.product!.price = double.tryParse(priceController.text) ?? 0;
      widget.product!.popularity = int.tryParse(popularityController.text) ?? 0;
      widget.product!.quantityLeft =
          int.tryParse(quantityLeftController.text) ?? 0;
      memory.products = [...memory.products];
      Navigator.of(context).pop();
    }
  }
}
