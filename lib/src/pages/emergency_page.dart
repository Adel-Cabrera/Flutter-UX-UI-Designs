import 'package:flutter/material.dart';
import 'package:flutterexuxuii/src/widgets/boton_gordo.dart';
import 'package:flutterexuxuii/src/widgets/emergency_header.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EmergencyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:
            //PageHeader()
            BotonGordo(),
      ),
    );
  }
}

class PageHeader extends StatelessWidget {
  const PageHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconHeader(
      icon: FontAwesomeIcons.plus,
      subtitulo: 'Haz Solicitado',
      titulo: 'Asistencia Médica',
      color1: Color(0xFF526BF6),
      color2: Color(0xFF67ACF2),
    );
  }
}
