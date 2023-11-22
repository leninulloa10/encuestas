import 'dart:convert';

class encuestaDiciembreModel {
  encuestaDiciembreModel(
      {
      
      this.id,
      this.date,
      this.genero,
      this.parroquia,
      this.sector,
      this.edad,
      this.respuesta1,
      this.respuesta2,
      this.respuesta3,
      this.respuesta4,
      this.respuesta5,
      this.respuesta6,
      this.respuesta7,
      this.respuesta8,
      this.respuesta9,
      this.respuesta10,
      this.respuesta11,
      this.respuesta12,
      this.respuesta13,
      this.respuesta14,
      this.respuesta15,
      this.respuesta16,
      this.respuesta17,
      this.respuesta18,
      this.respuesta19,
      this.respuesta20,
      this.respuesta21,
      this.latitud,
      this.longitud,
      this.user
      
      
      });

  int? id;
  String? date;
  String? genero;
  String? parroquia;
  String? sector;
  String? edad;
  String? respuesta1;
  String? respuesta2;
  String? respuesta3;
  String? respuesta4;
  String? respuesta5;
  String? respuesta6;
  String? respuesta7;
  String? respuesta8;
  String? respuesta9;
  String? respuesta10;
  String? respuesta11;
  String? respuesta12;
  String? respuesta13;
  String? respuesta14;
  String? respuesta15;
  String? respuesta16;
  String? respuesta17;
  String? respuesta18;
  String? respuesta19;
  String? respuesta20;
  String? respuesta21;
  String? latitud;
  String? longitud;
  String? user;

 

  factory encuestaDiciembreModel.fromJson(String str) =>
      encuestaDiciembreModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory encuestaDiciembreModel.fromMap(Map<String, dynamic> json) => encuestaDiciembreModel(
      id: json["id"],
      date: json["date"],
      genero: json["genero"],
      parroquia: json["parroquia"],
      sector: json["sector"],
      edad: json["edad"],
      respuesta1: json["respuesta1"],
      respuesta2: json["respuesta2"],
      respuesta3: json["respuesta3"],
      respuesta4: json["respuesta4"],
      respuesta5: json["respuesta5"],
      respuesta6: json["respuesta6"],
      respuesta7: json["respuesta7"],
      respuesta8: json["respuesta8"],
      respuesta9: json["respuesta9"],
      respuesta10: json["respuesta10"],
      respuesta11: json["respuesta11"],
      respuesta12: json["respuesta12"],
      respuesta13: json["respuesta13"],
      respuesta14: json["respuesta14"],
      respuesta15: json["respuesta15"],
      respuesta16: json["respuesta16"],
      respuesta17: json["respuesta17"],
      respuesta18: json["respuesta18"],
      respuesta19: json["respuesta19"],
      respuesta20: json["respuesta20"],
      respuesta21: json["respuesta21"],
      latitud: json["latitud"],
      longitud: json["longitud"],
      user: json["user"],
    
  );

  Map<String, dynamic> toMap() => {
        "id": id,
        "date": date,
        "genero":genero,
        "parroquia":parroquia,
        "sector":sector,
        "edad":edad,
        "respuesta1": respuesta1,
        "respuesta2": respuesta2,
        "respuesta3": respuesta3,
        "respuesta4": respuesta4,
        "respuesta5": respuesta5,
        "respuesta6": respuesta6,
        "respuesta7": respuesta7,
        "respuesta8": respuesta8,
        "respuesta9": respuesta9,
        "respuesta10": respuesta10,
        "respuesta11": respuesta11,
        "respuesta12": respuesta12,
        "respuesta13": respuesta13,
        "respuesta14": respuesta14,
        "respuesta15": respuesta15,
        "respuesta16": respuesta16,
        "respuesta17": respuesta17,
        "respuesta18": respuesta18,
        "respuesta19": respuesta19,
        "respuesta20": respuesta20,
        "respuesta21": respuesta21,
        "latitud":latitud,
        "longitud":longitud,
        "user": user,
        
      };
}
