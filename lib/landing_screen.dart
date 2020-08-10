import 'package:flutter/material.dart';
import 'package:meditation_app/custom_appbar.dart';
import 'package:meditation_app/custom_body.dart';

import 'navbar.dart';

class LandingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          CustomBody(),
          CustomAppbar(),
          NavBar(),
        ],
      ),
    );
  }
}
