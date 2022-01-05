import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:loadmore/loadmore.dart';
import 'specific_page.dart';
import 'app_bar.dart';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

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
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> _planets = [];
  String nextPage = "";
  int loadedPage = 1;

  List<dynamic> _allPlanets = [];

  void _removeItem(String name) {
    setState(() {
      _planets.removeWhere((item) => item['name'] == name);
    });
  }

  String loadUrl() {
    String url;
    if (_planets.length > 0 && nextPage != "") {
      loadedPage++;

      url = nextPage;
    } else {
      url = "https://swapi.dev/api/planets/";
    }

    return url;
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
    var url = Uri.parse(loadUrl());
    var res = await http.get(url);

    // Sting sa Decoduje do pola
    final Map dataMap = convert.jsonDecode(res.body);

    var results = dataMap['results'];

    if (dataMap['next'] != null) {
      nextPage = dataMap['next'];
    } else {
      nextPage = "stop";
    }

    if (loadedPage > 1) {
      mergeData(results);
    } else {
      _allPlanets = results;
    }

    setState(() {
      _planets = _allPlanets;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: ListView(
        children: [
          Row(
            children: [
              const HeaderCard(title: "Men"),
              const HeaderCard(title: "Woman"),
              const HeaderCard(title: "Childs"),
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
            const DrawerItem(title: "Woman"),
            const DrawerItem(title: "Men"),
            const DrawerItem(title: "Childs"),
            const Divider(
              color: Colors.black,
              height: 25,
            )
          ],
        ),
      ),
    );
  }
}

class HeaderCard extends StatelessWidget {
  final String title;

  const HeaderCard({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            CircleAvatar(
              radius: 45,
              backgroundColor: Colors.deepOrange[200],
              child: ClipOval(
                child: CachedNetworkImage(
                  imageUrl: "https://picsum.photos/250?image=9",
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
            builder: (BuildContext context) => const SecondPage(
              planetDetail: {"name": "Test"},
            ),
          ),
        );
      },
    );
  }
}
