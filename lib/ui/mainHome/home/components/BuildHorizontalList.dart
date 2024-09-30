import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/data/models/topics/Topics.dart';

class BuildHorizontalList extends StatelessWidget {
  const BuildHorizontalList(
    this.data, {
    super.key,
  });

  final List<Topics> data;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Text(
              data[index].name ?? '',
              style: const TextStyle(color: Colors.black),
            ),
          );
        });
  }
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
