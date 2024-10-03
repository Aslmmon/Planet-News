import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/components/Apploader.dart';
import 'package:news_app/components/CountryFlag.dart';
import 'package:news_app/components/MainLayout.dart';
import 'package:news_app/components/SearchBox.dart';
import 'package:news_app/data/models/country/Country.dart';
import 'package:news_app/data/models/user/user.dart';
import 'package:news_app/network/chopper/ApiService.dart';
import 'package:news_app/providers.dart';
import 'package:news_app/ui/countryChooser/SearchController.dart';

import '../Providers.dart';

class CountryChooserScreen extends ConsumerStatefulWidget {
  static String CountryChooserScreenTag = '/CountryChooser';
  final VoidCallback nextScreen;

  const CountryChooserScreen(this.nextScreen, {super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CountryChooserScreen();
}

class _CountryChooserScreen extends ConsumerState<CountryChooserScreen> {
  late TextEditingController _searchController;

  @override
  void initState() {
    _searchController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final countriesData = ref.watch(countriesProvider);
    final FilterdList = ref.watch(searchControllerProvider);

    final user = ref.watch(userProvider);

    return countriesData.when(
        data: (data) => Mainlayout(
            AppBarTitle: 'Select your Country',
            MiddleScene: Column(
              children: [
                SearchBox(
                    controller: _searchController,
                    onChanged: (searchText) {
                      ref
                          .read(searchControllerProvider.notifier)
                          .onSearchUser(searchText, data);
                    }),
                Expanded(
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: FilterdList.isEmpty
                          ? data.length
                          : FilterdList.length,
                      itemBuilder: (context, index) {
                        return CountryItem(
                          country: FilterdList.isEmpty
                              ? data[index]
                              : FilterdList[index],
                          isSelected: ref.watch(IndexProvider) == index,
                          indexItem: index,
                        );
                      }),
                ),
              ],
            ),
            onNextClicked: () {
              _updateCountry(user, data, ref);
              _invalidateChoice(ref);
              widget.nextScreen();
            }),
        error: (error, _) => Text(error.toString()),
        loading: () => const Apploader());
  }

  void _invalidateChoice(WidgetRef ref) {
    ref.invalidate(IndexProvider);
    ref.invalidate(searchControllerProvider);
  }

  void _updateCountry(User user, List<Country> data, WidgetRef ref) {
    final updatedUser =
        user.copyWith(country: data[ref.read(IndexProvider.notifier).state]);
    ref.read(userProvider.notifier).updateUser(updatedUser);
  }
}
