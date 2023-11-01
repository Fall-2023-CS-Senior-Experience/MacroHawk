import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'change_goals_widget.dart' show ChangeGoalsWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChangeGoalsModel extends FlutterFlowModel<ChangeGoalsWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for calorieField widget.
  FocusNode? calorieFieldFocusNode;
  TextEditingController? calorieFieldController;
  String? Function(BuildContext, String?)? calorieFieldControllerValidator;
  // State field(s) for fatField widget.
  FocusNode? fatFieldFocusNode;
  TextEditingController? fatFieldController;
  String? Function(BuildContext, String?)? fatFieldControllerValidator;
  // State field(s) for proteinField widget.
  FocusNode? proteinFieldFocusNode;
  TextEditingController? proteinFieldController;
  String? Function(BuildContext, String?)? proteinFieldControllerValidator;
  // State field(s) for carbField widget.
  FocusNode? carbFieldFocusNode;
  TextEditingController? carbFieldController;
  String? Function(BuildContext, String?)? carbFieldControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    calorieFieldFocusNode?.dispose();
    calorieFieldController?.dispose();

    fatFieldFocusNode?.dispose();
    fatFieldController?.dispose();

    proteinFieldFocusNode?.dispose();
    proteinFieldController?.dispose();

    carbFieldFocusNode?.dispose();
    carbFieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
