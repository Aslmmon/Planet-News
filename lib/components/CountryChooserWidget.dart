import 'package:flutter/material.dart';
import 'package:news_app/data/models/user/user.dart';
import 'package:news_app/ui/countryChooser/CountryChooserScreen.dart';

class CountryChooserWidget extends StatelessWidget {
  const CountryChooserWidget({
    super.key,
    required this.user,
    required this.onDisMiss,
  });

  final User user;
  final VoidCallback onDisMiss;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (BuildContext context) => Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: CountryChooserScreen(() {
                    Navigator.pop(context);
                    onDisMiss();
                  }),
                ));
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColorLight,
          border: Border.all(width: 0.3, color: Colors.grey),
          borderRadius: const BorderRadius.all(Radius.circular(15)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              user.country.emoji ?? '',
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(width: 5),
            Text(
              user.country.name ?? '',
              style: TextStyle(
                  fontSize: 12,
                  color: Theme.of(context).hintColor),
            ),
            Icon(
              Icons.keyboard_arrow_down_sharp,
              color: Theme.of(context).hintColor,
            )
          ],
        ),
      ),
    );
  }
}
