import 'package:flutter/material.dart';
import 'app_bar.dart';
import 'detail_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:loadmore/loadmore.dart';

class SecondPage extends StatefulWidget {
  final Map planetDetail;

  const SecondPage({Key? key, required this.planetDetail}) : super(key: key);
  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  List<dynamic> _planets = [];
  String nextPage = "";
  int loadedPage = 1;

  List<dynamic> _allPlanets = [];

  void _removeItem(String name) {
    setState(() {
      _planets.removeWhere((item) => item['name'] == name);
    });
  }

  void mergeData(planets) {
    _allPlanets.addAll(planets);
  }

  Future<bool> _loadMore() async {
    await Future.delayed(const Duration(seconds: 0, milliseconds: 500));
    _loadData();

    return true;
  }

  void _loadData() async {
    var url = Uri.parse(
        "http://10.0.2.2/holes/dia_eshop/web/Admin/index.php?action=vsetky_produkty");
    var res = await http.get(url);

    // Sting sa Decoduje do pola
    final Map dataMap = convert.jsonDecode(res.body);

    var results = dataMap['results'];

    if (dataMap['next'] != null) {
      nextPage = dataMap['next'];
    } else {
      nextPage = "stop";
    }
    nextPage = "stop";
    if (loadedPage > 1) {
      mergeData(results);
    } else {
      _allPlanets = results;
    }
    print(results);
    setState(() {
      _planets = _allPlanets;
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
          itemCount: _planets.length,
          physics: const AlwaysScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Card(
              child: InkWell(
                onTap: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute<SecondPage>(
                      builder: (BuildContext context) => SecondPage(
                        planetDetail: _planets[index],
                      ),
                    ),
                  ),
                },
                child: Row(
                  children: [
                    ProductCard(title: "xxx"),
                    ProductCard(title: "xxx"),
                  ],
                ),
              ),
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
  final String title;

  const ProductCard({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute<DetailPage>(
              builder: (BuildContext context) => const DetailPage(),
            ),
          );
        },
        child: Container(
          margin: EdgeInsets.all(5),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                child: Image.network('https://picsum.photos/250?image=9'),
              ),
              Text(
                "Name of product",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Text(
                "560€",
                style: TextStyle(
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
