import 'package:flutter/material.dart';
import 'package:doctor2/src/models/doctor_model.dart';
import 'package:doctor2/src/providers/doctors_provider.dart';
import 'package:doctor2/src/utils/colores_deplantilla.dart';

class SpecialiteCardInfo extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final DoctorModel doctor;
  final String typepage;
  SpecialiteCardInfo(
      this.doctor, this.typepage, this.scaffoldKey, this.moreDoctores);
  final Function moreDoctores;

  @override
  _SpecialiteCardInfoState createState() => _SpecialiteCardInfoState();
}

class _SpecialiteCardInfoState extends State<SpecialiteCardInfo> {
  bool _isFavorited = true;
  final doctorsProvider = new DoctorsProvider();

  @override
  Widget build(
    BuildContext context,
  ) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 18.0),
      margin: EdgeInsets.only(
        bottom: 20.0,
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1.0,
              blurRadius: 6.0,
            ),
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              (widget.doctor.fotoProfil == null)
                  ? CircleAvatar(
                      backgroundColor: Color(0xFFD9D9D9),
                      backgroundImage: AssetImage('assets/img/noimage.png'),
                      radius: 36.0,
                    )
                  : CircleAvatar(
                      backgroundColor: Color(0xFFD9D9D9),
                      backgroundImage: NetworkImage(widget.doctor.fotoProfil),
                      radius: 36.0,
                    ),
              SizedBox(
                width: 10.0,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '${widget.doctor.name}',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.purple,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      height: 1.3,
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    '${widget.doctor.specialite}',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.black45,
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    '${widget.doctor.adress}',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.black38,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(
                    height: 6.0,
                  ),
                  widget.typepage == 'index'
                      ? RaisedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, 'doctorDetaille',
                                arguments: widget.doctor);
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(80.0)),
                          padding: const EdgeInsets.all(0.0),
                          child: Ink(
                            decoration: const BoxDecoration(
                              gradient: skyGradient,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(80.0)),
                            ),
                            child: Container(
                              constraints: const BoxConstraints(
                                  minWidth: 88.0,
                                  minHeight:
                                      36.0), // min sizes for Material buttons
                              alignment: Alignment.center,
                              child: const Text(
                                'Book Visit',
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 13,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        )
                      : RaisedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, 'home',
                                arguments: widget.doctor);
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(80.0)),
                          padding: const EdgeInsets.all(0.0),
                          child: Ink(
                            decoration: const BoxDecoration(
                              gradient: verdeGradient,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(80.0)),
                            ),
                            child: Container(
                              constraints: const BoxConstraints(
                                  minWidth: 88.0,
                                  minHeight:
                                      40.0), // min sizes for Material buttons
                              alignment: Alignment.center,
                              child: const Text(
                                'Edit',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                ],
              ),
            ],
          ),
          widget.typepage == 'index'
              ? Material(
                  color: Colors.white,
                  child: IconButton(
                    icon: Icon(
                      _isFavorited ? Icons.favorite : Icons.favorite_border,
                      color: _isFavorited ? Colors.red : null,
                    ),
                    onPressed: _toggleFavorite,
                    color: Colors.red[200],
                    iconSize: 36.0,
                  ),
                )
              : Material(
                  color: Colors.white,
                  child: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Supprime ?'),
                              content: Text("Vous Voulez vraiment supprime"),
                              actions: <Widget>[
                                // usually buttons at the bottom of the dialog
                                FlatButton(
                                  child: new Text("Yes"),
                                  onPressed: () async {
                                    try {
                                      await doctorsProvider
                                          .borrarDoctor(widget.doctor.id);
                                      widget.scaffoldKey.currentState
                                          .showSnackBar(SnackBar(
                                        content: Text('Bien Supprime ! '),
                                        backgroundColor: Colors.orange[300],
                                      ));
                                      Navigator.of(context).pop();
                                      widget.moreDoctores();
                                    } catch (error) {
                                      widget.scaffoldKey.currentState
                                          .showSnackBar(SnackBar(
                                        content: Text('Annuler ! '),
                                        backgroundColor: Colors.yellow[200],
                                      ));
                                    }
                                  },
                                ),
                                FlatButton(
                                  child: new Text("Non"),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          });
                    },
                    color: Colors.red[200],
                    iconSize: 36.0,
                  ),
                ),
        ],
      ),
    );
  }
  void _toggleFavorite() {
  setState(() {
    if (_isFavorited) {
      
      _isFavorited = false;
    } else {
      
      _isFavorited = true;
    }
  });
}
}
