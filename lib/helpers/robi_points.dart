import 'dart:math';

import 'package:robi_points_weightlifting/enums/genre.dart';

class RobiPoints {

  RobiPoints();

  static double b = 3.321928095;

  List<double> aMale = [
    0.000006386209266, //Men - 55 kg
    0.000005183197783, //Men - 61 kg
    0.000004259048574, //Men - 67 kg
    0.000003606255594, //Men - 73 kg
    0.000002995284257, //Men - 81 kg
    0.0000025340212, //Men - 89 kg
    0.000002251860969, //Men - 96 kg
    0.000002058256392, //Men - 102 kg
    0.000001871024806, //Men - 109 kg
    0.000001501871444 //Men - +109 kg
  ];

  List<double> aFemale = [
    0.00002645886266, //Women - 45 kg
    0.00002161046356, //Women - 49 kg
    0.00001629661631, //Women - 55 kg
    0.00001386816515, //Women - 59 kg
    0.00001157076467, //Women - 64 kg
    0.00000937764965, //Women - 71 kg
    0.000008175929892, //Women - 76 kg
    0.000007167071831, //Women - 81 kg
    0.000006314335523, //Women - 87 kg
    0.000004765098749 //Women - +87 kg
  ];

  double calculate(String genre, int i, double total) {
    double rPoints;
    if (genre == GenreCharacter.male.toString())
      rPoints = aMale[i - 1] * pow(total, b);
    else if (genre == GenreCharacter.female.toString())
      rPoints = aFemale[i - 1] * pow(total, b);
    else
      rPoints = 0.0;

    return double.parse(rPoints.toStringAsFixed(2));
  }
}
