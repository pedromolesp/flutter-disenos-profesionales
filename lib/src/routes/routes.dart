import 'package:disenos/src/pages/emergency_page.dart';
import 'package:disenos/src/pages/graficas_circulares_page.dart';
import 'package:disenos/src/pages/headers_page.dart';
import 'package:disenos/src/pages/pinterest_page.dart';
import 'package:disenos/src/pages/slideshow_page.dart';
import 'package:disenos/src/retos/cuadrado_animado_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final pageRoutes = <_Route>[
  _Route(FontAwesomeIcons.slideshare, "Slideshow", SlideShowPage()),
  _Route(FontAwesomeIcons.ambulance, "Emergencia", EmergencyPage()),
  _Route(FontAwesomeIcons.peopleCarry, "Encabezados", HeadersPage()),
  _Route(FontAwesomeIcons.circleNotch, "Cuadro animado", CuadradoAnimadoPage()),
  _Route(FontAwesomeIcons.circle, "Progresos", GraficasCircularesPage()),
  _Route(FontAwesomeIcons.pinterest, "Pinterest", PinterestPage()),
];

class _Route {
  final IconData icon;
  final String titulo;
  final Widget page;
  _Route(
    this.icon,
    this.titulo,
    this.page,
  );
}
