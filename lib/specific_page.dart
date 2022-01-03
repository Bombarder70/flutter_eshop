import 'package:flutter/material.dart';

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
      appBar: AppBar(
        title: Text(
          "Planet: " + widget.planetDetail['name'],
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.orange,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            alignment: Alignment(-.2, 0),
            image: NetworkImage(
                'https://w0.peakpx.com/wallpaper/527/433/HD-wallpaper-space-draw-black-planet-stars.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        alignment: Alignment.bottomCenter,
        padding: const EdgeInsets.only(bottom: 20),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(30),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(
                  color: Colors.orange,
                  width: 3.0,
                ),
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  widget.planetDetail['name'],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.orange,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(30),
              padding: const EdgeInsets.all(10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(
                  color: Colors.orange,
                  width: 3.0,
                ),
              ),
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  children: [],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
