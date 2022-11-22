import 'package:flutter/cupertino.dart';
import 'package:homework_nonnative/components/product_list.dart';
import 'package:homework_nonnative/memory/app_memory.dart';
import 'package:provider/provider.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    final memory = Provider.of<AppMemory>(context);

    return CupertinoPageScaffold(
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return const <Widget>[
            CupertinoSliverNavigationBar(
              largeTitle: Text('Products'),
            )
          ];
        },
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [ProductList(memory.products)],
        ),
      ),
    );
  }
}
