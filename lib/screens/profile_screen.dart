import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';
import '../services/assets_manager.dart';
import '../widgets/app_name_text.dart';
import '../widgets/subtitle_text.dart';
import '../widgets/title_text.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(AssetsManager.shoppingCart),
        ),
        title: AppNameTextWidget(fontSize: 22),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
            visible: false,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: TitleTextWidget(
                label: "Please login to have unlimited access",
              ),
            ),
          ),
          Visibility(
            visible: true,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).cardColor,
                      border: Border.all(
                        color: Theme.of(context).colorScheme.background,
                        width: 3,
                      ),
                      image: DecorationImage(
                        image: NetworkImage(
                          "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleTextWidget(
                        label: "Jimmy Niels Paytan Villavicencio",
                      ),
                      SizedBox(width: 6),
                      SubtitleTextWidget(label: "31999873@policia.gob.pe"),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Divider(thickness: 1,),
                const SizedBox(height: 10),
                TitleTextWidget(label: "General"),
                const SizedBox(height: 10),
                CustomListTitle(
                  text: "All Orders",
                  imagePath: AssetsManager.orderSvg,
                  function: () {},
                ),
                CustomListTitle(
                  text: "Wishlist",
                  imagePath: AssetsManager.wishlistSvg,
                  function: () {},
                ),
                CustomListTitle(
                  text: "Viewed recently",
                  imagePath: AssetsManager.recent,
                  function: () {},
                ),
                CustomListTitle(
                  text: "Address",
                  imagePath: AssetsManager.address,
                  function: () {},
                ),
                const SizedBox(height: 6),
                Divider(thickness: 1),
                const SizedBox(height: 6),
                TitleTextWidget(label: "Settings"),
                const SizedBox(height: 10),
                SwitchListTile(
                  secondary: Image.asset(AssetsManager.theme, height: 34),
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
          Center(
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () {},
              icon: Icon(IconlyLight.logout),
              label: Text('Logout'),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomListTitle extends StatelessWidget {
  const CustomListTitle({
    super.key,
    required this.imagePath,
    required this.text,
    required this.function,
  });

  final String imagePath, text;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        function();
      },
      title: SubtitleTextWidget(label: text),
      leading: Image.asset(imagePath, height: 34),
      trailing: Icon(IconlyLight.arrowRight2),
    );
  }
}
