import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/components/Apploader.dart';
import 'package:news_app/components/CountryFlag.dart';
import 'package:news_app/components/MainLayout.dart';
import 'package:news_app/data/models/country/Country.dart';
import 'package:news_app/data/models/user/user.dart';
import 'package:news_app/network/chopper/ApiService.dart';
import 'package:news_app/providers.dart';

import '../Providers.dart';

class Countrychooserscreen extends ConsumerWidget {
  static String CountryChooserScreenTag = '/CountryChooser';
  final VoidCallback nextScreen;

  const Countrychooserscreen(this.nextScreen, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final countriesData = ref.watch(countriesProvider);
    final user = ref.watch(userProvider);

    return countriesData.when(
        data: (data) => Mainlayout(
            AppBarTitle: 'Select your Country',
            MiddleScene: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return CountryItem(
                    country: data[index],
                    isSelected: ref.watch(IndexProvider) == index,
                    indexItem: index,
                  );
                }),
            onNextClicked: () {
              _updateCountry(user, data, ref);
              _invalidateChoice(ref);
              nextScreen();
            }),
        error: (error, _) => Text(error.toString()),
        loading: () => const Apploader());
  }

  void _invalidateChoice(WidgetRef ref) {
    ref.invalidate(IndexProvider);
  }

  void _updateCountry(User user, List<Country> data, WidgetRef ref) {
    final updatedUser =
        user.copyWith(country: data[ref.read(IndexProvider.notifier).state]);
    ref.read(userProvider.notifier).updateUser(updatedUser);
  }
}
