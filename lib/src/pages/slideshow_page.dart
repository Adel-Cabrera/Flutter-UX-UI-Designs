import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutterexuxuii/src/theme/themechanger.dart';
import 'package:flutterexuxuii/src/widgets/slideshow.dart';
import 'package:provider/provider.dart';

class SlideshowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isLarge;

    if (MediaQuery.of(context).size.height > 500.0) {
      isLarge = true;
    } else {
      isLarge = false;
    }

    final List<Widget> children = [
      Expanded(
        child: MiSlideShow(),
      ),
      Expanded(
        child: MiSlideShow(),
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.purple,
      body: isLarge
          ? Column(
              children: children,
            )
          : Row(
              children: children,
            ),
    );
  }
}

class MiSlideShow extends StatelessWidget {
  const MiSlideShow({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);

    return Slideshow(
      puntosArriba: true,
      colorPrimario: appTheme.darkTheme
          ? appTheme.currentTheme.accentColor
          : Color(0xFFFF5A7E),
      colorSecundario: Colors.white,
      bulletPrimario: 20.0,
      bulletSecundario: 12.0,
      slides: <Widget>[
        SvgPicture.asset(
          'assets/svgs/slide-1.svg',
        ),
        SvgPicture.asset(
          'assets/svgs/slide-2.svg',
        ),
        SvgPicture.asset(
          'assets/svgs/slide-3.svg',
        ),
        SvgPicture.asset(
          'assets/svgs/slide-4.svg',
        ),
        SvgPicture.asset(
          'assets/svgs/slide-5.svg',
        ),
      ],
    );
  }
}
