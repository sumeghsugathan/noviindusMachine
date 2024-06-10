import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final void Function()? onTap;
  final Widget child;
  final Color color;
  final double width;
  final double height;

  const MyButton({
    super.key,
    required this.onTap,
    required this.child,
    this.color = const Color.fromRGBO(0, 104, 55, 1),
    this.width = 200,
    this.height = 50,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
      
        child: Center(child: child),
      ),
    );
  }
}
