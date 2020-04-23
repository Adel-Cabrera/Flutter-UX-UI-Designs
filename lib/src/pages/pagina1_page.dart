import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:animate_do/animate_do.dart';

class Pagina1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FadeIn(
          duration: Duration(
            milliseconds: 500,
          ),
          child: Text(
            'Animate_do',
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: FaIcon(
              FontAwesomeIcons.twitter,
            ),
            onPressed: () {},
          ),
          SlideInLeft(
            from: 100.0,
            child: IconButton(
              icon: Icon(
                Icons.navigate_next,
              ),
              onPressed: () {
                Navigator.of(context).push(
                  CupertinoPageRoute(
                    builder: (context) => Pagina1Page(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: ElasticInRight(
        child: FloatingActionButton(
          onPressed: () {},
          child: FaIcon(
            FontAwesomeIcons.play,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElasticIn(
              delay: Duration(
                milliseconds: 1100,
              ),
              child: Icon(
                Icons.new_releases,
                color: Colors.blue,
                size: 40.0,
              ),
            ),
            FadeInDown(
              delay: Duration(
                milliseconds: 200,
              ),
              child: Text(
                'Titulo',
                style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.w200,
                ),
              ),
            ),
            FadeInDown(
              delay: Duration(
                milliseconds: 800,
              ),
              child: Text(
                'Titulo',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            FadeInLeft(
              delay: Duration(
                milliseconds: 1100,
              ),
              child: Container(
                width: 220.0,
                height: 2.0,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
