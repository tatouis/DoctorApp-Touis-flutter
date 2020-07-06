import 'package:doctor2/src/providers/user_provider.dart';
import 'package:doctor2/src/utils/colores_deplantilla.dart';
import 'package:doctor2/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:doctor2/src/bloc/provider.dart';
import 'package:doctor2/src/models/user_model.dart';


class RegisterPage extends StatefulWidget {

  final userProvider = new UsersProvider();

  static final String loginHome = 'loginHome';
  RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPage createState() => _RegisterPage();
}

class _RegisterPage extends State<RegisterPage> {


  UserModel user = new UserModel();
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
              
              FlatButton(onPressed: ()=> Navigator.pushReplacementNamed(context, 'login'),
               child: Text('Vous avez deja un account? Login',
               style: TextStyle(
                 color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.bold
               ),),
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
                'Resister Now it easy ! ',
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
                'Register',
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
              _crearName(bloc),
              SizedBox(
                height: 30.0,
              ),
              _crearPrenom(bloc),
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
  UserModel user = new UserModel();
  return StreamBuilder(
    stream: bloc.emailStream,
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: TextFormField(
          initialValue: user.email,
          onSaved: (value)=>user.email = value,
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
  UserModel user = new UserModel();
return   StreamBuilder(
    stream: bloc.passwordStream,
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: TextFormField(
          initialValue: user.password,
          onSaved: (value)=>user.password = value,
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

Widget _crearName(LoginBloc bloc) {
  UserModel user = new UserModel();
return   StreamBuilder(
    stream: bloc.nameStream,
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: TextFormField(
          initialValue: user.name,
          onSaved: (value)=>user.name = value,
          
          decoration: InputDecoration(
            icon: Icon(
              Icons.text_fields,
              color: Colors.blue,
            ),
            labelText: 'Name',
            counterText: snapshot.data,
            errorText: snapshot.error,
          ),
          onChanged: bloc.changename,
        ),
      );
    },
  );
}

Widget _crearPrenom(LoginBloc bloc) {
  UserModel user = new UserModel();
return   StreamBuilder(
    stream: bloc.prenomStream,
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: TextFormField(
          initialValue: user.psenom,
          onSaved: (value)=>user.psenom = value,
          
          decoration: InputDecoration(
            icon: Icon(
              Icons.text_fields,
              color: Colors.blue,
            ),
            labelText: 'Prenom',
            counterText: snapshot.data,
            errorText: snapshot.error,
          ),
          onChanged: bloc.changeprenom,
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
    stream: bloc.formValidation ,
    
    builder: (BuildContext context, AsyncSnapshot snapshot){
      return RaisedButton(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 100.0, vertical: 15.0),
        child: Text('Register'),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      elevation: 0.0,
      color: Colors.blue,
      textColor: Colors.white,
      onPressed: snapshot.hasData ? ()=> _register(bloc ,context) : null,
    );
    },
  );
  
}
_register(LoginBloc bloc ,BuildContext context)async{
  
  final userProvider = new UsersProvider();
  // Navigator.pushReplacementNamed(context, 'home');
  Map info = await userProvider.crearUser(bloc.email, bloc.password, bloc.name, bloc.prenom);

   

  if(info['ok']){
    Navigator.pushReplacementNamed(context, 'home');
  }else{
    mostrarAlerta(context,info['mensaje']);
  }
  
}