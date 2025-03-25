import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';
import '../widgets/subtitle_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SubtitleTextWidget(label: 'Hola mundo!!!'),
            ElevatedButton(onPressed: null, child: Text('Click me!')),
            SwitchListTile(
              title: Text(
                themeProvider.getIsDarkTheme ? 'Dark Mode' : 'Light Mode',
              ),
              value: themeProvider.getIsDarkTheme,
              onChanged: (value) {
                themeProvider.setDarkTheme(value);
                log("Theme state: ${themeProvider.getIsDarkTheme}");
              },
            ),
          ],
        ),
      ),
    );
  }
}
