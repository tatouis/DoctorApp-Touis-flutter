import 'package:doctor2/src/models/doctor_model.dart';
import 'package:doctor2/src/providers/doctors_provider.dart';
import 'package:doctor2/src/utils/colores_deplantilla.dart';
import 'package:doctor2/src/widget/cartDoctorAfichage_item.dart';
import 'package:flutter/material.dart';

class FavoritesDoc extends StatefulWidget {
  @override
  _FavoritesDocState createState() => _FavoritesDocState();
}

class _FavoritesDocState extends State<FavoritesDoc> {
  final doctorsProvider = new DoctorsProvider();
  var _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: mainBgColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 50.0,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    _specialistsCardInfo(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  
  Widget _specialistsCardInfo() {
    return FutureBuilder(
      future: doctorsProvider.cargarDoctores(),
      builder:
          (BuildContext context, AsyncSnapshot<List<DoctorModel>> snapshot) {
        if (snapshot.hasData) {
          final doctores = snapshot.data;
          return ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: doctores.length,
            itemBuilder: (context, i) => SpecialiteCardInfo(doctores[i],
                'index', _scaffoldKey, doctorsProvider.cargarDoctores),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
