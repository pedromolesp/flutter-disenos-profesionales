import 'package:disenos/src/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, i) => ListTile(
        leading: FaIcon(
          pageRoutes[i].icon,
          color: Colors.blue,
        ),
        title: Text(pageRoutes[i].titulo),
        trailing: Icon(
          Icons.chevron_right,
          color: Colors.blue,
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => pageRoutes[i].page),
          );
        },
      ),
      separatorBuilder: (context, i) => Divider(
        color: Colors.blue,
      ),
      itemCount: pageRoutes.length,
    );
  }
}

class _MenuPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
          child: Column(
        children: [
          SafeArea(
            child: Container(
              height: 200,
              width: double.infinity,
              child: CircleAvatar(
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
          ListTile(
            leading: Icon(Icons.lightbulb_outline, color: Colors.blue),
            title: Text("Dark Mode"),
            trailing: Switch.adaptive(
              activeColor: Colors.blue,
              value: true,
              onChanged: (value) {},
            ),
          ),
          ListTile(
            leading: Icon(Icons.lightbulb_outline, color: Colors.blue),
            title: Text("Custom Theme"),
            trailing: Switch.adaptive(
              activeColor: Colors.blue,
              value: true,
              onChanged: (value) {},
            ),
          )
        ],
      )),
    );
  }
}