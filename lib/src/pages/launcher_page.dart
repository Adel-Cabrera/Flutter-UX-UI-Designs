import 'package:flutter/material.dart';
import 'package:flutterexuxuii/src/theme/themechanger.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutterexuxuii/src/routes/routes.dart';
import 'package:provider/provider.dart';

class LauncherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Diseños en Flutter',
        ),
      ),
      drawer: _MenuPrincipal(),
      body: _ListaOpciones(),
    );
  }
}

class _ListaOpciones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      separatorBuilder: (context, index) => Divider(
        color: Colors.blue,
      ),
      itemCount: pageRoute.length,
      itemBuilder: (context, index) => ListTile(
        leading: FaIcon(
          pageRoute[index].icon,
          color: Colors.blue,
        ),
        title: Text(
          pageRoute[index].titulo,
        ),
        trailing: Icon(
          Icons.chevron_right,
          color: Colors.blue,
        ),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => pageRoute[index].page,
            ),
          );
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
                  backgroundColor: Colors.blue,
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
                color: Colors.blue,
              ),
              title: Text(
                'Dark Mode',
              ),
              trailing: Switch.adaptive(
                value: appTheme.darkTheme,
                activeColor: Colors.blue,
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
                  color: Colors.blue,
                ),
                title: Text(
                  'Custom Theme',
                ),
                trailing: Switch.adaptive(
                  value: appTheme.customTheme,
                  activeColor: Colors.blue,
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
