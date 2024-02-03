import 'package:flutter/material.dart';

import 'landing_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: FilledButton(
            child: Text('Landing'),
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => LandingScreen(),
            )),
          ),
        ),
      ),
    );
  }
}
