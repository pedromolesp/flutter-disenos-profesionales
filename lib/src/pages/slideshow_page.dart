import 'package:disenos/src/widgets/slideshow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SlideShowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: MiSlideShow()),
          Expanded(child: MiSlideShow()),
        ],
      ),
    );
  }
}

class MiSlideShow extends StatelessWidget {
  const MiSlideShow({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlideShow(
      puntosArriba: true,
      colorPrimario: Colors.red,
      colorSecundario: Colors.green,
      bulletPrimario: 15,
      bulletSecundario: 12,
      slides: [
        SvgPicture.asset("assets/svgs/slide-1.svg"),
        SvgPicture.asset("assets/svgs/slide-2.svg"),
        SvgPicture.asset("assets/svgs/slide-3.svg"),
        SvgPicture.asset("assets/svgs/slide-4.svg"),
        SvgPicture.asset("assets/svgs/slide-5.svg")
      ],
    );
  }
}
