import 'package:flutter/material.dart';

import 'package:ecommerce_admin_app/widgets/title_text.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: TitleTextWidget(label: "Search Screen")),
    );
  }
}
