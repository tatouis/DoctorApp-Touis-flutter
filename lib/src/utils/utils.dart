import 'package:flutter/material.dart';

void mostrarAlerta(BuildContext context,String mensajeMostrar){
  showDialog(
    context: context,
    builder: (context){
      return AlertDialog(
        title: Text('Information Incorrecte'),
        content: Text(mensajeMostrar),
        actions: <Widget>[
          FlatButton(
          onPressed: ()=>Navigator.of(context).pop(),
           child: Text('OK')
          ),
        ],
      );
    }
    );
}