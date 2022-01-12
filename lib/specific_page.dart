import 'package:flutter/material.dart';
import 'app_bar.dart';
import 'detail_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:loadmore/loadmore.dart';
import 'product.dart';

class SecondPage extends StatefulWidget {
  final String type;

  const SecondPage({Key? key, required this.type}) : super(key: key);
  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  void initState() {
    super.initState();
    _loadData(widget.type);
  }

  //List<dynamic> _products = [];
  String nextPage = "";
  int loadedPage = 1;

  List<Result> _allProducts = [];

  /*Future<bool> _loadMore() async {
    await Future.delayed(const Duration(seconds: 0, milliseconds: 500));
    _loadData();

    return true;
  }*/

  void _loadData(String type) async {
    var url = Uri(
      scheme: "http",
      host: "10.0.2.2",
      path: "/holes/dia_eshop/web/Admin/index.php",
      queryParameters: {"action": "vsetky_produkty", "type": type},
    );

    var res = await http.get(url);

    var json = convert.jsonDecode(res.body) as Map<String, dynamic>;
    var products = Product.fromJson(json);

    nextPage = "stop";

    setState(() {
      _allProducts = products.results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  FilterItem(title: "Zoradiť", icon: Icons.sort),
                  FilterItem(title: "Filtrovať", icon: Icons.filter_alt),
                ],
              ),
            ),
            GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 250,
                childAspectRatio: 3 / 4.25,
                crossAxisSpacing: 0,
                mainAxisSpacing: 0,
              ),
              itemCount: _allProducts.length,
              itemBuilder: (context, index) {
                return Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    ProductCard(productDetail: _allProducts[index]),
                    Positioned(
                      top: 10,
                      left: 10,
                      child: Container(
                        child: const Text(
                          '-50%',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.deepOrange[300],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class FilterItem extends StatelessWidget {
  final String title;
  final IconData icon;

  const FilterItem({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text('Produkt pridaný do košíka'),
              actions: [
                Column(
                  children: [
                    ListTile(
                      title: const Text('Vzostupbne'),
                    ),
                  ],
                )
              ],
            ),
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.grey,
              size: 30.0,
            ),
            const VerticalDivider(
              color: Colors.black,
              thickness: 2,
            ),
            Container(
              margin: const EdgeInsets.only(left: 5),
              child: Text(
                title,
                style: const TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Result productDetail;

  const ProductCard({
    Key? key,
    required this.productDetail,
  }) : super(key: key);

  String getPriceDiscount(String price, String discount) {
    double discountDouble = num.tryParse(discount)!.toDouble();
    double priceDouble = num.tryParse(price)!.toDouble();

    return ((priceDouble / 100) * (100 - discountDouble)).toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute<DetailPage>(
            builder: (BuildContext context) =>
                DetailPage(productDetail: productDetail),
          ),
        );
      },
      child: Container(
        width: 250,
        margin: const EdgeInsets.all(7),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              child: Image.network(
                  'http://10.0.2.2/holes/dia_eshop/files/products/' +
                      productDetail.image,
                  height: 150,
                  fit: BoxFit.fill),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 5),
              child: Text(
                productDetail.name,
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.deepOrange[300],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(5),
              child: Text(
                productDetail.price + "€",
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
            ),
            Text(
              getPriceDiscount(productDetail.price, "50") + "€",
              style: const TextStyle(
                fontSize: 20,
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
