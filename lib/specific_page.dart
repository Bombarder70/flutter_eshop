import 'package:flutter/material.dart';
import 'app_bar.dart';
import 'detail_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:loadmore/loadmore.dart';
import 'product.dart';

class SecondPage extends StatefulWidget {
  final Result productDetail;

  const SecondPage({Key? key, required this.productDetail}) : super(key: key);
  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  //List<dynamic> _products = [];
  String nextPage = "";
  int loadedPage = 1;

  List<Result> _allProducts = [];

  void _removeItem(int id) {
    setState(() {
      _allProducts.removeWhere((item) => item.id == id);
    });
  }

  /*void mergeData(Result planets) {
    _allProducts.addAll(planets);
  }*/

  Future<bool> _loadMore() async {
    await Future.delayed(const Duration(seconds: 0, milliseconds: 500));
    _loadData();

    return true;
  }

  void _loadData() async {
    var url = Uri.parse(
        "http://10.0.2.2/holes/dia_eshop/web/Admin/index.php?action=vsetky_produkty");
    var res = await http.get(url);

    var json = convert.jsonDecode(res.body) as Map<String, dynamic>;
    var products = Product.fromJson(json);

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

  /*Container(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                FilterItem(title: "Zoradiť", icon: Icons.sort),
                FilterItem(title: "Filtrovať", icon: Icons.filter_alt),
              ],
            ),
          ),*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: LoadMore(
        isFinish: nextPage == "stop",
        onLoadMore: _loadMore,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: _allProducts.length,
          physics: const AlwaysScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Row(
              children: [
                ProductCard(productDetail: _allProducts[index]),
              ],
            );
          },
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
    );
  }
}

class ProductCard extends StatelessWidget {
  final Result productDetail;

  const ProductCard({
    Key? key,
    required this.productDetail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
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
          margin: const EdgeInsets.all(5),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                child: Image.network('https://picsum.photos/250?image=9'),
              ),
              Text(
                productDetail.name,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              Text(
                productDetail.price + " €",
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              Text(
                "-50%",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.green,
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
      ),
    );
  }
}
