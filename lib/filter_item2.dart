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

  /*void onChanged(int? value) {
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
  }*/

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
                          },
                        ),
                      ],
                    ),
                    /*const Text("Podľa farby"),
                    RadioListTile(
                      title: const Text('Zelená'),
                      value: 1,
                      groupValue: radioValue,
                      onChanged: (int? value) {
                        onChanged(value);
                        Navigator.pop(context, false);
                      },
                    ),
                    RadioListTile(
                      title: const Text('Červená'),
                      value: 2,
                      groupValue: radioValue,
                      onChanged: (int? value) {
                        onChanged(value);
                        Navigator.pop(context, false);
                      },
                    ),
                    RadioListTile(
                      title: const Text('Fiaľová'),
                      value: 3,
                      groupValue: radioValue,
                      onChanged: (int? value) {
                        onChanged(value);
                        Navigator.pop(context, false);
                      },
                    ),
                    RadioListTile(
                      title: const Text('Hnedá'),
                      value: 4,
                      groupValue: radioValue,
                      onChanged: (int? value) {
                        onChanged(value);
                        Navigator.pop(context, false);
                      },
                    ),
                    RadioListTile(
                      title: const Text('Žltá'),
                      value: 5,
                      groupValue: radioValue,
                      onChanged: (int? value) {
                        onChanged(value);
                        Navigator.pop(context, false);
                      },
                    ),
                    RadioListTile(
                      title: const Text('Modrá'),
                      value: 5,
                      groupValue: radioValue,
                      onChanged: (int? value) {
                        onChanged(value);
                        Navigator.pop(context, false);
                      },
                    )*/
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
