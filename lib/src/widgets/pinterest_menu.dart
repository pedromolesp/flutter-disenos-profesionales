import 'package:flutter/material.dart';

class PinterestButton {
  final Function onPressed;
  final IconData icon;
  PinterestButton({
    @required this.onPressed,
    @required this.icon,
  });
}

class PinterestMenu extends StatelessWidget {
  final List items = [
    PinterestButton(
        icon: Icons.pie_chart,
        onPressed: () {
          print("ole");
        }),
    PinterestButton(
        icon: Icons.search,
        onPressed: () {
          print("ole");
        }),
    PinterestButton(
        icon: Icons.notifications,
        onPressed: () {
          print("ole");
        }),
    PinterestButton(
        icon: Icons.supervised_user_circle,
        onPressed: () {
          print("ole");
        }),
  ];
  // PinterestMenu(this.items);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: _MenuItems(items),
        width: 250,
        height: 60,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(100),
            boxShadow: <BoxShadow>[
              BoxShadow(color: Colors.black38, blurRadius: 10, spreadRadius: -5)
            ]),
      ),
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
    return Container(
      child: Icon(item.icon),
    );
  }
}
