import 'package:eshop_app/product.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/painting.dart';
import 'specific_page.dart';
import 'app_bar.dart';
import 'get_cart_id.dart';

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
        body: ListView(
          children: [
            Row(
              children: [
                HeaderCard(title: "Men", img: "men", type: "1"),
                HeaderCard(title: "Womans", img: "women", type: "2"),
                HeaderCard(title: "Children", img: "child", type: "3"),
              ],
            ),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    "Categories",
                    style: TextStyle(
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
            ),
            Container(
              height: 200,
              margin: EdgeInsets.only(left: 2, right: 2, top: 20, bottom: 20),
              child: FittedBox(
                child: Image.network(
                    'https://image.freepik.com/psd-gratuitas/modelo-de-banner-com-design-de-compras-online_23-2148550895.jpg'),
                fit: BoxFit.fill,
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
            Container(
              height: 200,
              margin: EdgeInsets.only(left: 2, right: 2, top: 20, bottom: 20),
              child: FittedBox(
                child: Image.network(
                    'https://image.freepik.com/free-psd/online-shopping-banner-design_23-2148552605.jpg'),
                fit: BoxFit.fill,
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
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
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
        ),
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

class AllCategoriesCard extends StatelessWidget {
  final String image;

  const AllCategoriesCard({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 85,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40.0),
            topRight: Radius.circular(40.0),
          ),
          color: Colors.grey[350],
        ),
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.all(5),
        child: Image.network(image),
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  final String title;
  final double size;
  final String type;

  const DrawerItem({
    Key? key,
    required this.title,
    required this.size,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(fontSize: size),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute<SecondPage>(
            builder: (BuildContext context) => SecondPage(type: type),
          ),
        );
      },
    );
  }
}
