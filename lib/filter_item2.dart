import 'package:flutter/material.dart';

class FilterItem2 extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function onCheckboxChanged;
  final bool checkboxValue;
  final String widgetType;
  final Function loadData;

  const FilterItem2({
    Key? key,
    required this.title,
    required this.icon,
    required this.onCheckboxChanged,
    required this.checkboxValue,
    required this.widgetType,
    required this.loadData,
  }) : super(key: key);

  void onChecked(bool? value) {
    onCheckboxChanged(value);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text('Filtrovať'),
              actions: [
                Column(
                  children: [
                    Row(
                      children: [
                        const Expanded(
                          child: Text(
                            "Zobraziť iba akciové produkty",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        Checkbox(
                          checkColor: Colors.white,
                          value: checkboxValue,
                          onChanged: (bool? value) {
                            onChecked(value);
                            Navigator.pop(context, false);
                          },
                        ),
                      ],
                    ),
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
