import 'dart:convert';

DoctorModel doctorModelFromJson(String str) => DoctorModel.fromJson(json.decode(str));

String doctorModelToJson(DoctorModel data) => json.encode(data.toJson());

class DoctorModel {
    String id         ;
    String name       = '';
    String specialite = '';
    String adress     = '';
    String fotoProfil = '';

    DoctorModel({
        this.id,
        this.name,
        this.specialite,
        this.adress,
        this.fotoProfil,
    });

    factory DoctorModel.fromJson(Map<String, dynamic> json) => DoctorModel(
        id: json["id"],
        name: json["name"],
        specialite: json["specialite"],
        adress: json["adress"],
        fotoProfil: json["fotoProfil"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "specialite": specialite,
        "adress": adress,
        "fotoProfil": fotoProfil,
    };
}
