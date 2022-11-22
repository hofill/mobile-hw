import 'package:flutter/cupertino.dart';
import 'package:homework_nonnative/memory/app_memory.dart';
import 'package:homework_nonnative/types/product.dart';
import 'package:homework_nonnative/views/create_product.dart';
import 'package:provider/provider.dart';

class ProductBox extends StatelessWidget {
  final Product product;

  const ProductBox(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    final memory = Provider.of<AppMemory>(context);
    return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(children: [
          Stack(
            children: [
              Image.network(product.image),
              Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Column(
                    children: [
                      Text(product.title),
                      Text(product.category),
                      Text(product.price.toString()),
                    ],
                  ))
            ],
          ),
          Row(
            children: [
              GestureDetector(
                child: const Icon(CupertinoIcons.pencil, size: 40),
                onTap: () => Navigator.of(context).push(CupertinoPageRoute(
                    builder: (context) => ChangeNotifierProvider.value(
                          value: memory,
                          child: CreateProductView(
                            product: product,
                          ),
                        ))),
              ),
              GestureDetector(
                  child: const Icon(CupertinoIcons.trash, size: 40),
                  onTap: () => delete(context, memory, product))
            ],
          )
        ]));
  }

  delete(BuildContext context, AppMemory memory, Product product) {
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text("Confirm Deletion"),
        content: const Text("Confirm Deletion?"),
        actions: [
          CupertinoDialogAction(
            child: const Text("No"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          CupertinoDialogAction(
            child: const Text("Yes"),
            onPressed: () {
              memory.products =
                  memory.products.where((pEl) => pEl.id != product.id).toList();
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
