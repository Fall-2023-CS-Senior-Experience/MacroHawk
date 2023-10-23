import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'history_test_widget.dart' show HistoryTestWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HistoryTestModel extends FlutterFlowModel<HistoryTestWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in historyTest widget.
  int? logCount;
  // Stores action output result for [Firestore Query - Query a collection] action in historyTest widget.
  UserMacroLogRecord? references;
  // Stores action output result for [Backend Call - Read Document] action in historyTest widget.
  NutritionRecord? nutritionDoc;
  // State field(s) for resultName widget.
  FocusNode? resultNameFocusNode;
  TextEditingController? resultNameController;
  String? Function(BuildContext, String?)? resultNameControllerValidator;
  // State field(s) for resultCalories widget.
  FocusNode? resultCaloriesFocusNode;
  TextEditingController? resultCaloriesController;
  String? Function(BuildContext, String?)? resultCaloriesControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    resultNameFocusNode?.dispose();
    resultNameController?.dispose();

    resultCaloriesFocusNode?.dispose();
    resultCaloriesController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
