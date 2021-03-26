import 'package:disenos/src/widgets/boton_gordo.dart';
import 'package:disenos/src/widgets/headers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EmergencyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: BotonGordo()));
  }
}

class PageHeader extends StatelessWidget {
  const PageHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconHeader(
      icon: FontAwesomeIcons.plusCircle,
      subtitulo: "Has soilicitado",
      titulo: "Asistencia Médica",
      color1: Color(0xff526bf6),
      color2: Color(0xff67acf2),
    );
  }
}
