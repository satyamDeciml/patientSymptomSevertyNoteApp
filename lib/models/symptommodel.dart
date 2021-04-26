
import 'dart:convert';


class SymptomModel {
  SymptomModel({
    this.symptoms,
    this.userId,

  });


  List<Map<dynamic,dynamic>> symptoms;
  int userId;


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
