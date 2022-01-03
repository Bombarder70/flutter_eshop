import 'package:flutter/material.dart';
import 'app_bar.dart';

class CartPage extends StatefulWidget {
  final Map planetDetail;

  const CartPage({Key? key, required this.planetDetail}) : super(key: key);
  @override
  State<StatefulWidget> createState() => CartPageState();
}

class CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        showActions: false,
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [],
            ),
          ),
          Divider(color: Colors.black),
          Row(
            children: [],
          ),
          Row(
            children: [],
          )
        ],
      ),
    );
  }
}
