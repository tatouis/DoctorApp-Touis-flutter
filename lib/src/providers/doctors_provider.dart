import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http_parser/http_parser.dart';
import 'package:doctor2/src/models/doctor_model.dart';
import 'package:http/http.dart' as http;
import 'package:mime_type/mime_type.dart';

class DoctorsProvider {
  final String _url = 'https://swift-cli.firebaseio.com/';

  final _doctoresStream = StreamController<List<DoctorModel>>.broadcast();

  Function(List<DoctorModel>) get doctoresSink => _doctoresStream.sink.add;

  Stream<List<DoctorModel>> get doctoresStream => _doctoresStream.stream;

  void disposeStream() {
    _doctoresStream?.close();
  }

  Future<bool> crearDoctor(DoctorModel doctor) async {
    final url = '$_url/Doctors.json';

    http.post(url);

    final resp = await http.post(url, body: doctorModelToJson(doctor));

    final decodedData = json.decode(resp.body);

    print(decodedData);

    return true;
  }

  Future<bool> modificarDoctor(DoctorModel doctor) async {
    final url = '$_url/Doctors/${doctor.id}.json';

    http.post(url);

    final resp = await http.put(url, body: doctorModelToJson(doctor));

    final decodedData = json.decode(resp.body);

    print(decodedData);

    return true;
  }

  Future<List<DoctorModel>> cargarDoctores() async {
    final url = '$_url/Doctors.json';
    final resp = await http.get(url);

    final Map<String, dynamic> decodedData = json.decode(resp.body);
    final List<DoctorModel> doctors = new List();

    if (decodedData == null) return [];

    decodedData.forEach((key, value) {
      final doctorsTemp = DoctorModel.fromJson(value);
      doctorsTemp.id = key;

      doctors.add(doctorsTemp);
    });

    doctoresSink.call(doctors);

    return doctors;
  }

  Future<int> borrarDoctor(String id) async {
    final url = '$_url/Doctors/$id.json';
    final resp = await http.delete(url);
    print(resp.body);
    return 1;
  }

  Future<String> subirFotos(File image) async {
    final url = Uri.parse(
        'https://api.cloudinary.com/v1_1/tatouis/image/upload?upload_preset=ypbeci2c');
    final mineType = mime(image.path).split('/');

    final imageUploadReuest = http.MultipartRequest('POST', url);

    final file = await http.MultipartFile.fromPath('file', image.path,
        contentType: MediaType(mineType[0], mineType[1])
    );

    imageUploadReuest.files.add(file);
    final streamResponse = await imageUploadReuest.send();
    final resp = await http.Response.fromStream(streamResponse);

    if(resp.statusCode != 200 && resp.statusCode != 201){
      print('Algo salio mal');
      print(resp.body);
      return null;
    }

    final respData = json.decode(resp.body);
    return respData['secure_url'];
  }
}
