import 'package:flutter/material.dart';

class BotonGordo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _BotonGordoBackground();
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
      child: Text(
        'BotonGordo',
      ),
    );
  }
}
