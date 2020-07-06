import 'dart:io';

import 'package:flutter/material.dart';
import 'package:doctor2/src/models/doctor_model.dart';
import 'package:doctor2/src/providers/doctors_provider.dart';
import 'package:doctor2/src/utils/colores_deplantilla.dart';
import 'package:doctor2/src/widget/cartDoctorAfichage_item.dart';
import 'package:image_picker/image_picker.dart';

class EditDoctor extends StatefulWidget {
  final DoctorModel doctor;
  EditDoctor({this.doctor});

  @override
  _EditDoctorState createState() => _EditDoctorState();
}

class _EditDoctorState extends State<EditDoctor> {
  final doctorsProvider = new DoctorsProvider();
  final formKey = GlobalKey<FormState>();
  DoctorModel doctor = new DoctorModel();

  FocusNode myFocusNode1 = new FocusNode();
  FocusNode myFocusNode2 = new FocusNode();
  FocusNode myFocusNode3 = new FocusNode();

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  File _foto;

  @override
  Widget build(BuildContext context) {
    //para ver si el id que envio de cartadoctor existe o no para hacer la edition
    final DoctorModel doctorData = ModalRoute.of(context).settings.arguments;
    if (doctorData != null) {
      doctor = doctorData;
    }
    doctorsProvider.cargarDoctores();
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Edit doctores'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                Navigator.pushNamed(context, 'home');
              }),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  gradient: skyGradient,
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                padding: EdgeInsets.all(20),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: <Widget>[
                      _fotoDePerfil(),
                      SizedBox(
                        height: 20.0,
                      ),
                      _crearNombre(),
                      SizedBox(
                        height: 20.0,
                      ),
                      _addCategorie(),
                      SizedBox(
                        height: 20.0,
                      ),
                      _addAdress(),
                      SizedBox(
                        height: 20.0,
                      ),
                      _addButton(),
                    ],
                  ),
                ),
              ),
              _areaSpecialistsText(),
              _specialistsCardInfo(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _fotoDePerfil() {
    return Container(
      child: Column(
        children: <Widget>[
          _imagen(),
          FlatButton(
              onPressed: _selectFoto,
              child: Text(
                'Change Foto De prefil',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold),
              )),
        ],
      ),
    );
  }

  Widget _imagen() {
    if (doctor.fotoProfil == null) {
      return CircleAvatar(
              backgroundColor: Color(0xFFD9D9D9),
              backgroundImage: AssetImage('assets/img/noimage.png'),
              radius: 36.0,
            );
    } else {
      return (doctor.fotoProfil == null)
          ? CircleAvatar(
              backgroundColor: Color(0xFFD9D9D9),
              backgroundImage: AssetImage('assets/img/noimage.png'),
              radius: 36.0,
            )
          : CircleAvatar(
              backgroundColor: Color(0xFFD9D9D9),
              backgroundImage: NetworkImage(doctor.fotoProfil),
              radius: 36.0,
            );
    }
  }

  Widget _crearNombre() {
    return TextFormField(
      initialValue: doctor.name,
      textCapitalization: TextCapitalization.sentences,
      cursorColor: Colors.white,
      focusNode: myFocusNode1,
      style: TextStyle(
        color: Colors.white,
        fontSize: 20.0,
      ),
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.greenAccent, width: 5.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 5.0),
        ),
        labelText: 'Name Doctor',
        hintText: 'Doctor Name',
        labelStyle: TextStyle(
            color: myFocusNode1.hasFocus ? Colors.white : Colors.white),
        hintStyle: TextStyle(
            color: myFocusNode1.hasFocus ? Colors.white : Colors.white),
      ),
      onSaved: (value) => doctor.name = value,
      validator: (value) {
        if (value.length < 3) {
          return 'Mas de 5 caracteres porfavor';
        } else {
          return null;
        }
      },
    );
  }

  Widget _addCategorie() {
    return TextFormField(
      initialValue: doctor.specialite,
      textCapitalization: TextCapitalization.sentences,
      style: TextStyle(
        color: Colors.white,
        fontSize: 20.0,
      ),
      cursorColor: Colors.white,
      focusNode: myFocusNode2,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.greenAccent, width: 5.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 5.0),
        ),
        labelText: 'Specialisation Doctor',
        hintText: 'Doctor Specialisation',
        labelStyle: TextStyle(
            color: myFocusNode2.hasFocus ? Colors.white : Colors.white),
        hintStyle: TextStyle(
            color: myFocusNode2.hasFocus ? Colors.white : Colors.white),
      ),
      onSaved: (value) => doctor.specialite = value,
      validator: (value) {
        if (value.length < 3) {
          return 'Mas de 5 caracteres porfavor';
        } else {
          return null;
        }
      },
    );
  }

  Widget _addAdress() {
    return TextFormField(
      initialValue: doctor.adress,
      textCapitalization: TextCapitalization.sentences,
      style: TextStyle(
        color: Colors.white,
        fontSize: 20.0,
      ),
      cursorColor: Colors.white,
      focusNode: myFocusNode3,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.greenAccent, width: 5.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 5.0),
        ),
        labelText: 'Adrees de cabine de Doctor',
        hintText: 'Adress docteur',
        labelStyle: TextStyle(
            color: myFocusNode3.hasFocus ? Colors.white : Colors.white),
        hintStyle: TextStyle(
            color: myFocusNode3.hasFocus ? Colors.white : Colors.white),
      ),
      onSaved: (value) => doctor.adress = value,
      validator: (value) {
        if (value.length < 15) {
          return 'Mas de 15 caracteres porfavor';
        } else {
          return null;
        }
      },
    );
  }

  _addButton() {
    return RaisedButton(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 100.0, vertical: 15.0),
        child: Text(
          'Modifie Doctor',
          style: TextStyle(fontSize: 20.0),
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      elevation: 0.0,
      color: Colors.blueAccent,
      textColor: Colors.white,
      onPressed: _submit,
    );
  }

  Widget _areaSpecialistsText() {
    return Container(
      margin: EdgeInsets.only(top: 20.0, bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'All Doctors in Database',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          Text(
            'See All',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: midColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _specialistsCardInfo() {
    return StreamBuilder(
      stream: doctorsProvider.doctoresStream,
      builder:
          (BuildContext context, AsyncSnapshot<List<DoctorModel>> snapshot) {
        if (snapshot.hasData) {
          final doctores = snapshot.data;
          return ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: doctores.length,
            itemBuilder: (context, i) => SpecialiteCardInfo(doctores[i],
                'AddDoctor', _scaffoldKey, doctorsProvider.cargarDoctores),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  void _submit() async {
    if (!formKey.currentState.validate()) {
      return;
    }
    formKey.currentState.save();
    if(_foto != null){
      doctor.fotoProfil = await doctorsProvider.subirFotos(_foto);
    }
    if (doctor.id == null) {
      try {
        await doctorsProvider.crearDoctor(doctor);
        _scaffoldKey.currentState.showSnackBar(SnackBar(
          content: Text('Bien Modifie! '),
          backgroundColor: Colors.green[200],
        ));

        setState(() {});
      } catch (error) {
        _scaffoldKey.currentState.showSnackBar(SnackBar(
          content: Text('Error pas Modification ! '),
          backgroundColor: Colors.red[200],
        ));
      }
    } else {
      try {
        await doctorsProvider.modificarDoctor(doctor);
        _scaffoldKey.currentState.showSnackBar(SnackBar(
          content: Text('Bien Modifie! '),
          backgroundColor: Colors.green[200],
        ));

        setState(() {});
      } catch (error) {
        _scaffoldKey.currentState.showSnackBar(SnackBar(
          content: Text('Error pas Modification ! '),
          backgroundColor: Colors.red[200],
        ));
      }
    }
  }

  Future _selectFoto() async {
    final pickedFoto =
        await ImagePicker().getImage(source: ImageSource.gallery);

    if (_foto != null) {
      // limpiar si no ay foto
    }

    setState(() {
      _foto = File(pickedFoto.path);
    });
  }
}
