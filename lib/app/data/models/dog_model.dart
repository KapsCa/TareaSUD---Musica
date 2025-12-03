
class BreedsDogs {
  String? name;
  String? description;
  MaxMinValues? life;
  MaxMinValues? maleWeight;
  MaxMinValues? femaleWeight;
  bool? hypoallergenic;

  BreedsDogs({
    this.name,
    this.description,
    this.life,
    this.maleWeight,
    this.femaleWeight,
    this.hypoallergenic,
  });

  factory BreedsDogs.fromMap(Map<String, dynamic> json) => BreedsDogs(
    name: json["name"],
    description: json["description"],
    life: json["life"] == null ? null : MaxMinValues.fromMap(json["life"]),
    maleWeight: json["male_weight"] == null
        ? null
        : MaxMinValues.fromMap(json["male_weight"]),
    femaleWeight: json["female_weight"] == null
        ? null
        : MaxMinValues.fromMap(json["female_weight"]),
    hypoallergenic: json["hypoallergenic"],
  );

//   Map<String, dynamic> toMap() => {
//     "name": name,
//     "description": description,
//     "life": life?.toMap(),
//     "male_weight": maleWeight?.toMap(),
//     "female_weight": femaleWeight?.toMap(),
//     "hypoallergenic": hypoallergenic,
//   };

}

class MaxMinValues {
  int? max;
  int? min;

  MaxMinValues({this.max, this.min});

  factory MaxMinValues.fromMap(Map<String, dynamic> json) =>
      MaxMinValues(max: json["max"], min: json["min"]);

  Map<String, dynamic> toMap() => {"max": max, "min": min};
}
