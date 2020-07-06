import 'package:doctor2/src/utils/colores_deplantilla.dart';

import 'package:flutter/material.dart';

class Commingsoon extends StatefulWidget {
  @override
  _CommingsoonState createState() => _CommingsoonState();
}

class _CommingsoonState extends State<Commingsoon> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      body: SingleChildScrollView(

        child: Padding(
          padding: const EdgeInsets.only(top :250 ,right: 20.0, left: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Stack(
                alignment: AlignmentDirectional.bottomEnd,
                overflow: Overflow.visible,
                children: <Widget>[
                  _backBgCover(),
                  _greetings(),
                  
                ],
              ),
            ],
    ),
        ),
      ),
    );
}

Container _backBgCover() {
    return Container(
      height: 260.0,
      decoration: BoxDecoration(
        gradient: skyGradient,
        borderRadius: BorderRadius.circular(20.0)
      ),
    );
  }

  Positioned _greetings() {
    
    return Positioned(
      left: 20,
      bottom: 90,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[

          Image(
                  image: AssetImage('assets/img/logomsi2020.png'),
                ),
          Text(
            'Comming soon',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Wait for it ',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w300,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  
}