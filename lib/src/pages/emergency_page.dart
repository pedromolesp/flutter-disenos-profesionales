import 'package:animate_do/animate_do.dart';
import 'package:disenos/src/widgets/boton_gordo.dart';
import 'package:disenos/src/widgets/headers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ItemBoton {
  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;

  ItemBoton(this.icon, this.texto, this.color1, this.color2);
}

class EmergencyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final items = <ItemBoton>[
      new ItemBoton(FontAwesomeIcons.carCrash, 'Motor Accident',
          Color(0xff6989F5), Color(0xff906EF5)),
      new ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency',
          Color(0xff66A9F2), Color(0xff536CF6)),
      new ItemBoton(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement',
          Color(0xffF2D572), Color(0xffE06AA3)),
      new ItemBoton(FontAwesomeIcons.biking, 'Awards', Color(0xff317183),
          Color(0xff46997D)),
      new ItemBoton(FontAwesomeIcons.carCrash, 'Motor Accident',
          Color(0xff6989F5), Color(0xff906EF5)),
      new ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency',
          Color(0xff66A9F2), Color(0xff536CF6)),
      new ItemBoton(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement',
          Color(0xffF2D572), Color(0xffE06AA3)),
      new ItemBoton(FontAwesomeIcons.biking, 'Awards', Color(0xff317183),
          Color(0xff46997D)),
      new ItemBoton(FontAwesomeIcons.carCrash, 'Motor Accident',
          Color(0xff6989F5), Color(0xff906EF5)),
      new ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency',
          Color(0xff66A9F2), Color(0xff536CF6)),
      new ItemBoton(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement',
          Color(0xffF2D572), Color(0xffE06AA3)),
      new ItemBoton(FontAwesomeIcons.biking, 'Awards', Color(0xff317183),
          Color(0xff46997D)),
    ];

    List<Widget> botonesGordos = items
        .map((e) => FadeInLeft(
              duration: Duration(milliseconds: 650),
              delay: Duration(milliseconds: 100),
              child: new BotonGordo(
                color1: e.color1,
                color2: e.color2,
                icon: e.icon,
                onPress: () => print("bt"),
                texto: e.texto,
              ),
            ))
        .toList();
    return Scaffold(
        body: Stack(
      children: [
        ListView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.only(top: 300),
          children: botonesGordos,
        ),
        _Encabezado(),
      ],
    ));
  }
}

class _Encabezado extends StatelessWidget {
  const _Encabezado({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconHeader(
          icon: FontAwesomeIcons.plus,
          subtitulo: "Asistencia Médica",
          titulo: "Has solicitado",
          color1: Color(0xff526bf6),
          color2: Color(0xff67acf2),
        ),
        Positioned(
            right: -10,
            top: 40,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(120),
              child: RawMaterialButton(
                onPressed: () {},
                child: FaIcon(
                  FontAwesomeIcons.ellipsisV,
                  color: Colors.white,
                ),
              ),
            ))
      ],
    );
  }
}

class BotonGordoTemp extends StatelessWidget {
  const BotonGordoTemp({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BotonGordo(
      texto: "Titulo",
      icon: FontAwesomeIcons.carCrash,
      color1: Color(0xff6989f5),
      color2: Color(0xff906ef5),
      onPress: () {
        print("object");
      },
    );
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
      subtitulo: "Has solicitado",
      titulo: "Asistencia Médica",
      color1: Color(0xff526bf6),
      color2: Color(0xff67acf2),
    );
  }
}
