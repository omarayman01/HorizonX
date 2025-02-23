import 'package:flutter/material.dart';
import 'package:horizonx/app_theme.dart';
import 'package:horizonx/settings_provider.dart';
import 'package:horizonx/widgets/lang_button.dart';
import 'package:horizonx/widgets/settings_option.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import 'login_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});
  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  // bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    SettingsProvider settings = Provider.of<SettingsProvider>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height / 11),
            // Profile Section
            Row(
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage("${imageAsset}preson.jpg"),
                ),
                SizedBox(width: MediaQuery.of(context).size.width / 20),
                Text(
                  'Badr',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade900,
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 11),

            const SettingOption(
              icon: Icons.language,
              title: 'Language',
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  LanguageButton(label: 'EN', selected: true),
                  SizedBox(width: 10),
                  LanguageButton(label: 'AR', selected: false),
                ],
              ),
            ),

            const Divider(thickness: 1, color: Colors.blue),

            // Dark Mode Option
            SettingOption(
              icon: Icons.nightlight_round,
              title: 'Dark Mode',
              trailing: Switch(
                  activeTrackColor: AppTheme.primaryBlueColor,
                  inactiveTrackColor: AppTheme.backgroundDarkMode,
                  value: settings.themeMode == ThemeMode.dark,
                  onChanged: (value) {
                    if (value) {
                      settings.changeTheme(ThemeMode.dark);
                    } else {
                      settings.changeTheme(ThemeMode.light);
                    }
                  }),
            ),

            const Divider(thickness: 1, color: Colors.blue),

            SettingOption(
              icon: Icons.accessibility_new,
              title: 'Accessibility',
              trailing:
                  const Icon(Icons.arrow_forward_ios, color: Colors.orange),
              onTap: () {},
            ),

            const Divider(thickness: 1, color: Colors.blue),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade700,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'Logout',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
