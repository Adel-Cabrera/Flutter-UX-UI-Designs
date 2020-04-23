import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Color colorBlanco = Colors.white.withOpacity(0.7);

    return Stack(
      children: <Widget>[
        _IconHeaderBackground(),
        Positioned(
          top: -50.0,
          left: -70.0,
          child: FaIcon(
            FontAwesomeIcons.plus,
            size: 250.0,
            color: colorBlanco,
          ),
        ),
        Column(
          children: <Widget>[
            SizedBox(
              height: 80,
              width: double.infinity,
            ),
            Text(
              'Haz solicitado',
              style: TextStyle(fontSize: 20.0, color: colorBlanco),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Asistencia Médica',
              style: TextStyle(
                fontSize: 25.0,
                color: colorBlanco,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            FaIcon(
              FontAwesomeIcons.plus,
              size: 80.0,
              color: Colors.white,
            ),
          ],
        ),
      ],
    );
  }
}

class _IconHeaderBackground extends StatelessWidget {
  const _IconHeaderBackground({
    Key key,
  }) : super(key: key);

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
