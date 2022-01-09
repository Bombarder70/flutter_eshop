import 'package:flutter/material.dart';
import 'app_bar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'product.dart';
import 'detail_page.dart';
import 'get_cart_id.dart';

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
  int cenaSpolu = 0;

  void _removeItem(String id) {
    setState(() => _allProducts.removeWhere((item) => item.id == id));
  }

  Future<http.Response> _placeOrder() async {
    final res = await http.post(
      Uri.parse(
          'http://10.0.2.2/holes/dia_eshop/web/Admin/index.php?action=objednat'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    print(res.body);
    return res;
  }

  void _loadData() async {
    getCartId();

    var url = Uri(
      scheme: "http",
      host: "10.0.2.2",
      path: "/holes/dia_eshop/web/Admin/index.php",
      queryParameters: {"action": "kosik", "cart_id": "1"},
    );

    var res = await http.get(url);

    var json = convert.jsonDecode(res.body) as Map<String, dynamic>;
    var products = Product.fromJson(json);

    nextPage = "stop";

    setState(() {
      _allProducts = products.results;
      //cenaSpolu = products.cenaSpolu;
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
              margin: const EdgeInsets.all(10),
              child: Row(
                children: [
                  const Expanded(
                    child: Text(
                      "Košík",
                      style: TextStyle(fontSize: 26),
                    ),
                  ),
                  Text(
                    _allProducts.length.toString() + " položky ",
                    style: const TextStyle(fontSize: 20),
                  ),
                  const Text(
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
              return CartItem(
                removeItem: _removeItem,
                productDetail: _allProducts[index],
              );
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.all(5),
              width: double.infinity,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Color(0xa8329d)),
                ),
                onPressed: () => _placeOrder(),
                child: const Text('Objednať'),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  final Result productDetail;
  final ValueChanged<String> removeItem;

  const CartItem({
    Key? key,
    required this.productDetail,
    required this.removeItem,
  }) : super(key: key);

  Future<http.Response> _removeFromCart(String idProduct) async {
    final res = await http.post(
      Uri.parse(
          'http://10.0.2.2/holes/dia_eshop/web/Admin/index.php?action=odstranit_z_kosika'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: convert.jsonEncode(<String, String>{
        'id_product': idProduct,
      }),
    );

    if (res.body == "1") {
      removeItem(idProduct);
    }

    return res;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute<DetailPage>(
          builder: (BuildContext context) =>
              DetailPage(productDetail: productDetail),
        ),
      ),
      child: Container(
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
                        productDetail.name,
                        style: const TextStyle(
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 7),
                    child: Row(
                      children: [
                        Text(
                          "Cena: ",
                          style:
                              TextStyle(fontSize: 18, color: Colors.grey[600]),
                        ),
                        Text(
                          productDetail.price + " €",
                          style: const TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 7),
                    child: Row(
                      children: [
                        Text(
                          "Velkost: ",
                          style:
                              TextStyle(fontSize: 18, color: Colors.grey[600]),
                        ),
                        Text(
                          "L",
                          style: const TextStyle(fontSize: 18),
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
                  onPressed: () => _removeFromCart(productDetail.id),
                  color: Colors.red[700],
                  icon: const Icon(Icons.close),
                  tooltip: 'Delete item from cart',
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
      ),
    );
  }
}
