import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'set_workout_goals_page_widget.dart' show SetWorkoutGoalsPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SetWorkoutGoalsPageModel
    extends FlutterFlowModel<SetWorkoutGoalsPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for mondayCheckbox widget.
  bool? mondayCheckboxValue;
  // State field(s) for tuesdayCheckbox widget.
  bool? tuesdayCheckboxValue;
  // State field(s) for wednesdayCheckbox widget.
  bool? wednesdayCheckboxValue;
  // State field(s) for thursdayCheckbox widget.
  bool? thursdayCheckboxValue;
  // State field(s) for fridayCheckbox widget.
  bool? fridayCheckboxValue;
  // State field(s) for saturdayCheckbox widget.
  bool? saturdayCheckboxValue;
  // State field(s) for sundayCheckbox widget.
  bool? sundayCheckboxValue;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
