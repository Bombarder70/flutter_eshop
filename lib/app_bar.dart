import 'package:flutter/material.dart';
import 'cart_page.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  bool showActions;

  CustomAppBar({
    Key? key,
    this.showActions = true,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        'eShop',
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.tealAccent[700],
      actions: [
        if (showActions)
          IconButton(
            icon: const Icon(Icons.search),
            tooltip: 'Search products',
            onPressed: () {},
          ),
        if (showActions)
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            tooltip: 'Show shopping cart',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute<CartPage>(
                  builder: (BuildContext context) => const CartPage(
                    planetDetail: {"name": "Test"},
                  ),
                ),
              );
            },
          ),
      ],
    );
  }
}
