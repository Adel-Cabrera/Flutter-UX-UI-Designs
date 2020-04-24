import 'package:flutter/material.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutterexuxuii/src/widgets/pinterest_menu.dart';
import 'package:provider/provider.dart';

class PinterestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _MenuModel(),
      child: Scaffold(
        body: //_PinterestGrid(),
            // PinteresMenu(),
            Stack(
          children: <Widget>[
            _PinterestGrid(),
            _PinterestMenuLocation(),
          ],
        ),
      ),
    );
  }
}

class _PinterestMenuLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double widthPantalla = MediaQuery.of(context).size.width;
    final mostrar = Provider.of<_MenuModel>(context).mostrar;

    if (widthPantalla > 500.0) {
      widthPantalla -= 300.0;
    }

    return Positioned(
      bottom: 30.0,
      child: Container(
        width: widthPantalla,
        child: Row(
          children: <Widget>[
            Spacer(),
            PinterestMenu(
              mostrar: mostrar,
              items: <PinterestButton>[
                PinterestButton(
                    icon: Icons.pie_chart,
                    onPressed: () {
                      print('pie chart');
                    }),
                PinterestButton(
                    icon: Icons.search,
                    onPressed: () {
                      print('search');
                    }),
                PinterestButton(
                    icon: Icons.notifications,
                    onPressed: () {
                      print('notifications');
                    }),
                PinterestButton(
                    icon: Icons.supervised_user_circle,
                    onPressed: () {
                      print('supervised_user_circle');
                    }),
              ],
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}

class _PinterestGrid extends StatefulWidget {
  @override
  __PinterestGridState createState() => __PinterestGridState();
}

class __PinterestGridState extends State<_PinterestGrid> {
  final List<int> items = List.generate(201, (index) => index);
  ScrollController controller = new ScrollController();
  double scrollAnterior = 0;

  @override
  void initState() {
    controller.addListener(() {
      if (controller.offset > scrollAnterior && controller.offset > 100) {
        Provider.of<_MenuModel>(context, listen: false).mostrar = false;
      } else {
        Provider.of<_MenuModel>(context, listen: false).mostrar = true;
      }

      scrollAnterior = controller.offset;
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int count;

    if (MediaQuery.of(context).size.width > 500.0) {
      count = 3;
    } else {
      count = 2;
    }

    return new StaggeredGridView.countBuilder(
      controller: controller,
      crossAxisCount: count,
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) => _PinterestItem(
        index: index,
      ),
      staggeredTileBuilder: (int index) =>
          new StaggeredTile.count(1, index.isEven ? 1 : 2),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }
}

class _PinterestItem extends StatelessWidget {
  final int index;

  _PinterestItem({this.index});

  @override
  Widget build(BuildContext context) {
    return new Container(
        margin: EdgeInsets.all(
          5.0,
        ),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(
            30.0,
          ),
        ),
        child: new Center(
          child: new CircleAvatar(
            backgroundColor: Colors.white,
            child: new Text('$index'),
          ),
        ));
  }
}

class _MenuModel with ChangeNotifier {
  bool _mostrar = true;

  bool get mostrar => this._mostrar;

  set mostrar(bool value) {
    this._mostrar = value;
    notifyListeners();
  }
}
