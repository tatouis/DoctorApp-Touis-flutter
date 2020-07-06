import 'package:doctor2/src/pages/Add_doctor.dart';
import 'package:doctor2/src/pages/home_page.dart';
import 'package:doctor2/src/pages/index_page.dart';
import 'package:flutter/material.dart';
import 'package:doctor2/src/bloc/provider.dart';
import 'package:doctor2/src/pages/Login_page.dart';
import 'package:doctor2/src/pages/register_page.dart';
import 'package:doctor2/src/preferencias/referencias_user.dart';

import 'src/pages/doctor_detalles.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final prefs = new PreferenciasUsuario();
    print(prefs.token);
    return Provider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'login',
        routes: {
          'login': (BuildContext context) => LogingHome(),
          'home': (BuildContext context) => HomePage(),
          'registro': (BuildContext context) => RegisterPage(),
          'addDoctor': (BuildContext context) => AddDoctor(),
          'indexPage': (BuildContext context) => IndexPage(),
          'doctorDetaille' : (BuildContext context) => DoctorDetalle(),
          
        },
        theme: ThemeData(primaryColor: Colors.blueAccent),
      ),
    );
  }
}
