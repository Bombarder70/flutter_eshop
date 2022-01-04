import 'package:flutter/material.dart';
import 'app_bar.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => DetailPageState();
}

class DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: ListView(
        children: [
          Container(
            height: 400,
            child: Image.network('https://picsum.photos/250?image=9'),
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              "Name of product",
              style: TextStyle(fontSize: 26),
            ),
          ),
          Container(
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "xxx",
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                Expanded(
                  child: Text(
                    "xxx",
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                Expanded(
                  child: Text(
                    "xxx",
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ],
            ),
          )
        ],
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
