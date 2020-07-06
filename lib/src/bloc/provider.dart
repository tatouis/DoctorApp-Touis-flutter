import 'package:flutter/material.dart';
import 'package:doctor2/src/bloc/bloc.dart';
export 'package:doctor2/src/bloc/bloc.dart';


class Provider extends InheritedWidget{

  static Provider _instancia;

  factory Provider({Key key, Widget child}){
    if(_instancia == null ){
      _instancia = new Provider._internal(key : key , child: child);
    }

    return _instancia;
  }

  Provider._internal({Key key, Widget child})
  : super (key:key ,child :child);


  final loginBloc = LoginBloc();

  // Provider.internal({Key key, Widget child})
  // : super (key:key ,child :child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static  LoginBloc of (BuildContext context){
    return context.findAncestorWidgetOfExactType<Provider>().loginBloc;
    
  }

}