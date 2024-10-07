import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/components/AppButton.dart';
import 'package:news_app/components/SettingsItem.dart';
import 'package:news_app/providers.dart';
import 'package:news_app/ui/theme/theme.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  late bool _switchValue;

  @override
  void initState() {
    super.initState();
    _switchValue = ref.read(sharedPrefProvider).getBool('isDarkTheme') == true;
  }

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
                  debugPrint(_switchValue.toString());
                  ref.read(themeProvider.notifier).toggleTheme(_switchValue);
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
