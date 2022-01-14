import 'package:flutter/material.dart';

class FilterItem2 extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function onRadioChanged;
  final int radioValue;
  final String widgetType;
  final Function loadData;

  const FilterItem2({
    Key? key,
    required this.title,
    required this.icon,
    required this.onRadioChanged,
    required this.radioValue,
    required this.widgetType,
    required this.loadData,
  }) : super(key: key);

  void onChanged(int? value) {
    onRadioChanged(value);
    String orderName;

    if (value == 1 || value == 2) {
      orderName = "price";
    } else if (value == 5) {
      orderName = "id";
    } else {
      orderName = "name";
    }

    loadData(widgetType, orderName, value == 1 || value == 3 ? "asc" : "desc");
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text('Zoradiť'),
              actions: [
                Column(
                  children: [
                    RadioListTile(
                      title: const Text('Cena - najlacnejšie'),
                      value: 1,
                      groupValue: radioValue,
                      onChanged: (int? value) {
                        onChanged(value);
                        Navigator.pop(context, false);
                      },
                    ),
                    RadioListTile(
                      title: const Text('Cena - najdrahšie'),
                      value: 2,
                      groupValue: radioValue,
                      onChanged: (int? value) {
                        onChanged(value);
                        Navigator.pop(context, false);
                      },
                    ),
                    RadioListTile(
                      title: const Text('Názov - vzostupne'),
                      value: 3,
                      groupValue: radioValue,
                      onChanged: (int? value) {
                        onChanged(value);
                        Navigator.pop(context, false);
                      },
                    ),
                    RadioListTile(
                      title: const Text('Názov - zostupne'),
                      value: 4,
                      groupValue: radioValue,
                      onChanged: (int? value) {
                        onChanged(value);
                        Navigator.pop(context, false);
                      },
                    ),
                    RadioListTile(
                      title: const Text('Nezoradovať'),
                      value: 5,
                      groupValue: radioValue,
                      onChanged: (int? value) {
                        onChanged(value);
                        Navigator.pop(context, false);
                      },
                    )
                  ],
                )
              ],
            ),
          );
        },
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
      ),
    );
  }
}
