import 'package:flutter/material.dart';
import 'package:news_app/components/SearchBox.dart';

class Explorescreen extends StatelessWidget {
  const Explorescreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();

    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SearchBox(
              controller: searchController,
              onChanged: (query) {
                print(query);
              }),
          const Expanded(
            child: Center(child: Text('Enter Text to search items here ')),
          )
        ],
      ),
    ));
  }
}
