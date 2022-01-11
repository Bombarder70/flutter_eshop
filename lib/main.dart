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
                HeaderCard(title: "Muži", img: "men"),
                HeaderCard(title: "Ženy", img: "women"),
                HeaderCard(title: "Deti", img: "child"),
              ],
            ),
            Container(
              color: Colors.red,
              height: 175,
              margin: EdgeInsets.only(bottom: 10),
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
              const DrawerItem(title: "Ženy"),
              const DrawerItem(title: "Muži"),
              const DrawerItem(title: "Deti"),
              const Divider(
                color: Colors.black,
                height: 25,
              )
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

  const HeaderCard({Key? key, required this.title, required this.img})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute<SecondPage>(
            builder: (BuildContext context) => const SecondPage(),
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
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.all(5),
        color: Colors.deepOrange[200],
        child: Image.network('https://picsum.photos/250?image=9'),
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  final String title;

  const DrawerItem({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(fontSize: 18),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute<SecondPage>(
            builder: (BuildContext context) => const SecondPage(),
          ),
        );
      },
    );
  }
}
