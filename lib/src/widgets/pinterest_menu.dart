import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestButton {
  final Function onPressed;
  final IconData icon;

  PinterestButton({@required this.onPressed, @required this.icon});
}

class PinterestMenu extends StatelessWidget {
  final bool mostrar;
  final Color backgroundColor;
  final Color activeColor;
  final Color inactiveColor;
  final List<PinterestButton> items;

  PinterestMenu(
      {this.mostrar = true,
      this.backgroundColor = Colors.white,
      this.activeColor = Colors.black,
      this.inactiveColor = Colors.blueGrey,
      @required this.items});

/*  final List<PinterestButton> items = [
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
  ];*/

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _MenuModel(),
      child: AnimatedOpacity(
        duration: Duration(
          milliseconds: 250,
        ),
        opacity: (mostrar) ? 1 : 0,
        child: Builder(builder: (context) {
          Provider.of<_MenuModel>(context).backgroundColor =
              this.backgroundColor;
          Provider.of<_MenuModel>(context).activeColor = this.activeColor;
          Provider.of<_MenuModel>(context).inactiveColor = this.inactiveColor;
          return _PinterestMenuBackground(
            child: _MenuItems(
              menuItems: items,
            ),
          );
        }),
      ),
    );
  }
}

class _PinterestMenuBackground extends StatelessWidget {
  final Widget child;

  _PinterestMenuBackground({@required this.child});

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = Provider.of<_MenuModel>(context).backgroundColor;

    return Container(
      child: child,
      width: 250.0,
      height: 60,
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(
            100,
          ),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black38,
              offset: Offset(0.0, 0.0),
              blurRadius: 10.0,
              spreadRadius: -5,
            ),
          ]),
    );
  }
}

class _MenuItems extends StatelessWidget {
  final List<PinterestButton> menuItems;

  _MenuItems({this.menuItems});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        menuItems.length,
        (index) =>
            _PinterestMenuButton(index: index, menuItem: menuItems[index]),
      ),
    );
  }
}

class _PinterestMenuButton extends StatelessWidget {
  final int index;
  final PinterestButton menuItem;

  _PinterestMenuButton({this.index, this.menuItem});

  @override
  Widget build(BuildContext context) {
    final itemSeleccionado = Provider.of<_MenuModel>(context).itemSeleccionado;
    final menuModel = Provider.of<_MenuModel>(context);

    return GestureDetector(
      onTap: () {
        Provider.of<_MenuModel>(context, listen: false).itemSeleccionado =
            index;
        menuItem.onPressed();
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        child: Icon(
          menuItem.icon,
          size: (itemSeleccionado == index) ? 35.0 : 25.0,
          color: (itemSeleccionado == index)
              ? menuModel.activeColor
              : menuModel.inactiveColor,
        ),
      ),
    );
  }
}

class _MenuModel with ChangeNotifier {
  int _itemSeleccionado = 0;

  int get itemSeleccionado => _itemSeleccionado;

  set itemSeleccionado(int value) {
    _itemSeleccionado = value;
    notifyListeners();
  }

  Color backgroundColor = Colors.white;
  Color activeColor = Colors.black;
  Color inactiveColor = Colors.blueGrey;
}
