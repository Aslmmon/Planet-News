import 'package:flutter/material.dart';

class Bookmarkscreen extends StatelessWidget {
  const Bookmarkscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bookmarks',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          //  _buildVerticalArticleList()
          ],
        ),
      ),
    );
  }

  // Widget _buildVerticalArticleList() {
  //   return Expanded(
  //     child: ListView.builder(
  //         scrollDirection: Axis.vertical,
  //         shrinkWrap: true,
  //         itemCount: dummyList.length,
  //         itemBuilder: (context, index) {
  //           return Padding(
  //             padding: const EdgeInsets.symmetric(vertical: 10),
  //             child: Text(
  //               dummyList[index],
  //               style: const TextStyle(color: Colors.black),
  //             ),
  //           );
  //         }),
  //   );
  // }
}
