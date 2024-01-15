import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  const Buttons({
    super.key,
    required this.btnChild,
    required this.press,
    required this.width,
  });

  final Widget btnChild;
  final VoidCallback press;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Color(0xff800000)),
        ),
        onPressed: press,
        child: Container(
          width: width,
          height: 50,
          child: Center(child: btnChild),
        ),
      ),
    );
  }
}
