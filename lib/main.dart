import 'package:flutter/material.dart';
import 'package:flutterexuxuii/src/challenges/cuadrado_animado.dart';
import 'package:flutterexuxuii/src/models/layout_model.dart';
import 'package:flutterexuxuii/src/pages/animaciones_page.dart';
import 'package:flutterexuxuii/src/labs/circular_progress_page.dart';
import 'package:flutterexuxuii/src/pages/emergency_page.dart';
import 'package:flutterexuxuii/src/pages/graficas_circulares_page.dart';
import 'package:flutterexuxuii/src/pages/headers_page.dart';
import 'package:flutterexuxuii/src/pages/launcher_page.dart';
import 'package:flutterexuxuii/src/pages/launcher_tablet_page.dart';
import 'package:flutterexuxuii/src/pages/navegacion_page.dart';
import 'package:flutterexuxuii/src/pages/pagina1_page.dart';
import 'package:flutterexuxuii/src/pages/pinterest_page.dart';
import 'package:flutterexuxuii/src/pages/slideshow_page.dart';
import 'package:flutterexuxuii/src/pages/sliver_page.dart';
import 'package:flutterexuxuii/src/pages/twitter_page.dart';
import 'package:flutterexuxuii/src/theme/themechanger.dart';
import 'package:provider/provider.dart';
//import 'package:flutterexuxuii/src/labs/slideshow_page.dart';

//void main() => runApp(
//      MultiProvider(
//        providers: [
//          Provider(
//            create: (_) => ThemeChanger(
//              2,
//            ),
//          ),
//          Provider(
//            create: (_) => LayoutModel(),
//          ),
//        ],
//        child: MyApp(),
//      ),
//    );

void main() => runApp(
      ChangeNotifierProvider(
        create: (_) => LayoutModel(),
        child: ChangeNotifierProvider(
          create: (_) => ThemeChanger(
            2,
          ),
          child: MyApp(),
        ),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeChanger>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/second': (context) => HeadersPage(),
      },
      theme: currentTheme.currentTheme,
      title: 'Diseños App',
      home: //HeadersPage(),
          // AnimacionesPage(),
          // CuadradoAnimadoPage(),
          // CircularProgressPage(),
          // GraficasCircularesPage(),
          // SlideshowPage(),
          // PinterestPage(),
          // EmergencyPage(),
          // SliverListPage(),
          //LauncherPage(),
          OrientationBuilder(
        builder: (context, orientation) {
          print(orientation);

          final screenSize = MediaQuery.of(context).size;

          if (screenSize.width > 500) {
            return LauncherTabletPage();
          } else {
            return LauncherPage();
          }
        },
      ),
      // Pagina1Page(),
      // TwitterPage(),
      // NavegacionPage(),
    );
  }
}
