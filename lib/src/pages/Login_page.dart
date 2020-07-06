import 'package:doctor2/src/utils/colores_deplantilla.dart';
import 'package:flutter/material.dart';
import 'package:doctor2/src/bloc/provider.dart';
import 'package:doctor2/src/providers/user_provider.dart';
import 'package:doctor2/src/utils/utils.dart';

class LogingHome extends StatefulWidget {
  static final String loginHome = 'loginHome';
  final userProvider = new UsersProvider();
  LogingHome({Key key}) : super(key: key);

  @override
  _LogingHomeState createState() => _LogingHomeState();
}

class _LogingHomeState extends State<LogingHome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: skyGradient,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        //singelchild me permite hacer scroll
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _logoForm(),
              _loginform(context),
              FlatButton(
                onPressed: () =>
                    Navigator.pushReplacementNamed(context, 'registro'),
                child: Text(
                  '¿Enregistre?',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              _girandocarga(),
              SizedBox(
                height: 50.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _logoForm() {
  return Stack(
    children: <Widget>[
      Container(
        padding: EdgeInsets.only(top: 50.0),
        width: double.infinity,
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.white,
                ),
                width: double.infinity,
                child: Image(
                  image: AssetImage('assets/img/logomsi2020.png'),
                ),
              ),
              SizedBox(
                height: 5.0,
                width: double.infinity,
              ),
              Text(
                'Welcome To Your Clinique APP',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}

Widget _loginform(BuildContext context) {
  final bloc = Provider.of(context);
  final size = MediaQuery.of(context).size;

  return SingleChildScrollView(
    child: Column(
      children: <Widget>[
        Container(
          width: size.width * 0.85,
          margin: EdgeInsets.symmetric(vertical: 30.0),
          padding: EdgeInsets.only(top: 20, bottom: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5.0),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.black26,
                blurRadius: 3.0,
                offset: Offset(0.0, 5.0),
                spreadRadius: 3.0,
              ),
            ],
          ),
          child: Column(
            children: <Widget>[
              Text(
                'Login',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[200],
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              _crearEmail(bloc),
              SizedBox(
                height: 30.0,
              ),
              _crearPassword(bloc),
              SizedBox(
                height: 30.0,
              ),
              _crearBotton(bloc),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _crearEmail(LoginBloc bloc) {
  return StreamBuilder(
    stream: bloc.emailStream,
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            icon: Icon(
              Icons.alternate_email,
              color: Colors.blue,
            ),
            hintText: 'exemple@email.com',
            labelText: 'Courie Electronic',
            counterText: snapshot.data,
            errorText: snapshot.error,
          ),
          onChanged: bloc.changeEmail,
        ),
      );
    },
  );
}

Widget _crearPassword(LoginBloc bloc) {
  return StreamBuilder(
    stream: bloc.passwordStream,
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          obscureText: true,
          decoration: InputDecoration(
            icon: Icon(
              Icons.lock,
              color: Colors.blue,
            ),
            labelText: 'Mode Pass',
            counterText: snapshot.data,
            errorText: snapshot.error,
          ),
          onChanged: bloc.changepassword,
        ),
      );
    },
  );
}

Widget _girandocarga() {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 30.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircularProgressIndicator(
          strokeWidth: 1.5,
          backgroundColor: Colors.white,
        ),
        Padding(
          padding: EdgeInsets.only(
            top: 20.0,
          ),
        ),
        Text(
          'Take your appointment to next level \n Making your life easy <3',
          style: TextStyle(
              color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}

Widget _crearBotton(LoginBloc bloc) {
  return StreamBuilder(
    stream: bloc.formValidation,
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      return RaisedButton(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 100.0, vertical: 15.0),
          child: Text('Login'),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        elevation: 0.0,
        color: Colors.blue,
        textColor: Colors.white,
        onPressed: snapshot.hasData ? () => _login(bloc, context) : null,
      );
    },
  );
}

_login(LoginBloc bloc, BuildContext context) async {
  final userProvider = new UsersProvider();
  // Navigator.pushReplacementNamed(context, 'home');
  Map info = await userProvider.login(bloc.email, bloc.password);

  if (info['ok']) {
    Navigator.pushReplacementNamed(context, 'home');
  } else {
    mostrarAlerta(context, info['mensaje']);
  }
}
