import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:interactopia/features/auth/controller/auth_controller.dart';
import 'package:interactopia/features/home/community_list_drawer.dart';


class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  void displayDrawer(BuildContext context){
    Scaffold.of(context).openDrawer();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider)!;
    return Scaffold(
      appBar: AppBar(
          title: const Text("Home"),

          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                iconSize: 33,
                icon: const Icon(Icons.menu),
                onPressed: () => displayDrawer(context),
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(left: 18),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search),
                iconSize: 27,
              ),
            ),
          ]),
      drawer: const CommunityListDrawer(),
    );

  }
}
