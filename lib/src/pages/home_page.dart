import 'package:doctor2/src/models/doctor_model.dart';
import 'package:doctor2/src/pages/Add_doctor.dart';
import 'package:doctor2/src/pages/edit_doctor.dart';
import 'package:flutter/material.dart';

import 'calendary_pick.dart';
import 'coming_soon.dart';
import 'favorites_doctores.dart';
import 'index_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int curentIndex = 0;
  void onTapped(int index) {
    setState(() {
      curentIndex = index;
    });
  }

  var etat = true;

  DoctorModel doctorData;
  @override
  void didChangeDependencies() {
    if (etat) {
      final doctor = ModalRoute.of(context).settings.arguments;

      if (doctor != null) {
        if (doctor != null) {
          curentIndex = 3;
          doctorData = doctor;
        }
      }
    }
    etat = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _callPage(curentIndex),
      bottomNavigationBar: _bottompersonalnavbar(),
    );
  }

  Widget _callPage(int pageActuel) {
    switch (pageActuel) {
      case 0:
        return IndexPage();

      case 1:
        return CalendaryPick();

      case 2:
        return FavoritesDoc();

      case 3:
        if (doctorData != null) {
          return EditDoctor(
            doctor: doctorData,
          );
        } else {
          return AddDoctor();
        }
        break;

      case 4:
        return Commingsoon();

      default:
        return IndexPage();
    }
  }

  Widget _bottompersonalnavbar() {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      currentIndex: curentIndex,
      items: [
        BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 30.0,
            ),
            title: Text('Home')),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.calendar_today,
              size: 30.0,
            ),
            title: Text('Calendary')),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
              size: 30.0,
            ),
            title: Text('My favorites')),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.add,
              size: 30.0,
            ),
            title: Text('Add Doctor')),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
              size: 30.0,
            ),
            title: Text('Settings')),
      ],
      onTap: onTapped,
    );
  }
}
// final bloc = Provider.of(context);
//   return Scaffold(
//     appBar: AppBar(
//       title: Text('Enviar Inforamtion'),

//     ),
//     body: Center(
//       child: Column(

//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text('Email : ${bloc.email}'),
//             Divider(),
//             Text('Password :${bloc.password} '),
//           ],
//         ),
//     ),
//   );
