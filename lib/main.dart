import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:interactopia/core/common/error_text.dart';
import 'package:interactopia/core/common/loader.dart';
import 'package:interactopia/core/router.dart';
import 'package:interactopia/features/auth/controller/auth_controller.dart';
import 'package:interactopia/models/user_model.dart';
import 'package:interactopia/theme/palette.dart';
import 'package:routemaster/routemaster.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  UserModel? userModel;

  void getData(WidgetRef ref, User data) async {
    userModel = await ref
        .watch(authControllerProvider.notifier)
        .getUserData(data.uid)
        .first;
    ref.read(userProvider.notifier).update((state) => userModel);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ref.watch(authStateChangeProvider).when(
        data: (data) => MaterialApp.router(
              debugShowCheckedModeBanner: false,
              title: 'Interactopia',
              theme: Palette.darkModeAppTheme,
              routerDelegate: RoutemasterDelegate(routesBuilder: (context) {
                if (data != null) {
                  getData(ref, data);
                  if(userModel!=null) {
                    return loggedInRoutes;
                  }
                }
                return loggedOutRoutes;
              }),
              routeInformationParser: const RoutemasterParser(),
            ),
        error: (error, stackTrace) => ErrorText(errorText: error.toString()),
        loading: () => const Loader());
  }
}
