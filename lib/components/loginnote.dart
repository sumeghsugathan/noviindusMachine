
import 'package:flutter/material.dart';

class LoginNote extends StatelessWidget {
  const LoginNote({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20.0),
      child: Text(
        "Login Or Register To Book Your Appointments",
        style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 24,
            fontWeight: FontWeight.w600),
      ),
    );
  }
}
