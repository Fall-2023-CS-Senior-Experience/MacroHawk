import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

double? newCustomFunction(NutritionsRecord? macros) {
  // query subcollection nutritions sum calories string
  double? sumCalories = 0.0;
  if (macros != null) {
    String output = macros.calories;
    sumCalories += double.parse(output);
  }
  return sumCalories;
}

double? carbSum(List<NutritionsRecord>? macros) {
  // query nutrition collection documents list and sum carbs
  double totalCarbs = 0;
  String output;
  if (macros != null) {
    for (final nutritions in macros) {
      output = nutritions.carbs;
      totalCarbs += double.parse(output);
    }
  }
  return totalCarbs;
}

double? kcalSum(List<NutritionsRecord>? macros) {
  // query nutrition collection documents list and sum calories
  double totalCalories = 0;
  String output;
  if (macros != null) {
    for (final nutrition in macros) {
      output = nutrition.calories;
      totalCalories += double.parse(output);
    }
  }
  return totalCalories;
}

double? proteinSum(List<NutritionsRecord>? macros) {
  // query nutrition collection documents list and sum calories
  double totalProtein = 0;
  String output;
  if (macros != null) {
    for (final nutritions in macros) {
      output = nutritions.proteins;
      totalProtein += double.parse(output);
    }
  }
  return totalProtein;
}

double? fatSum(List<NutritionsRecord>? macros) {
  // query nutrition collection documents list and sum calories
  double totalFats = 0;
  String output;
  if (macros != null) {
    for (final nutritions in macros) {
      output = nutritions.fats;
      totalFats += double.parse(output);
    }
  }
  return totalFats;
}

int? sumIntKal(NutritionsRecord? macros) {
  // query nutrition collection documents list and sum calories
  int totalCalories = 0;
  String output;
  if (macros != null) {
    output = macros.calories;
    totalCalories += int.parse(output);
  }
  return totalCalories;
}

double? progressBarOffset(
  double? actualNum,
  int? goalNum,
) {
  // if percent greater than 100 return offset
  if (actualNum == null || goalNum == null || goalNum == 0) {
    return null;
  }
  double percent = (actualNum / goalNum);
  double offset = 0.0;
  if (percent > 1) {
    offset = (actualNum - goalNum) / goalNum;
    return offset;
  } else {
    return 0;
  }
}

double? progressBar(
  double? actual,
  int? goal,
) {
  //  actual divide by goal to get fraction if greater than 1 return 1 else return 0

  if (actual == null || goal == null || goal == 0) {
    return null;
  }
  double fraction = actual / goal;
  if (fraction > 1) {
    return 1;
  } else {
    return fraction;
  }
}

String? quanityFood(
  String? foodMacro,
  String? quanity,
) {
  // product of foodMacro and quanity return string
  if (foodMacro == null || quanity == null) {
    return null;
  }
  double macro = double.parse(foodMacro);
  double qty = double.parse(quanity);
  if (macro == null || qty == null) {
    return null;
  }
  double result = macro * qty;
  return result.toStringAsFixed(2);
}
