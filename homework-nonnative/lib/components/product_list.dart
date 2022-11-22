import 'package:flutter/cupertino.dart';
import 'package:homework_nonnative/components/product_box.dart';
import 'package:homework_nonnative/types/product.dart';

class ProductList extends StatelessWidget {
  final List<Product> products;

  const ProductList(this.products, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 500,
      child: ListView.builder(
          padding: const EdgeInsets.all(20.0),
          scrollDirection: Axis.horizontal,
          itemCount: products.length,
          itemBuilder: (BuildContext context, int index) {
            products.sort((a, b) => b.popularity.compareTo(a.popularity));
            return ProductBox(products[index]);
          }),
    );
  }
}
