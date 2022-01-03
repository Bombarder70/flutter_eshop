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
            child: Container(
              margin: EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "Košík",
                      style: TextStyle(fontSize: 26),
                    ),
                  ),
                  Text(
                    "3 položky ",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "(420€)",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
          ),
          CartItem(title: "xxx"),
          CartItem(title: "xxx"),
          CartItem(title: "xxx"),
          CartItem(title: "xxx"),
        ],
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  final String title;

  const CartItem({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: const EdgeInsets.all(10),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.all(3),
            child: Image.network('https://picsum.photos/250?image=9'),
          ),
          Column(
            children: [
              Expanded(
                child: Container(
                  child: Text(
                    "Product name",
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 7),
                child: Row(
                  children: [
                    Text(
                      "Cena: ",
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      "300€",
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 7),
                child: Row(
                  children: [
                    Text(
                      "Velkost: ",
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      "L",
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
    );
  }
}
