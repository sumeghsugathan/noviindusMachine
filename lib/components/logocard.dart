
import 'package:flutter/material.dart';

class LogoCard extends StatelessWidget {
  const LogoCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 217,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Image.asset(
            "assets/images/Logo1.png",
            height: 84,
          ),
        ),
      ),
    );
  }
}
