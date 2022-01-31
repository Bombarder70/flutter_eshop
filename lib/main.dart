import 'package:eshop_app/product.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/painting.dart';
import 'specific_page.dart';
import 'app_bar.dart';
import 'get_cart_id.dart';
import 'custom_bottom_navigation_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.black,
      ),
      home: Scaffold(
        appBar: CustomAppBar(),
        body: Column(
          children: [
            Row(
              children: [
                HeaderCard(title: "Men", img: "men2", type: "1"),
                HeaderCard(title: "Womans", img: "women2", type: "2"),
                HeaderCard(title: "Children", img: "child2", type: "3"),
              ],
            ),
            RowItem(title: "Categories", img: "men", type: "1"),
            SizedBox(
              height: 95.0,
              child: Container(
                alignment: Alignment.topCenter,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: [
                    CategoryCard(title: "Men", img: "men", type: "1"),
                    CategoryCard(title: "Men", img: "men", type: "1"),
                    CategoryCard(title: "Men", img: "men", type: "1"),
                    CategoryCard(title: "Men", img: "men", type: "1"),
                    CategoryCard(title: "Men", img: "men", type: "1"),
                  ],
                ),
              ),
            ),
            RowItem(title: "Best selling", img: "men", type: "1"),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (ctx, int) {
                  return Card(
                    child: ListTile(
                      title: Text('Motivation $int'),
                      subtitle: Text('this is a description of the motivation'),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        bottomNavigationBar: const CustomBottomNavigationBar(),
      ),
    );
  }
}

class HeaderCard extends StatelessWidget {
  final String title;
  final String img;
  final String type;

  const HeaderCard({
    Key? key,
    required this.title,
    required this.img,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute<SecondPage>(
            builder: (BuildContext context) => SecondPage(type: type),
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              CircleAvatar(
                radius: 39,
                backgroundColor: Colors.tealAccent[700],
                child: ClipOval(
                  child: Image.asset(
                    'assets/files/' + img + '.png',
                    fit: BoxFit.cover,
                    width: 70,
                    height: 70,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(5),
                child: Text(
                  title,
                  style: const TextStyle(
                      fontSize: 17, fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String title;
  final String img;
  final String type;

  const CategoryCard({
    Key? key,
    required this.title,
    required this.img,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute<SecondPage>(
            builder: (BuildContext context) => SecondPage(type: type),
          ),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                alignment: Alignment.center,
                height: 75,
                width: 75,
                margin: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(11.0),
                                image: DecorationImage(
                                  colorFilter: ColorFilter.mode(
                                      Colors.teal.withOpacity(0.5),
                                      BlendMode.dstATop),
                                  image: const NetworkImage(
                                    "http://10.0.2.2/holes/dia_eshop/files/products/shoes_1.png",
                                  ),
                                  //fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned.fill(
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  "Shoes",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RowItem extends StatelessWidget {
  final String title;
  final String img;
  final String type;

  const RowItem({
    Key? key,
    required this.title,
    required this.img,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Expanded(
          child: Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.all(10),
            child: Text(
              "All",
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
