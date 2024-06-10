import 'package:flutter/material.dart';

class TermsText extends StatelessWidget {
  const TermsText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: RichText(
        textAlign: TextAlign.center,
        text: const TextSpan(
          text:
              "By creating or logging into an account you are agreeing with our ",
          style: TextStyle(
            color: Colors.black,
            decoration: TextDecoration.none,
            fontSize: 12,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w300,
          ),
          children: [
            TextSpan(
              text: "Terms and Conditions",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(0, 40, 252, 1),
                decoration: TextDecoration.none,
              ),
            ),
            TextSpan(
              text: " and ",
            ),
            TextSpan(
              text: "Privacy Policy",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(0, 40, 252, 1),
                decoration: TextDecoration.none,
              ),
            ),
            TextSpan(
              text: ".",
            ),
          ],
        ),
      ),
    );
  }
}
