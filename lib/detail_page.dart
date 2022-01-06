import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'app_bar.dart';
import 'size_picker.dart';
import 'product.dart';

class DetailPage extends StatefulWidget {
  final Result productDetail;

  const DetailPage({
    Key? key,
    required this.productDetail,
  }) : super(key: key);

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
          Heading(title: widget.productDetail.name),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    widget.productDetail.price,
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
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              onRatingUpdate: (rating) {
                print(rating);
              },
            ),
          ),
          const Heading(title: "Veľkosť produktu"),
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
          const Heading(title: "Farba produktu"),
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
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            color: Colors.deepOrange[200],
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  child: const Heading(title: "Popis produktu"),
                ),
                Text(
                  widget.productDetail.description,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.deepOrange[200],
        onPressed: () {},
        icon: const Icon(Icons.shopping_cart),
        label: const Text('Pridať do košíka'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
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

class Heading extends StatelessWidget {
  final String title;

  const Heading({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.all(10),
      child: Text(
        title,
        style: const TextStyle(fontSize: 26),
      ),
    );
  }
}
