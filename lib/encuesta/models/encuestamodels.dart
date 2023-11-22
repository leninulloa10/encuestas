// To parse this JSON data, do
//
//     final encuestasModel = encuestasModelFromMap(jsonString);

import 'dart:convert';

class EncuestasModel {
    EncuestasModel({
        required this.surveys,
    });

    List<Survey> surveys;

    factory EncuestasModel.fromJson(String str) => EncuestasModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory EncuestasModel.fromMap(Map<String, dynamic> json) => EncuestasModel(
        surveys: List<Survey>.from(json["surveys"].map((x) => Survey.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "surveys": List<dynamic>.from(surveys.map((x) => x.toMap())),
    };
}

class Survey {
    Survey({
        required this.city,
        required this.code,
        required this.parish,
        required this.answers,
        required this.zone,
        required this.age,
        required this.lat,
        required this.lng,
        required this.gender,
    });

    String city;
    String code;
    String parish;
    List<dynamic> answers;
    String zone;
    int age;
    double lat;
    double lng;
    String gender;

    factory Survey.fromJson(String str) => Survey.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Survey.fromMap(Map<String, dynamic> json) => Survey(
        city: json["city"],
        code: json["code"],
        parish: json["parish"],
        answers: List<dynamic>.from(json["answers"].map((x) => x)),
        zone: json["zone"],
        age: json["age"],
        lat: json["lat"],
        lng: json["lng"],
        gender: json["gender"],
    );

    Map<String, dynamic> toMap() => {
        "city": city,
        "code": code,
        "parish": parish,
        "answers": List<dynamic>.from(answers.map((x) => x)),
        "zone": zone,
        "age": age,
        "lat": lat,
        "lng": lng,
        "gender": gender,
    };
}
