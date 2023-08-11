import 'package:flutter/material.dart';
import 'package:user_locations/data/network/api_service.dart';
import 'package:user_locations/providers/address_call_provider.dart';
import 'package:user_locations/providers/location_provider.dart';
import 'package:user_locations/providers/tab_box_provider.dart';
import 'package:user_locations/providers/user_locations_provider.dart';
import 'package:user_locations/ui/spalsh/splash_screen.dart';

import 'package:provider/provider.dart';

Future<void> main() async {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => UserLocationsProvider()),
      ChangeNotifierProvider(create: (context) => TabBoxProvider()),
      ChangeNotifierProvider(create: (context) => LocationProvider()),
      ChangeNotifierProvider(create: (context) => AddressCallProvider(apiService: ApiService())),
    ],
    child: const MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
