import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Stack(
              children: [
                Icon(
                  Icons.notifications_none_outlined,
                  size: 25,
                ),
                Positioned(
                  right: 3,
                  top: 1,
                  child: CircleAvatar(
                    radius: 4,
                    backgroundColor: Colors.red,
                  ),
                )
              ],
            ),
          )
        ],
      ),
      body: Container(),
    );
  }
}
