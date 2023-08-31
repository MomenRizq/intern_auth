import 'package:flutter/material.dart';

class HeaderAuthWidget extends StatelessWidget {
  const HeaderAuthWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * .35,
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Image.asset("assets/background.png"),
        ),
        Positioned(
            top: 132,
            left: MediaQuery.of(context).size.width * 0.35,
            child: Container(
              width: 115,
              height: 115,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Image.asset(
                "assets/logo.png",
                fit: BoxFit.fill,
                width: 115,
                height: 115,
              ),
            ))
      ],
    );
  }
}