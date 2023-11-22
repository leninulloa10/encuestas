import 'dart:convert';

class conteoModel {
  conteoModel(
      {this.id,
      this.parroquia,
      this.recinto,
      this.sector,
      this.genero,
      this.mesa,
      this.cantidadIgnacioDavalos,
      this.cantidadXavierVilca,
      this.cantidadMyriamAuz,
      this.cantidadCarlosOrtega,
      this.cantidadFelioeBonilla,
      this.cantidadSalomemarin,
      this.cantidadDianaCaiza,
      this.cantidadLuisAmoroso,
      this.cantidadJavierAltamirano,
      this.cantidadNulos,
      this.cantidadBlancos,
      this.cantidadTotal,
      this.photo,
      this.imagePath,
      this.visible});

  int? id;
  String? parroquia;
  String? recinto;
  String? sector;
  String? genero;
  int? mesa;
  int? cantidadIgnacioDavalos;
  int? cantidadXavierVilca;
  int? cantidadMyriamAuz;
  int? cantidadCarlosOrtega;
  int? cantidadFelioeBonilla;
  int? cantidadSalomemarin;
  int? cantidadDianaCaiza;
  int? cantidadLuisAmoroso;
  int? cantidadJavierAltamirano;
  int? cantidadNulos;
  int? cantidadBlancos;
  int? cantidadTotal;
  String? photo;
  String? imagePath;
  int? visible;

  factory conteoModel.fromJson(String str) =>
      conteoModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory conteoModel.fromMap(Map<String, dynamic> json) => conteoModel(
      id: json["id"],
      parroquia: json["parroquia"],
      recinto: json["recinto"],
      sector: json["sector"],
      genero: json["genero"],
      mesa: json["mesa"],
      cantidadIgnacioDavalos: json["cantidadIgnacioDavalos"],
      cantidadXavierVilca: json["cantidadXavierVilca"],
      cantidadMyriamAuz: json["cantidadMyriamAuz"],
      cantidadCarlosOrtega: json["cantidadCarlosOrtega"],
      cantidadFelioeBonilla: json["cantidadFelioeBonilla"],
      cantidadSalomemarin: json["cantidadSalomemarin"],
      cantidadDianaCaiza: json["cantidadDianaCaiza"],
      cantidadLuisAmoroso: json["cantidadLuisAmoroso"],
      cantidadJavierAltamirano: json["cantidadJavierAltamirano"],
      cantidadNulos: json["cantidadNulos"],
      cantidadBlancos: json["cantidadBlancos"],
      cantidadTotal: json["cantidadTotal"],
      photo: json["photo"],
      imagePath: json["imagePath"],
      visible: json["visible"]);

  Map<String, dynamic> toMap() => {
        "id": id,
        "parroquia": parroquia,
        "recinto": recinto,
        "sector": sector,
        "genero": genero,
        "mesa": mesa,
        "cantidadIgnacioDavalos": cantidadIgnacioDavalos,
        "cantidadXavierVilca": cantidadXavierVilca,
        "cantidadMyriamAuz": cantidadMyriamAuz,
        "cantidadCarlosOrtega": cantidadCarlosOrtega,
        "cantidadFelioeBonilla": cantidadFelioeBonilla,
        "cantidadSalomemarin": cantidadSalomemarin,
        "cantidadDianaCaiza": cantidadDianaCaiza,
        "cantidadLuisAmoroso": cantidadLuisAmoroso,
        "cantidadJavierAltamirano": cantidadJavierAltamirano,
        "cantidadNulos": cantidadNulos,
        "cantidadBlancos": cantidadBlancos,
        "cantidadTotal": cantidadTotal,
        "photo": photo,
        "imagePath": imagePath,
        "visible": visible
      };
}
