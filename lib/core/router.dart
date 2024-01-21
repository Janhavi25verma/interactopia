import 'package:flutter/material.dart';
import 'package:interactopia/features/auth/screens/login_screen.dart';
import 'package:routemaster/routemaster.dart';

import '../features/home/screen/home_screen.dart';

final loggedOutRoutes=RouteMap(routes: {'/':(_)=>const MaterialPage(child: LoginScreen())});
final loggedInRoutes=RouteMap(routes: {'/':(_)=>const MaterialPage(child: HomeScreen())});