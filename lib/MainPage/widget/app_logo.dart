import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
     return Padding(
       padding: const EdgeInsets.fromLTRB(12,0,12,12),
       child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.black,
        ),
        height: 100,
        width: 100,
        child: Image.asset('lib/assets/images/logo-no-background.png'),
         ),
     );
  }
}