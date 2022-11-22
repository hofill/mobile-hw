import 'package:flutter/cupertino.dart';
import 'package:homework_nonnative/memory/app_memory.dart';
import 'package:homework_nonnative/views/create_product.dart';
import 'package:homework_nonnative/views/product.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: MultiProvider(
        providers: [ChangeNotifierProvider.value(value: AppMemory())],
        child: CupertinoTabScaffold(
          tabBuilder: (context, index) {
            return const [ProductView(), CreateProductView()][index];
          },
          tabBar: CupertinoTabBar(
            items: const [
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.add),
                label: "Products",
              ),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.add), label: "Create Product")
            ],
          ),
        ),
      ),
    );
  }
}
