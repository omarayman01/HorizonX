import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:horizonx/app_theme.dart';
import 'package:horizonx/screens/settings_screen.dart';
import 'package:horizonx/screens/splash_screen.dart';
import 'package:horizonx/settings_provider.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ChangeNotifierProvider(
      create: (_) => SettingsProvider(), child: const HorizonX()));
}

class HorizonX extends StatelessWidget {
  const HorizonX({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      // home: const SettingsScreen(),

      themeMode: settingsProvider.themeMode,
      darkTheme: AppTheme.darkTheme,
      theme: AppTheme.lightTheme,
    );
  }
}
