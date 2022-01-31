import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'product.dart';
import 'get_cart_id.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => CustomBottomNavigationBarState();
}

class CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  void initState() {
    super.initState();
    getCartId(_loadData);
  }

  //List<dynamic> _products = [];
  String nextPage = "";
  int loadedPage = 1;

  List<Result> _allProducts = [];
  double cenaSpolu = 0;

  void _removeItem(String id) {
    setState(() => _allProducts.removeWhere((item) => item.id == id));
  }

  void _placeOrder() {
    getCartIdPlaceOrder(_placeOrderHttp);
    setState(() {
      _allProducts = [];
    });
  }

  void _placeOrderHttp(String idCart) async {
    var res = await http.post(
      Uri.parse(
          'http://10.0.2.2/holes/dia_eshop/web/Admin/index.php?action=objednat'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: convert.jsonEncode(
        <String, String>{'id_cart': idCart},
      ),
    );

    print(res.body);
  }

  void _loadData(String cartId) async {
    var url = Uri(
      scheme: "http",
      host: "10.0.2.2",
      path: "/holes/dia_eshop/web/Admin/index.php",
      queryParameters: {"action": "kosik", "cart_id": cartId},
    );

    var res = await http.get(url);
    var json = convert.jsonDecode(res.body) as Map<String, dynamic>;

    var products;

    if (json['results'] != null) {
      products = Product.fromJson(json);
    }

    String xxx;

    setState(() {
      xxx = "xxx";
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      unselectedItemColor: Colors.black,
      selectedItemColor: Colors.teal,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.view_module_rounded),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.child_care),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: '',
        ),
      ],
      currentIndex: 0,
    );
  }
}
