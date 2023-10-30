import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/change_goals_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'goals_widget.dart' show GoalsWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class GoalsModel extends FlutterFlowModel<GoalsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for mondaySelect widget.
  bool? mondaySelectValue;
  // State field(s) for tuesdaySelect widget.
  bool? tuesdaySelectValue;
  // State field(s) for wednesdaySelect widget.
  bool? wednesdaySelectValue;
  // State field(s) for thursdaySelect widget.
  bool? thursdaySelectValue;
  // State field(s) for fridaySelect widget.
  bool? fridaySelectValue;
  // State field(s) for saturdaySelect widget.
  bool? saturdaySelectValue;
  // State field(s) for sundaySelect widget.
  bool? sundaySelectValue;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
