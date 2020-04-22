import 'package:flutter/material.dart';
import 'package:flutterexuxuii/src/challenges/cuadrado_animado.dart';
import 'package:flutterexuxuii/src/pages/animaciones_page.dart';
import 'package:flutterexuxuii/src/labs/circular_progress_page.dart';
import 'package:flutterexuxuii/src/pages/graficas_circulares_page.dart';
import 'package:flutterexuxuii/src/pages/headers_page.dart';
import 'package:flutterexuxuii/src/pages/slideshow_page.dart';
//import 'package:flutterexuxuii/src/labs/slideshow_page.dart';

void main() => runApp(
      MyApp(),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/second': (context) => HeadersPage(),
      },
      title: 'Diseños App',
      home: //HeadersPage(),
          // AnimacionesPage(),
          // CuadradoAnimadoPage(),
          // CircularProgressPage(),
          // GraficasCircularesPage(),
          SlideshowPage(),
    );
  }
}
