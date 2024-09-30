import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/components/AppButton.dart';
import 'package:news_app/components/SettingsItem.dart';

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
          const SettingItem(
            startIcon: Icon(Icons.language),
            title: 'Language',
            endWidget: Icon(Icons.chevron_right),
          )
        ],
      ),
    );
  }
}
