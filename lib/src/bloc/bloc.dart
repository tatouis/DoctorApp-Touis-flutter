import 'dart:async';

import 'package:doctor2/src/bloc/validation.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc with Validations{


    final _emailController    = BehaviorSubject<String>();
    final _passwordController = BehaviorSubject<String>();
    final _nameController     = BehaviorSubject<String>();
    final _prenomController   = BehaviorSubject<String>();


    //recuperar datos del Stream 

    Stream<String> get emailStream => _emailController.stream.transform(validarEmail);
    Stream<String> get passwordStream => _passwordController.stream.transform( validarPassword );
    Stream<String> get nameStream => _nameController.stream;
    Stream<String> get prenomStream => _prenomController.stream;


    Stream<bool>  get formValidation => CombineLatestStream.combine2(emailStream, passwordStream, (a, b) => true);
    Stream<bool>  get formValidationRegister => CombineLatestStream.combine4(emailStream, passwordStream,nameStream,prenomStream, (a, b,c,d) => true);
    //Insertar valores al Stream 
    Function(String) get changeEmail => _emailController.sink.add;
    Function(String) get changepassword => _passwordController.sink.add;
    Function(String) get changename => _nameController.sink.add;
    Function(String) get changeprenom => _prenomController.sink.add;


    //obtener ultimo valor de los streams 

    String get email  => _emailController.value;
    String get password  => _passwordController.value;
    String get name  => _nameController.value;
    String get prenom  => _prenomController.value;

    // cerrar el stream 
    dispose(){
      _emailController?.close();
      _passwordController?.close();
      _nameController?.close();
      _prenomController?.close();
    }

}