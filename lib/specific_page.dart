import 'package:flutter/material.dart';
import 'app_bar.dart';

class SecondPage extends StatefulWidget {
  final Map planetDetail;

  const SecondPage({Key? key, required this.planetDetail}) : super(key: key);
  @override
  State<StatefulWidget> createState() => SecondPageState();
}

class SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: ListView(),
    );
  }
}
