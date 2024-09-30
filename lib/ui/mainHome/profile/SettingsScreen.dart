import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/components/AppButton.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _switchValue = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SettingItem(
            startIcon: const Icon(Icons.dark_mode),
            title: 'Dark Mode',
            endWidget: CupertinoSwitch(
              activeColor: AppBlueColor,
              value: _switchValue,
              onChanged: (value) {
                setState(() {
                  _switchValue = value;
                });
              },
            ),
          ),
          SettingItem(
            startIcon: const Icon(Icons.language),
            title: 'Language',
            endWidget: const Icon(Icons.chevron_right),
          )
        ],
      ),
    );
  }
}

class SettingItem extends StatelessWidget {
  SettingItem(
      {super.key,
      required this.startIcon,
      required this.title,
      required this.endWidget});

  Icon startIcon;
  String title;
  Widget endWidget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            startIcon,
            const SizedBox(width: 10),
            Text(
              title,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            Expanded(
              child: Container(
                alignment: Alignment.topRight,
                child: endWidget,
              ),
            ),
          ]),
    );
  }
}
