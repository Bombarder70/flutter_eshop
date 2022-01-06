import 'package:flutter/material.dart';
import 'app_bar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'cart.dart';

class CartPage extends StatefulWidget {
  final Map planetDetail;

  const CartPage({Key? key, required this.planetDetail}) : super(key: key);
  @override
  State<StatefulWidget> createState() => CartPageState();
}

class CartPageState extends State<CartPage> {
  @override
  void initState() {
    super.initState();
    _loadData();
  }

  //List<dynamic> _products = [];
  String nextPage = "";
  int loadedPage = 1;

  List<Result> _allProducts = [];

  void _removeItem(int id) {
    setState(() {
      _allProducts.removeWhere((item) => item.id == id);
    });
  }

  void _loadData() async {
    var url = Uri.parse(
        "http://10.0.2.2/holes/dia_eshop/web/Admin/index.php?action=kosik");
    var res = await http.get(url);

    var json = convert.jsonDecode(res.body) as Map<String, dynamic>;
    var products = Cart.fromJson(json);

    nextPage = "stop";

    /*if (loadedPage > 1) {
      mergeData(results);
    } else {
      _allPlanets = results;
    }*/

    setState(() {
      _allProducts = products.results;
    });
  }

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
          ListView.builder(
            shrinkWrap: true,
            itemCount: _allProducts.length,
            physics: const AlwaysScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return CartItem(title: "xxx");
            },
          ),
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
          Container(
            margin: const EdgeInsets.all(7),
            child: Column(
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
                        style: TextStyle(fontSize: 18, color: Colors.grey[600]),
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
                        style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                      ),
                      Text(
                        "L",
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 5),
              child: IconButton(
                color: Colors.red[700],
                icon: const Icon(Icons.close),
                tooltip: 'Increase volume by 10',
                onPressed: () {},
              ),
            ),
          ),
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
