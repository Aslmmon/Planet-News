import 'package:flutter/material.dart';
import 'package:news_app/data/models/user/user.dart';

class CountryChooserWidget extends StatelessWidget {
  const CountryChooserWidget({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        border: Border.all(width: 0.4, color: Colors.grey),
        borderRadius: const BorderRadius.all(Radius.circular(25)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            user.country.emoji ?? '',
            style: const TextStyle(fontSize: 18),
          ),
          const SizedBox(width: 5),
          Text(
            user.country.name ?? '',
            style: const TextStyle(fontSize: 16, color: Colors.black),
          ),
          const Icon(Icons.keyboard_arrow_down_sharp)
        ],
      ),
    );
  }
}
