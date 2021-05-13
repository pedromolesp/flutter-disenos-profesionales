import 'package:disenos/src/routes/routes.dart';
import 'package:disenos/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class LauncherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: _MenuPrincipal(),
        appBar: AppBar(
          title: Text("Diseños en Flutter"),
        ),
        body: _ListaOpciones());
  }
}

class _ListaOpciones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, i) => ListTile(
        leading: FaIcon(
          pageRoutes[i].icon,
          color: appTheme.accentColor,
        ),
        title: Text(pageRoutes[i].titulo),
        trailing: Icon(
          Icons.chevron_right,
          color: appTheme.accentColor,
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => pageRoutes[i].page),
          );
        },
      ),
      separatorBuilder: (context, i) => Divider(
        color: appTheme.primaryColorLight,
      ),
      itemCount: pageRoutes.length,
    );
  }
}

class _MenuPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    Color accentColor = appTheme.currentTheme.accentColor;
    return Drawer(
      child: Container(
          child: Column(
        children: [
          SafeArea(
            child: Container(
              height: 200,
              width: double.infinity,
              child: CircleAvatar(
                backgroundColor: accentColor,
                child: Text(
                  "FH",
                  style: TextStyle(
                    fontSize: 50,
                  ),
                ),
              ),
            ),
          ),
          Expanded(child: _ListaOpciones()),
          SafeArea(
            bottom: true,
            left: false,
            right: false,
            top: false,
            child: ListTile(
              leading: Icon(Icons.lightbulb_outline, color: accentColor),
              title: Text("Dark Mode"),
              trailing: Switch.adaptive(
                activeColor: accentColor,
                value: appTheme.darkTheme,
                onChanged: (value) {
                  appTheme.darkTheme = value;
                },
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.lightbulb_outline, color: accentColor),
            title: Text("Custom Theme"),
            trailing: Switch.adaptive(
              activeColor: accentColor,
              value: appTheme.customTheme,
              onChanged: (value) {
                appTheme.customTheme = value;
              },
            ),
          )
        ],
      )),
    );
  }
}
