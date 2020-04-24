import 'package:flutter/material.dart';
import 'package:flutterexuxuii/src/pages/slideshow_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutterexuxuii/src/challenges/cuadrado_animado.dart';
import 'package:flutterexuxuii/src/pages/emergency_page.dart';
import 'package:flutterexuxuii/src/pages/graficas_circulares_page.dart';
import 'package:flutterexuxuii/src/pages/headers_page.dart';
import 'package:flutterexuxuii/src/pages/pinterest_page.dart';
import 'package:flutterexuxuii/src/pages/sliver_page.dart';

final pageRoute = <_Route>[
  _Route(
    icon: FontAwesomeIcons.slideshare,
    titulo: 'Slideshow',
    page: SlideshowPage(),
  ),
  _Route(
    icon: FontAwesomeIcons.ambulance,
    titulo: 'Emergencia',
    page: EmergencyPage(),
  ),
  _Route(
    icon: FontAwesomeIcons.heading,
    titulo: 'Encabezados',
    page: HeadersPage(),
  ),
  _Route(
    icon: FontAwesomeIcons.peopleCarry,
    titulo: 'Cuadro Animado',
    page: CuadradoAnimadoPage(),
  ),
  _Route(
    icon: FontAwesomeIcons.circleNotch,
    titulo: 'Barra Progreso',
    page: GraficasCircularesPage(),
  ),
  _Route(
    icon: FontAwesomeIcons.pinterest,
    titulo: 'Pinterest',
    page: PinterestPage(),
  ),
  _Route(
    icon: FontAwesomeIcons.mobile,
    titulo: 'Slivers',
    page: SliverListPage(),
  ),
];

class _Route {
  final IconData icon;
  final String titulo;

  final Widget page;

  _Route({this.icon, this.titulo, this.page});
}
