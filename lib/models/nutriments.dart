class Nutriments {
  /*
  "nutriments": {
            "carbohydrates_100g": 48,
            "carbohydrates_unit": "g",
            "carbohydrates_value": 48,
            "energy": 2351,
            "energy-kcal": 562,
            "energy-kcal_100g": 562,
            "energy-kcal_unit": "kcal",
            "energy-kcal_value": 562,
            "energy-kcal_value_computed": 551.39999961853,
            "energy_100g": 2351,
            "energy_unit": "kcal",
            "energy_value": 562,
            "fat": 37,
            "fat_100g": 37,
            "fat_unit": "g",
            "fat_value": 37,
            "nutrition-score-fr": 28,
            "nutrition-score-fr_100g": 28,
            "proteins": 6.5999999046326,
            "proteins_100g": 6.5999999046326,
            "proteins_unit": "g",
            "proteins_value": 6.5999999046326,
            "salt": 0.37000000476837,
            "salt_100g": 0.37000000476837,
            "salt_unit": "g",
            "salt_value": 0.37000000476837,
            "saturated-fat": 21,
            "saturated-fat_100g": 21,
            "saturated-fat_unit": "g",
            "saturated-fat_value": 21,
            "sodium": 0.148000001907348,
            "sodium_100g": 0.148000001907348,
            "sodium_unit": "g",
            "sodium_value": 0.148000001907348,
            "sugars": 47,
            "sugars_100g": 47,
            "sugars_unit": "g",
            "sugars_value": 47
        },
  */
  final double carbohydrates;
  final String carbohydratesUnit;
  final double energyKcal;
  final String energyKcalUnit;
  final double energyKcalValueComputed;
  final double energy;
  final String energyUnit;
  final double fat;
  final String fatUnit;
  final double nutritionScoreFr;
  final double proteins;
  final String proteinsUnit;
  final double salt;
  final String saltUnit;
  final double saturatedFat;
  final String saturatedFatUnit;
  final double sodium;
  final String sodiumUnit;
  final double sugars;
  final String sugarsUnit;

  Nutriments({
    required this.carbohydrates,
    required this.carbohydratesUnit,
    required this.energyKcal,
    required this.energyKcalUnit,
    required this.energyKcalValueComputed,
    required this.energy,
    required this.energyUnit,
    required this.fat,
    required this.fatUnit,
    required this.nutritionScoreFr,
    required this.proteins,
    required this.proteinsUnit,
    required this.salt,
    required this.saltUnit,
    required this.saturatedFat,
    required this.saturatedFatUnit,
    required this.sodium,
    required this.sodiumUnit,
    required this.sugars,
    required this.sugarsUnit,
  });

  factory Nutriments.fromJson(Map<String, dynamic> json) {
    return Nutriments(
      carbohydrates: json['carbohydrates_100g'].toDouble(),
      carbohydratesUnit: json['carbohydrates_unit'],
      energyKcal: json['energy-kcal_100g'].toDouble(),
      energyKcalUnit: json['energy-kcal_unit'],
      energyKcalValueComputed: json['energy-kcal_value_computed'].toDouble(),
      energy: json['energy_100g'].toDouble(),
      energyUnit: json['energy_unit'],
      fat: json['fat_100g'].toDouble(),
      fatUnit: json['fat_unit'],
      nutritionScoreFr: json['nutrition-score-fr_100g'].toDouble(),
      proteins: json['proteins_100g'].toDouble(),
      proteinsUnit: json['proteins_unit'],
      salt: json['salt_100g'].toDouble(),
      saltUnit: json['salt_unit'],
      saturatedFat: json['saturated-fat_100g'].toDouble(),
      saturatedFatUnit: json['saturated-fat_unit'],
      sodium: json['sodium_100g'].toDouble(),
      sodiumUnit: json['sodium_unit'],
      sugars: json['sugars_100g'].toDouble(),
      sugarsUnit: json['sugars_unit'],
    );
  }

  factory Nutriments.empty() {
    return Nutriments(
      carbohydrates: 0,
      carbohydratesUnit: '',
      energyKcal: 0,
      energyKcalUnit: '',
      energyKcalValueComputed: 0,
      energy: 0,
      energyUnit: '',
      fat: 0,
      fatUnit: '',
      nutritionScoreFr: 0,
      proteins: 0,
      proteinsUnit: '',
      salt: 0,
      saltUnit: '',
      saturatedFat: 0,
      saturatedFatUnit: '',
      sodium: 0,
      sodiumUnit: '',
      sugars: 0,
      sugarsUnit: '',
    );
  }
}
