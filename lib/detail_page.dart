import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'app_bar.dart';
import 'size_picker.dart';

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
              mainAxisAlignment: MainAxisAlignment.center,
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
          ),
          Container(
            margin: const EdgeInsets.all(10),
            alignment: Alignment.center,
            child: RatingBar(
              initialRating: 3,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              ratingWidget: RatingWidget(
                full: Icon(
                  Icons.star_rate,
                  color: Colors.deepOrange[200],
                ),
                half: Icon(
                  Icons.star_half,
                  color: Colors.deepOrange[200],
                ),
                empty: Icon(
                  Icons.star_border_sharp,
                  color: Colors.deepOrange[200],
                ),
              ),
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              onRatingUpdate: (rating) {
                print(rating);
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: SizeSelector(
              sizes: ["M", "S"],
              selectedSize: "M",
              onSizeSelected: (item) {
                print(item);
              },
            ),
          ),
          Container(
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.only(left: 50),
              child: MaterialColorPicker(
                onColorChange: (Color color) {
                  // Handle color changes
                },
                selectedColor: Colors.red,
                colors: [
                  Colors.red,
                  Colors.deepOrange,
                  Colors.yellow,
                  Colors.lightGreen
                ],
              ))
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
