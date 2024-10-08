import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onChanged;

  const SearchBox({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColorLight,
        border: Border.all(
          color: Theme.of(context).hintColor,
          width: 0.5,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        decoration:  InputDecoration(
          border: InputBorder.none,
          labelText: 'Search',
          labelStyle: TextStyle(fontSize: 14,color: Theme.of(context).hintColor),
          suffixIcon: const Icon(Icons.search),
        ),
      ),
    );
  }
}
