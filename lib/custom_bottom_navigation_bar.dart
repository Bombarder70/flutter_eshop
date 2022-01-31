import 'package:flutter/material.dart';
import 'cart_page.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => CustomBottomNavigationBarState();
}

class CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        break;
      case 1:
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute<CartPage>(
            builder: (BuildContext context) => const CartPage(),
          ),
        );
        break;
      case 3:
        break;
    }

    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      unselectedItemColor: Colors.black,
      selectedItemColor: Colors.teal,
      onTap: _onItemTapped,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Explore',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.view_module_rounded),
          label: 'Catalog',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: 'My cart',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.child_care),
          label: 'Profile',
        ),
      ],
      currentIndex: _selectedIndex,
    );
  }
}
