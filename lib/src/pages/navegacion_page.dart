import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavegacionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text(
          'Notifications Page',
        ),
      ),
      floatingActionButton: BotonFlotante(),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}

class BottomNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
      selectedItemColor: Colors.pink,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          title: Text('Bones'),
          icon: FaIcon(
            FontAwesomeIcons.bone,
          ),
        ),
        BottomNavigationBarItem(
          title: Text('Notifications'),
          icon: Stack(
            children: <Widget>[
              FaIcon(
                FontAwesomeIcons.bell,
              ),
              Positioned(
                right: 0.0,
                top: 0.0,
                /*child: Icon(
                  Icons.brightness_1,
                  size: 8.0,
                  color: Colors.pinkAccent,
                ),*/
                child: Container(
                  alignment: Alignment.center,
                  width: 12.0,
                  height: 12.0,
                  decoration: BoxDecoration(
                    color: Colors.pinkAccent,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    '1',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 7.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
          //
        ),
        BottomNavigationBarItem(
          title: Text('MyDog'),
          icon: FaIcon(
            FontAwesomeIcons.dog,
          ),
        ),
      ],
    );
  }
}

class BotonFlotante extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.pink,
      child: FaIcon(FontAwesomeIcons.play),
      onPressed: () {},
    );
  }
}
