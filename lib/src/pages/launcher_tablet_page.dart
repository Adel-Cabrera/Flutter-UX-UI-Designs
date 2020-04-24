import 'package:flutter/material.dart';
import 'package:flutterexuxuii/src/models/layout_model.dart';
import 'package:flutterexuxuii/src/pages/slideshow_page.dart';
import 'package:flutterexuxuii/src/theme/themechanger.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutterexuxuii/src/routes/routes.dart';
import 'package:provider/provider.dart';

class LauncherTabletPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    final layoutModel = Provider.of<LayoutModel>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appTheme.currentTheme.accentColor,
        title: Text(
          'Diseños Tablet en Flutter',
        ),
      ),
      drawer: _MenuPrincipal(),
      body: //_ListaOpciones(),
          Row(
        children: <Widget>[
          Container(
            width: 300.0,
            height: double.infinity,
            child: _ListaOpciones(),
          ),
          Container(
            width: 1.0,
            height: double.infinity,
            color: appTheme.darkTheme
                ? Colors.grey
                : appTheme.currentTheme.accentColor,
          ),
          Expanded(
            child: layoutModel.currentPage,
          ),
        ],
      ),
    );
  }
}

class _ListaOpciones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      separatorBuilder: (context, index) => Divider(
        color: appTheme.primaryColorLight,
      ),
      itemCount: pageRoute.length,
      itemBuilder: (context, index) => ListTile(
        leading: FaIcon(
          pageRoute[index].icon,
          color: appTheme.accentColor,
        ),
        title: Text(
          pageRoute[index].titulo,
        ),
        trailing: Icon(
          Icons.chevron_right,
          color: appTheme.accentColor,
        ),
        onTap: () {
//          Navigator.of(context).push(
//            MaterialPageRoute(
//              builder: (context) => pageRoute[index].page,
//            ),
          //);
          final layoutModel = Provider.of<LayoutModel>(context, listen: false);
          layoutModel.currentPage = pageRoute[index].page;
        },
      ),
    );
  }
}

class _MenuPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);

    return Drawer(
      child: Container(
        child: Column(
          children: <Widget>[
            SafeArea(
              child: Container(
                padding: EdgeInsets.all(
                  20.0,
                ),
                width: double.infinity,
                height: 200.0,
                child: CircleAvatar(
                  backgroundColor: appTheme.currentTheme.accentColor,
                  child: Text(
                    'AC',
                    style: TextStyle(
                      fontSize: 50.0,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: _ListaOpciones(),
            ),
            ListTile(
              leading: Icon(
                Icons.lightbulb_outline,
                color: appTheme.currentTheme.accentColor,
              ),
              title: Text(
                'Dark Mode',
              ),
              trailing: Switch.adaptive(
                value: appTheme.darkTheme,
                activeColor: appTheme.currentTheme.accentColor,
                onChanged: (value) {
                  appTheme.darkTheme = value;
                },
              ),
            ),
            SafeArea(
              bottom: true,
              top: false,
              left: false,
              right: false,
              child: ListTile(
                leading: Icon(
                  Icons.add_to_home_screen,
                  color: appTheme.currentTheme.accentColor,
                ),
                title: Text(
                  'Custom Theme',
                ),
                trailing: Switch.adaptive(
                  value: appTheme.customTheme,
                  activeColor: appTheme.currentTheme.accentColor,
                  onChanged: (value) {
                    appTheme.customTheme = value;
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
