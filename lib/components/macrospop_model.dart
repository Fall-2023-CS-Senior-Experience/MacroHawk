import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'macrospop_widget.dart' show MacrospopWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MacrospopModel extends FlutterFlowModel<MacrospopWidget> {
  ///  Local state fields for this component.

  String? foodpic;

  ///  State fields for stateful widgets in this component.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for quanity widget.
  FocusNode? quanityFocusNode;
  TextEditingController? quanityController;
  String? Function(BuildContext, String?)? quanityControllerValidator;
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
    quanityFocusNode?.dispose();
    quanityController?.dispose();

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
