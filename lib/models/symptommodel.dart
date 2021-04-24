// To parse this JSON data, do
//
//     final symptomModel = symptomModelFromJson(jsonString);

import 'dart:convert';

// SymptomModel symptomModelFromJson(String str) =>
    // SymptomModel.fromJson(json.decode(str));

// String symptomModelToJson(SymptomModel data) => json.encode(data.toJson());

class SymptomModel {
  SymptomModel({
    this.symptoms,
    this.userId,
    //this.l,
  });

 // List<Symptom> symptoms;
  List<Map<dynamic,dynamic>> symptoms;
  int userId;

  // factory SymptomModel.fromJson(Map<String, dynamic> json) => SymptomModel(
  //       symptoms: List<Symptom>.from(
  //           json["symptoms"].map((x) => Symptom.fromJson(x))),
  //       userId: json["user-id"],
  //     );

  Map<String, dynamic> toJson() => {
        "symptoms": symptoms,
        "user-id": userId,
      };
}

class Symptom {
  Symptom({
    this.vomiting,
    this.fatigue,
  });

  int vomiting;
  int fatigue;

  factory Symptom.fromJson(Map<String, dynamic> json) => Symptom(
        vomiting: json["vomiting"] == null ? null : json["vomiting"],
        fatigue: json["fatigue"] == null ? null : json["fatigue"],
      );

  Map<String, dynamic> toJson() => {
        "vomiting": vomiting == null ? null : vomiting,
        "fatigue": fatigue == null ? null : fatigue,
      };
}
