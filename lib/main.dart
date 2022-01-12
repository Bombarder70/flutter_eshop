import 'package:eshop_app/product.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
                HeaderCard(title: "Muži", img: "men", type: "1"),
                HeaderCard(title: "Ženy", img: "women", type: "2"),
                HeaderCard(title: "Deti", img: "child", type: "3"),
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
            Row(
              children: [
                AllCategoriesCard(),
                AllCategoriesCard(),
                AllCategoriesCard(),
              ],
            ),
            Row(
              children: [
                AllCategoriesCard(),
                AllCategoriesCard(),
                AllCategoriesCard(),
              ],
            ),
            Row(
              children: [
                AllCategoriesCard(),
                AllCategoriesCard(),
                AllCategoriesCard(),
              ],
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
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.deepOrange[200],
                ),
                child: const Text('Drawer Header'),
              ),
              const DrawerItem(title: "Všetko", size: 22, type: "3"),
              const Divider(
                thickness: 2,
              ),
              const DrawerItem(title: "Muži", size: 18, type: "1"),
              const DrawerItem(title: "Ženy", size: 18, type: "2"),
              const DrawerItem(title: "Deti", size: 18, type: "3"),
              const Divider(
                thickness: 2,
              ),
              const DrawerItem(title: "Tenisky", size: 16, type: "3"),
              const DrawerItem(title: "Tričká", size: 16, type: "3"),
              const DrawerItem(title: "Legíny", size: 16, type: "3"),
              const DrawerItem(title: "Rifle", size: 16, type: "3"),
              const DrawerItem(title: "Tepláky", size: 16, type: "3"),
              const DrawerItem(title: "Šaty", size: 16, type: "3"),
            ],
          ),
        ),
      ),
    );
  }
}

class HeaderCard extends StatelessWidget {
  final String title;
  final String img;
  final String type;

  const HeaderCard(
      {Key? key, required this.title, required this.img, required this.type})
      : super(key: key);

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
                radius: 45,
                backgroundColor: Colors.deepOrange[200],
                child: ClipOval(
                  child: Image.asset(
                    'assets/files/' + img + '.png',
                    fit: BoxFit.cover,
                    width: 80,
                    height: 80,
                  ),
                ),
              ),
              Text(
                title,
                style: const TextStyle(fontSize: 17),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AllCategoriesCard extends StatelessWidget {
  const AllCategoriesCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: new BorderRadius.only(
            topLeft: const Radius.circular(40.0),
            topRight: const Radius.circular(40.0),
          ),
        ),
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.all(5),
        child: Image.network('https://picsum.photos/250?image=9'),
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
