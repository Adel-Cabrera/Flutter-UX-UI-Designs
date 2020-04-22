import 'package:flutter/material.dart';

class PinterestButton {
  final Function onPressed;
  final IconData icon;

  PinterestButton({@required this.onPressed, @required this.icon});
}

class PinteresMenu extends StatelessWidget {
  final List<PinterestButton> items = [
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
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: _MenuItems(menuItems: items),
        width: 250.0,
        height: 60,
        decoration: BoxDecoration(
            color: Colors.white,
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
      ),
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
    return GestureDetector(
      onTap: menuItem.onPressed,
      child: Container(
        child: Icon(
          menuItem.icon,
        ),
      ),
    );
  }
}
