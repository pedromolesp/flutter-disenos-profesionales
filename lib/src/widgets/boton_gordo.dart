import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BotonGordo extends StatelessWidget {
  final IconData icon;
  @required
  final String texto;
  final Color color1;
  final Color color2;
  @required
  final Function onPress;

  BotonGordo(
      {this.color1 = Colors.grey,
      this.color2 = Colors.blueGrey,
      this.icon = FontAwesomeIcons.circle,
      this.onPress,
      this.texto});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Stack(
        children: [
          _BotonGordoBackground(
            icon: icon,
            color1: color1,
            color2: color2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 140,
                width: 40,
              ),
              FaIcon(
                icon,
                color: Colors.white,
                size: 40,
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Text(
                  texto,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              FaIcon(
                FontAwesomeIcons.chevronRight,
                color: Colors.white,
              ),
              SizedBox(
                width: 40,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _BotonGordoBackground extends StatelessWidget {
  final IconData icon;

  final Color color1;
  final Color color2;
  const _BotonGordoBackground({this.icon, this.color1, this.color2});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.red,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(4, 6),
          )
        ],
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          colors: [
            color1,
            color2,
          ],
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            Positioned(
              right: -20,
              top: -20,
              child: FaIcon(
                icon,
                size: 150,
                color: Colors.white24,
              ),
            )
          ],
        ),
      ),
      margin: EdgeInsets.all(20),
    );
  }
}
