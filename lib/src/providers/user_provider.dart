import 'dart:convert';

import 'package:doctor2/src/preferencias/referencias_user.dart';
import 'package:http/http.dart' as http;

class UsersProvider {

  final String  _firenaseToken = 'AIzaSyCNs-OKmnb-7-zBGCsPFLJv3DHxKvzkFbc';
  final _prefs = new PreferenciasUsuario();

  Future<Map<String,dynamic>> login(String email,String password)async {
    final authData = {
      'email': email,
      'password': password,
      'returnSecureToken':true 
    };
    
    final resp = await http.post(
      'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$_firenaseToken',
      body: json.encode(authData)
    );  
    Map<String, dynamic> decodedResp = json.decode(resp.body);
    print(decodedResp);

    if(decodedResp.containsKey('idToken')){
      _prefs.token = decodedResp['idToken'];
      //Todo : salvar token en storage 
      return {'ok': true,'token':decodedResp['idToken']};
    }else{
      return {'ok': false,'mensaje':decodedResp['error']['message']};
    }

  }

  Future<Map<String,dynamic>> crearUser(String email,String password,String name, String prenom)async{

    final authData = {
      'email': email,
      'password': password,
      'name': name,
      'prenom': prenom,
      'returnSecureToken':true 
    };
    
    final resp = await http.post(
      'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$_firenaseToken',
      body: json.encode(authData)
    );  
    Map<String, dynamic> decodedResp = json.decode(resp.body);
    print(decodedResp);

    if(decodedResp.containsKey('idToken')){

      _prefs.token = decodedResp['idToken'];
      //Todo : salvar token en storage 
      return {'ok': true,'token':decodedResp['idToken']};
    }else{
      return {'ok': false,'mensaje':decodedResp['error']['message']};
    }
  }

}