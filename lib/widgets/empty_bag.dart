import 'package:flutter/material.dart';

import 'subtitle_text.dart';
import 'title_text.dart';

class EmptyBagWidget extends StatelessWidget {
  final String imagePath, title, subtitle, buttonText;

  const EmptyBagWidget({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          const SizedBox(height: 50),
          Image.asset(
            imagePath,
            width: double.infinity,
            height: size.height * 0.35,
          ),
          const SizedBox(height: 20),
          TitleTextWidget(label: "Whops!", fontSize: 48, color: Colors.red),
          const SizedBox(height: 20),
          SubtitleTextWidget(label: title, fontWeight: FontWeight.w600),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SubtitleTextWidget(
              label: subtitle,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: Colors.red,
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
            ),
            onPressed: () {},
            child: Text(buttonText, style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
