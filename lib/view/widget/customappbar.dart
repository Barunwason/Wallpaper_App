import 'package:flutter/material.dart';

class appbar extends StatelessWidget {
  const appbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(children: [
          TextSpan(
              text: "Wallpaper ",
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Bradley Hand',
                  fontSize: 25,
                  fontWeight: FontWeight.bold)),
          TextSpan(
              text: "App",
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Bradley Hand',
                  fontSize: 25))
        ]),
      ),
    );
  }
}
