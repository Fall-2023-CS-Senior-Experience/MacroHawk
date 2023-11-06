import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'macrospop_local_widget.dart' show MacrospopLocalWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MacrospopLocalModel extends FlutterFlowModel<MacrospopLocalWidget> {
  ///  Local state fields for this component.

  String? foodpic;

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextFieldName widget.
  FocusNode? textFieldNameFocusNode;
  TextEditingController? textFieldNameController;
  String? Function(BuildContext, String?)? textFieldNameControllerValidator;
  // State field(s) for TextFieldCal widget.
  FocusNode? textFieldCalFocusNode;
  TextEditingController? textFieldCalController;
  String? Function(BuildContext, String?)? textFieldCalControllerValidator;
  // State field(s) for TextFieldPro widget.
  FocusNode? textFieldProFocusNode;
  TextEditingController? textFieldProController;
  String? Function(BuildContext, String?)? textFieldProControllerValidator;
  // State field(s) for TextFieldFat widget.
  FocusNode? textFieldFatFocusNode;
  TextEditingController? textFieldFatController;
  String? Function(BuildContext, String?)? textFieldFatControllerValidator;
  // State field(s) for TextFieldCarb widget.
  FocusNode? textFieldCarbFocusNode;
  TextEditingController? textFieldCarbController;
  String? Function(BuildContext, String?)? textFieldCarbControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    textFieldNameFocusNode?.dispose();
    textFieldNameController?.dispose();

    textFieldCalFocusNode?.dispose();
    textFieldCalController?.dispose();

    textFieldProFocusNode?.dispose();
    textFieldProController?.dispose();

    textFieldFatFocusNode?.dispose();
    textFieldFatController?.dispose();

    textFieldCarbFocusNode?.dispose();
    textFieldCarbController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
