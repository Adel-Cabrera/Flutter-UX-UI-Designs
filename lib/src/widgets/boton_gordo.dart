import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BotonGordo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        _BotonGordoBackground(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 140.0,
              width: 40.0,
            ),
            FaIcon(
              FontAwesomeIcons.carCrash,
              color: Colors.white,
              size: 40.0,
            ),
            SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: Text(
                'Motor Accident',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ),
            ),
            FaIcon(
              FontAwesomeIcons.chevronRight,
              color: Colors.white,
            ),
            SizedBox(
              width: 40.0,
            ),
          ],
        ),
      ],
    );
  }
}

class _BotonGordoBackground extends StatelessWidget {
  const _BotonGordoBackground({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100.0,
      margin: EdgeInsets.all(
        20.0,
      ),
      decoration: BoxDecoration(
        //color: Colors.red,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: Offset(4.0, 6.0),
            blurRadius: 10,
          ),
        ],
        borderRadius: BorderRadius.circular(
          15.0,
        ),
        gradient: LinearGradient(
          colors: <Color>[
            Color(0xFF6989F5),
            Color(0xFF906EF5),
          ],
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          15.0,
        ),
        child: Stack(
          children: <Widget>[
            Positioned(
              top: -20,
              right: -20,
              child: FaIcon(
                FontAwesomeIcons.carCrash,
                size: 150.0,
                color: Colors.white.withOpacity(0.2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
