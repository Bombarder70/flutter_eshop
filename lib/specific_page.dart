import 'package:flutter/material.dart';
import 'app_bar.dart';
import 'detail_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'product.dart';

import 'filter_item2.dart';

class SecondPage extends StatefulWidget {
  final String type;

  const SecondPage({Key? key, required this.type}) : super(key: key);
  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  void initState() {
    super.initState();
    // Nastav na najnovsie
    _loadData(widget.type, "id", "desc", "false");
  }

  //List<dynamic> _products = [];
  String nextPage = "";
  int loadedPage = 1;

  // rdaio buttons
  // zoradenie
  int radioValue = 5;
  void setRadioValue(int value) {
    setState(() {
      radioValue = value;
    });
  }

  bool checkboxValue = false;
  void setCheckboxValue(bool value) {
    setState(() {
      checkboxValue = value;
    });

    _loadData(widget.type, "id", "desc", checkboxValue.toString());
  }

  List<Result> _allProducts = [];

  void _loadData(
      String type, String orderName, String orderBy, String akcia) async {
    var url = Uri(
      scheme: "http",
      host: "10.0.2.2",
      path: "/holes/dia_eshop/web/Admin/index.php",
      queryParameters: {
        "action": "vsetky_produkty",
        "type": type,
        "orderName": orderName,
        "orderBy": orderBy,
        "show_only_discounts": akcia
      },
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
        physics: const ScrollPhysics(),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  FilterItem(
                    title: "Zoradiť",
                    icon: Icons.sort,
                    onRadioChanged: setRadioValue,
                    radioValue: radioValue,
                    loadData: _loadData,
                    widgetType: widget.type,
                  ),
                  FilterItem2(
                    title: "Filtrovať",
                    icon: Icons.filter_alt,
                    onCheckboxChanged: setCheckboxValue,
                    checkboxValue: checkboxValue,
                    loadData: _loadData,
                    widgetType: widget.type,
                  ),
                ],
              ),
            ),
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
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
                    if (int.parse(_allProducts[index].discount) > 0 ||
                        int.parse(_allProducts[index].count) <= 3)
                      Positioned(
                        top: 10,
                        left: 10,
                        child: Container(
                          child: (int.parse(_allProducts[index].count) > 0)
                              ? (int.parse(_allProducts[index].count) < 4)
                                  ? const Text(
                                      "Menej ako 5 kusov",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  : Text(
                                      "-" + _allProducts[index].discount + "%",
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                              : const Text(
                                  "Nedostupný",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: (int.parse(_allProducts[index].count) > 0)
                                ? (int.parse(_allProducts[index].count) < 4)
                                    ? Colors.yellow
                                    : Colors.deepOrange[300]
                                : Colors.red[900],
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
  final Function onRadioChanged;
  final int radioValue;
  final String widgetType;
  final Function loadData;

  const FilterItem({
    Key? key,
    required this.title,
    required this.icon,
    required this.onRadioChanged,
    required this.radioValue,
    required this.widgetType,
    required this.loadData,
  }) : super(key: key);

  void onChanged(int? value) {
    onRadioChanged(value);
    String orderName;

    if (value == 1 || value == 2) {
      orderName = "price";
    } else if (value == 5) {
      orderName = "id";
    } else {
      orderName = "name";
    }

    loadData(
      widgetType,
      orderName,
      value == 1 || value == 3 ? "asc" : "desc",
      "false",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text('Zoradiť'),
              actions: [
                Column(
                  children: [
                    RadioListTile(
                      title: const Text('Cena - najlacnejšie'),
                      value: 1,
                      groupValue: radioValue,
                      onChanged: (int? value) {
                        onChanged(value);
                        Navigator.pop(context, false);
                      },
                    ),
                    RadioListTile(
                      title: const Text('Cena - najdrahšie'),
                      value: 2,
                      groupValue: radioValue,
                      onChanged: (int? value) {
                        onChanged(value);
                        Navigator.pop(context, false);
                      },
                    ),
                    RadioListTile(
                      title: const Text('Názov - vzostupne'),
                      value: 3,
                      groupValue: radioValue,
                      onChanged: (int? value) {
                        onChanged(value);
                        Navigator.pop(context, false);
                      },
                    ),
                    RadioListTile(
                      title: const Text('Názov - zostupne'),
                      value: 4,
                      groupValue: radioValue,
                      onChanged: (int? value) {
                        onChanged(value);
                        Navigator.pop(context, false);
                      },
                    ),
                    RadioListTile(
                      title: const Text('Nezoradovať'),
                      value: 5,
                      groupValue: radioValue,
                      onChanged: (int? value) {
                        onChanged(value);
                        Navigator.pop(context, false);
                      },
                    )
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
                (int.parse(productDetail.discount) > 0)
                    ? productDetail.price + "€"
                    : "",
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
            ),
            Text(
              getPriceDiscount(productDetail.price, productDetail.discount) +
                  "€",
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
