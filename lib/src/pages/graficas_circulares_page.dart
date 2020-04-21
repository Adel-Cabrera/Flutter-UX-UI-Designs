import 'package:flutter/material.dart';
import 'package:flutterexuxuii/src/labs/circular_progress_page.dart';
import 'package:flutterexuxuii/src/widgets/radial_progress.dart';

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
        child: Icon(
          Icons.refresh,
        ),
        onPressed: () {
          setState(() {
            print(porcentaje);
            porcentaje += 10.0;

            if (porcentaje > 100.0) {
              porcentaje = 0.0;
            }
          });
        },
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              CustomRadialProgress(
                porcentaje: porcentaje,
                color: Colors.purple,
              ),
              CustomRadialProgress(
                porcentaje: porcentaje,
                color: Colors.green,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              CustomRadialProgress(
                porcentaje: porcentaje,
                color: Colors.greenAccent,
              ),
              CustomRadialProgress(
                porcentaje: porcentaje,
                color: Colors.orange,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomRadialProgress extends StatelessWidget {
  const CustomRadialProgress({
    @required this.porcentaje,
    @required this.color,
  });

  final Color color;
  final double porcentaje;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180.0,
      width: 180.0,
      child: RadialProgress(
        porcentaje: porcentaje,
        colorPrimario: color,
      ),
    );
  }
}
