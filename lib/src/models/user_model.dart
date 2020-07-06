import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    int id;
    String email;
    String name;
    String psenom;
    String password;

    UserModel({
        this.id,
        this.email ,
        this.name  ,
        this.psenom ,
        this.password ,
    });

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id        : json["id"],
        email     : json["email"],
        name      : json["name"],
        psenom    : json["psenom"],
        password  : json["password"],
    );

    Map<String, dynamic> toJson() => {
        "id"      : id,
        "email"   : email,
        "name"    : name,
        "psenom"  : psenom,
        "password": password,
    };
}
