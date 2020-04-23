import 'package:flutter/material.dart';

class IconHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300.0,
      decoration: BoxDecoration(
        //color: Colors.red,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(
            80,
          ),
        ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[
            Color(0xFF5266F6),
            Color(0xFF67ACF2),
          ],
        ),
      ),
    );
  }
}
