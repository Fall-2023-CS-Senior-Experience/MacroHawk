import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'set_nutri_goals_page_widget.dart' show SetNutriGoalsPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SetNutriGoalsPageModel extends FlutterFlowModel<SetNutriGoalsPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for calorieGoalField widget.
  FocusNode? calorieGoalFieldFocusNode;
  TextEditingController? calorieGoalFieldController;
  String? Function(BuildContext, String?)? calorieGoalFieldControllerValidator;
  // State field(s) for fatGoalField widget.
  FocusNode? fatGoalFieldFocusNode;
  TextEditingController? fatGoalFieldController;
  String? Function(BuildContext, String?)? fatGoalFieldControllerValidator;
  // State field(s) for carbGoalField widget.
  FocusNode? carbGoalFieldFocusNode;
  TextEditingController? carbGoalFieldController;
  String? Function(BuildContext, String?)? carbGoalFieldControllerValidator;
  // State field(s) for proteinGoalField widget.
  FocusNode? proteinGoalFieldFocusNode;
  TextEditingController? proteinGoalFieldController;
  String? Function(BuildContext, String?)? proteinGoalFieldControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    calorieGoalFieldFocusNode?.dispose();
    calorieGoalFieldController?.dispose();

    fatGoalFieldFocusNode?.dispose();
    fatGoalFieldController?.dispose();

    carbGoalFieldFocusNode?.dispose();
    carbGoalFieldController?.dispose();

    proteinGoalFieldFocusNode?.dispose();
    proteinGoalFieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
