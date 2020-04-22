import 'package:flutter/material.dart';
import 'package:flutterexuxuii/src/models/slider_model.dart';
import 'package:provider/provider.dart';

class Slideshow extends StatelessWidget {
  final List<Widget> slides;
  final bool puntosArriba;
  final Color colorPrimario;
  final Color colorSecundario;

  Slideshow(
      {@required this.slides,
      this.puntosArriba = false,
      this.colorPrimario = Colors.blue,
      this.colorSecundario = Colors.grey});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _SlideshowModel(),
      child: SafeArea(
        child: Center(
          child: Container(
            child: Builder(
              builder: (context) {
                Provider.of<_SlideshowModel>(context).colorPrimario =
                    this.colorPrimario;
                Provider.of<_SlideshowModel>(context).colorSecundario =
                    this.colorSecundario;

                return _CrearEstructuraSlideshow(
                    puntosArriba: puntosArriba, slides: slides);
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _CrearEstructuraSlideshow extends StatelessWidget {
  const _CrearEstructuraSlideshow({
    Key key,
    @required this.puntosArriba,
    @required this.slides,
  }) : super(key: key);

  final bool puntosArriba;
  final List<Widget> slides;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        if (this.puntosArriba)
          _Dots(
            totalSlides: this.slides.length,
          ),
        Expanded(
          child: _Slides(
            slides: this.slides,
          ),
        ),
        if (!this.puntosArriba)
          _Dots(
            totalSlides: this.slides.length,
          ),
      ],
    );
  }
}

class _Dots extends StatelessWidget {
  final int totalSlides;

  _Dots({this.totalSlides});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          this.totalSlides,
          (i) => _Dot(
            index: i,
          ),
        ),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;
  _Dot({this.index});

  @override
  Widget build(BuildContext context) {
    final slideshowModel = Provider.of<_SlideshowModel>(context);

    return AnimatedContainer(
      duration: Duration(
        milliseconds: 200,
      ),
      margin: EdgeInsets.symmetric(
        horizontal: 5.0,
      ),
      width: 12.0,
      height: 12.0,
      decoration: BoxDecoration(
        color: (slideshowModel.currentPage >= index - 0.5 &&
                slideshowModel.currentPage < index + 0.5)
            ? slideshowModel.colorPrimario
            : slideshowModel.colorSecundario,
        shape: BoxShape.circle,
      ),
    );
  }
}

class _Slides extends StatefulWidget {
  final List<Widget> slides;

  _Slides({this.slides});

  @override
  __SlidesState createState() => __SlidesState();
}

class __SlidesState extends State<_Slides> {
  final pageViewController = new PageController(
    viewportFraction: 0.7,
  );

  @override
  void initState() {
    pageViewController.addListener(() {
      Provider.of<_SlideshowModel>(context, listen: false).currentPage =
          pageViewController.page;
    });
    super.initState();
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
/*
        pageSnapping: false,
        physics: ScrollPhysics(),
*/
        controller: pageViewController,
        children: widget.slides.map((child) => _Slide(slide: child)).toList(),
      ),
    );

    /*
          <Widget>[
          _Slide(
            svg: 'assets/svgs/slide-1.svg',
          ),
          _Slide(
            svg: 'assets/svgs/slide-2.svg',
          ),
          _Slide(
            svg: 'assets/svgs/slide-3.svg',
          ),
        ],
          */
  }
}

class _Slide extends StatelessWidget {
  final Widget slide;
  _Slide({this.slide});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(30.0),
      child: slide,
    );
  }
}

class _SlideshowModel with ChangeNotifier {
  double _currentPage = 0;
  Color _colorPrimario = Colors.blue;

  Color get colorPrimario => _colorPrimario;

  set colorPrimario(Color value) {
    _colorPrimario = value;
    notifyListeners();
  }

  Color _colorSecundario = Colors.grey;

  double get currentPage => this._currentPage;

  set currentPage(double value) {
    this._currentPage = value;
    notifyListeners();
  }

  Color get colorSecundario => _colorSecundario;

  set colorSecundario(Color value) {
    _colorSecundario = value;
    notifyListeners();
  }
}
