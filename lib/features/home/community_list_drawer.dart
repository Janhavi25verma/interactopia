import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:interactopia/features/auth/controller/auth_controller.dart';
import 'package:interactopia/theme/palette.dart';
import 'package:routemaster/routemaster.dart';

class CommunityListDrawer extends ConsumerWidget {
  const CommunityListDrawer({super.key});

  void navigateTOCreateCommunity(BuildContext context) {
    Routemaster.of(context).push('/create_community');
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider)!;
    return Drawer(
        backgroundColor: Palette.blackColor,
        child: SafeArea(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                accountName: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Text(
                    user.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                accountEmail: Text(user.email),
                currentAccountPictureSize: const Size.fromRadius(33),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(user.profilePic),
                ),
                decoration: const BoxDecoration(
                  color: Palette.darkGreenColor,
                ),
              ),
              ListTile(
                leading: const Icon(Icons.add),
                title: const Text("Create a community"),
                onTap: () => navigateTOCreateCommunity(context),
              ),
            ],
          ),
        ));
  }
}
