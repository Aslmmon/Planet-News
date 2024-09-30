import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/components/Apploader.dart';
import 'package:news_app/components/CustomError.dart';
import 'package:news_app/ui/Providers.dart';
import 'package:news_app/ui/mainHome/home/components/BuildHorizontalList.dart';

class Homescreen extends ConsumerWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final topicsPrv = ref.watch(topicsProvider);
    return SafeArea(
      child: topicsPrv.when(
          data: (data) => Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Latest',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(fontWeight: FontWeight.bold)),
                    Expanded(
                      child: BuildHorizontalList(data),
                    ),
                  ],
                ),
              ),
          error: (error, _) => CustomError(errorDetails: error.toString()),
          loading: () => const Apploader()),
    );
  }


}
