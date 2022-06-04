import 'package:flutter/material.dart';

class ExploriaGenericDropdown extends StatelessWidget {
  final String selectedItem;
  final List<String> items;
  final Function(String?)? onChanged;
  const ExploriaGenericDropdown({Key? key, required this.selectedItem, required this.items, required this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.black38)
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          value: selectedItem,
          items: items
              .map((String e) =>
              DropdownMenuItem(value: e, child: Text(e)))
              .toList(),
          onChanged: onChanged),
      ),
    );
  }
}
