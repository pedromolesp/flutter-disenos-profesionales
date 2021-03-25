import 'package:disenos/src/widgets/pinterest_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class PinterestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _MenuModel(),
      child: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [
            PinterestGrid(),
            _PinterestMenuLocation(),
          ],
        ),
      ),
    );
  }
}

class _PinterestMenuLocation extends StatelessWidget {
  const _PinterestMenuLocation({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final mostrar = Provider.of<_MenuModel>(context).mostrar;
    return Positioned(
      bottom: 30,
      child: PinterestMenu(
        mostrar: mostrar,

        items: [
          PinterestButton(
              icon: Icons.pie_chart,
              onPressed: () {
                print("ole1");
              }),
          PinterestButton(
              icon: Icons.search,
              onPressed: () {
                print("ole2");
              }),
          PinterestButton(
              icon: Icons.notifications,
              onPressed: () {
                print("ole3");
              }),
          PinterestButton(
              icon: Icons.supervised_user_circle,
              onPressed: () {
                print("ole4");
              })
        ],
        // activeColor: Colors.red,
        // inactiveColor: Colors.blue,
      ),
    );
  }
}

class PinterestGrid extends StatefulWidget {
  @override
  _PinterestGridState createState() => _PinterestGridState();
}

class _PinterestGridState extends State<PinterestGrid> {
  final List<int> items = List.generate(200, (i) => i);
  ScrollController controller = new ScrollController();
  double scrollAnterior = 0.0;
  bool ocultar;
  @override
  void initState() {
    ocultar = false;
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
    return StaggeredGridView.countBuilder(
      controller: controller,
      crossAxisCount: 4,
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) => _PinterestItem(index),
      staggeredTileBuilder: (int index) => StaggeredTile.count(
        2,
        index.isEven ? 2 : 1,
      ),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }
}

class _PinterestItem extends StatelessWidget {
  final int index;
  const _PinterestItem(this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.blue,
      ),
      child: Center(
        child: CircleAvatar(
          backgroundColor: Colors.white,
          child: Text('$index'),
        ),
      ),
    );
  }
}

class _MenuModel with ChangeNotifier {
  bool _mostrar = true;
  bool get mostrar => this._mostrar;
  set mostrar(bool valor) {
    this._mostrar = valor;
    notifyListeners();
  }
}
