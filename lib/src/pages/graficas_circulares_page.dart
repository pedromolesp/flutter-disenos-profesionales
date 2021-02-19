import 'package:disenos/src/widgets/radial_progress.dart';
import 'package:flutter/material.dart';

class GraficasCircularesPage extends StatefulWidget {
  @override
  _GraficasCircularesPageState createState() => _GraficasCircularesPageState();
}

class _GraficasCircularesPageState extends State<GraficasCircularesPage> {
  double porcentaje = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              porcentaje += 10;
              if (porcentaje > 100) porcentaje = 0;
            });
          },
          child: Icon(Icons.refresh),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomRadialProgress(
                  porcentaje: porcentaje,
                  color: Colors.pink,
                ),
                CustomRadialProgress(
                  porcentaje: porcentaje,
                  color: Colors.purple,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomRadialProgress(
                  porcentaje: porcentaje,
                  color: Colors.blue,
                ),
                CustomRadialProgress(
                  porcentaje: porcentaje,
                  color: Colors.green,
                ),
              ],
            )
          ],
        )
        // Text(
        //   "$porcentaje %",
        //   style: TextStyle(fontSize: 50.0),
        // ),

        );
  }
}

class CustomRadialProgress extends StatelessWidget {
  final Color color;
  const CustomRadialProgress({@required this.porcentaje, @required this.color});

  final double porcentaje;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 180,
      child: RadialProgress(
        porcentaje: porcentaje,
        colorPrimario: color,
        colorSecundario: Colors.grey,
        grosorSecundario: 5.0,
        grosorPrimario: 10.0,
      ),
    );
  }
}
