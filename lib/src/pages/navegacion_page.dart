import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class NavegacionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _NotificationModel(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: Text(
            'Notifications Page',
          ),
        ),
        floatingActionButton: BotonFlotante(),
        bottomNavigationBar: BottomNavigation(),
      ),
    );
  }
}

class BottomNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int notification = Provider.of<_NotificationModel>(context).notification;

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
                child: BounceInDown(
                  from: 10.0,
                  animate: (notification > 0) ? true : false,
                  child: Bounce(
                    from: 10.0,
                    controller: (controller) =>
                        Provider.of<_NotificationModel>(context)
                            .bounceController = controller,
                    child: Container(
                      alignment: Alignment.center,
                      width: 12.0,
                      height: 12.0,
                      decoration: BoxDecoration(
                        color: Colors.pinkAccent,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        '$notification',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 7.0,
                        ),
                      ),
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

class BotonFlotante extends StatefulWidget {
  @override
  _BotonFlotanteState createState() => _BotonFlotanteState();
}

class _BotonFlotanteState extends State<BotonFlotante> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.pink,
      child: FaIcon(FontAwesomeIcons.play),
      onPressed: () {
        int notification =
            Provider.of<_NotificationModel>(context, listen: false)
                .notification;

        notification += 1;
        Provider.of<_NotificationModel>(context, listen: false).notification =
            notification;

        if (notification >= 2) {
          final controller =
              Provider.of<_NotificationModel>(context, listen: false)
                  .bounceController;
          controller.forward(from: 0.0);
        }
      },
    );
  }
}

class _NotificationModel with ChangeNotifier {
  int _notification = 0;

  AnimationController _bounceController;

  AnimationController get bounceController => _bounceController;

  set bounceController(AnimationController value) {
    _bounceController = value;
  }

  int get notification => _notification;

  set notification(int value) {
    _notification = value;
    notifyListeners();
  }
}
