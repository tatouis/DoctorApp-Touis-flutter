import 'package:doctor2/src/models/doctor_model.dart';
import 'package:flutter/material.dart';
import "dart:math";

class DoctorDetalle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DoctorModel doctor = ModalRoute.of(context).settings.arguments;
 
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          _crearNaavbar(doctor),
        ],
      ),
    );
  }
}

Widget _crearNaavbar(doctor) {
     var list = ['assets/img/1.jpg', 'assets/img/2.jpg', 'assets/img/3.jpg', 'assets/img/4.jpg'];

// generates a new Random object
    final _random = new Random();
    
  var element = list[_random.nextInt(list.length)];
  return SliverAppBar(
    elevation: 2.0,
    backgroundColor: Colors.indigoAccent[200],
    floating: false,
    expandedHeight: 200.0,
    pinned: true,
    flexibleSpace: FlexibleSpaceBar(
      centerTitle: true,
      title: Text(doctor.name,
          style: TextStyle(color: Colors.white, fontSize: 25.0)),
      background: FadeInImage(
        placeholder: AssetImage('assets/img/loading.gif'),
        image: AssetImage(element),
        fadeInDuration: Duration(milliseconds: 150),
        fit: BoxFit.cover,
      ),
    ),
  );
}
