import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/errormessage_widget.dart';
import '/components/macrosmanual_widget.dart';
import '/components/select_food_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'snack_widget.dart' show SnackWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SnackModel extends FlutterFlowModel<SnackWidget> {
  ///  Local state fields for this page.

  DateTime? dinnerStart;

  DateTime? dinnerEnd;

  List<NutritionsRecord> snackListname = [];
  void addToSnackListname(NutritionsRecord item) => snackListname.add(item);
  void removeFromSnackListname(NutritionsRecord item) =>
      snackListname.remove(item);
  void removeAtIndexFromSnackListname(int index) =>
      snackListname.removeAt(index);
  void insertAtIndexInSnackListname(int index, NutritionsRecord item) =>
      snackListname.insert(index, item);
  void updateSnackListnameAtIndex(
          int index, Function(NutritionsRecord) updateFn) =>
      snackListname[index] = updateFn(snackListname[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in Snack widget.
  List<NutritionsRecord>? snackresult;
  // Stores action output result for [Firestore Query - Query a collection] action in Snack widget.
  List<NutritionsRecord>? snackresultW;
  // Stores action output result for [Firestore Query - Query a collection] action in Snack widget.
  List<NutritionsRecord>? snackresultM;
  // State field(s) for foodinput widget.
  FocusNode? foodinputFocusNode;
  TextEditingController? foodinputController;
  String? Function(BuildContext, String?)? foodinputControllerValidator;
  // Stores action output result for [Backend Call - API (Macros)] action in foodinput widget.
  ApiCallResponse? testapi;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    foodinputFocusNode?.dispose();
    foodinputController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
