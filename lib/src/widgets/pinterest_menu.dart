import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestButton {
  final Function onPressed;
  final IconData icon;
  PinterestButton({
    @required this.onPressed,
    @required this.icon,
  });
}

class PinterestMenu extends StatelessWidget {
  final bool mostrar;
  final Color backgroundColor;
  final Color activeColor;
  final Color inactiveColor;
  final List<PinterestButton> items;
  PinterestMenu({
    this.mostrar = true,
    this.activeColor = Colors.black,
    this.backgroundColor = Colors.white,
    this.inactiveColor = Colors.blueGrey,
    @required this.items,
  });
  // final List items = [
  //   PinterestButton(
  //       icon: Icons.pie_chart,
  //       onPressed: () {
  //         print("ole1");
  //       }),
  //   PinterestButton(
  //       icon: Icons.search,
  //       onPressed: () {
  //         print("ole2");
  //       }),
  //   PinterestButton(
  //       icon: Icons.notifications,
  //       onPressed: () {
  //         print("ole3");
  //       }),
  //   PinterestButton(
  //       icon: Icons.supervised_user_circle,
  //       onPressed: () {
  //         print("ole4");
  //       })
  // ];
  // PinterestMenu(this.items);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _MenuModel(),
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 500),
        opacity: (mostrar) ? 1 : 0,
        child: Builder(
          builder: (BuildContext context) {
            Color backgroundColor = Provider.of<_MenuModel>(context)
                .backgroundColor = this.backgroundColor;
            Color activeColor =
                Provider.of<_MenuModel>(context).activeColor = this.activeColor;
            Color inactiveColor = Provider.of<_MenuModel>(context)
                .inactiveColor = this.inactiveColor;

            return _PinterestMenuBackground(
              child: _MenuItems(items),
            );
          },
        ),
      ),
    );
  }
}

class _PinterestMenuBackground extends StatelessWidget {
  _PinterestMenuBackground({
    @required this.child,
  });
  Widget child;
  @override
  Widget build(BuildContext context) {
    Color backgroundColor = Provider.of<_MenuModel>(context).backgroundColor;
    return Container(
      width: 250,
      height: 60,
      child: child,
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(100),
          boxShadow: <BoxShadow>[
            BoxShadow(color: Colors.black38, blurRadius: 10, spreadRadius: -5)
          ]),
    );
  }
}

class _MenuItems extends StatelessWidget {
  final List items;
  _MenuItems(this.items);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
          items.length, (index) => _PinterestMenuButton(index, items[index])),
    );
  }
}

class _PinterestMenuButton extends StatelessWidget {
  final int index;
  final PinterestButton item;
  _PinterestMenuButton(this.index, this.item);
  @override
  Widget build(BuildContext context) {
    final menuModel = Provider.of<_MenuModel>(context);

    return GestureDetector(
      onTap: () {
        Provider.of<_MenuModel>(context, listen: false).indexSelected = index;
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        child: Icon(
          item.icon,
          size: menuModel.indexSelected == index ? 35 : 25,
          color: menuModel.indexSelected == index
              ? menuModel.activeColor
              : menuModel.inactiveColor,
        ),
      ),
    );
  }
}

class _MenuModel with ChangeNotifier {
  int _indexSelected = 0;
  Color backgroundColor = Colors.white;
  Color activeColor = Colors.black;
  Color inactiveColor = Colors.blueGrey;
  int get indexSelected => this._indexSelected;
  set indexSelected(int index) {
    this._indexSelected = index;
    notifyListeners();
  }
}
