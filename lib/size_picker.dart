import 'package:flutter/material.dart';

class SizeSelector extends StatelessWidget {
  final List<String> sizes;
  final String selectedSize;
  final void Function(String) onSizeSelected;

  const SizeSelector({
    Key? key,
    required this.sizes,
    required this.selectedSize,
    required this.onSizeSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        sizes.length,
        (index) => Padding(
          padding: const EdgeInsets.all(5.0),
          child: Material(
            child: InkWell(
              borderRadius: BorderRadius.circular(3),
              onTap: () => onSizeSelected(sizes[index]),
              child: Ink(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    color: selectedSize == sizes[index]
                        ? Colors.deepOrange[200]
                        : Colors.grey[300],
                    borderRadius: BorderRadius.circular(3)),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    sizes[index],
                    style: TextStyle(
                      color: selectedSize == sizes[index]
                          ? Colors.white
                          : Colors.black87,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
