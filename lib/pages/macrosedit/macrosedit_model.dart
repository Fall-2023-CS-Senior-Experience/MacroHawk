import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/calender_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'macrosedit_widget.dart' show MacroseditWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class MacroseditModel extends FlutterFlowModel<MacroseditWidget> {
  ///  Local state fields for this page.

  double? kcalD = 0.0;

  double? proteinD = 0.0;

  double? fatD = 0.0;

  double? carbD = 0.0;

  double? kcalW = 0.0;

  double? proteinW = 0.0;

  double? fatW = 0.0;

  double? carbW = 0.0;

  int? count = 0;

  int? countmax = 3;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in Macrosedit widget.
  UsersNamesRecord? checkuserId;
  // Stores action output result for [Firestore Query - Query a collection] action in Macrosedit widget.
  List<NutritionsRecord>? resultD;
  // Stores action output result for [Firestore Query - Query a collection] action in Macrosedit widget.
  List<NutritionsRecord>? resultW;
  // Stores action output result for [Firestore Query - Query a collection] action in Macrosedit widget.
  List<NutritionsRecord>? resultM;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
