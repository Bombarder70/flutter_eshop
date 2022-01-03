import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

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
      backgroundColor: Colors.deepOrange[200],
      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          tooltip: 'Search products',
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.shopping_cart),
          tooltip: 'Show shopping cart',
          onPressed: () {},
        ),
      ],
    );
  }
}
