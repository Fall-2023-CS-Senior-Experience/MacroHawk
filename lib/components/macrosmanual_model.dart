import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/actions/index.dart' as actions;
import 'macrosmanual_widget.dart' show MacrosmanualWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MacrosmanualModel extends FlutterFlowModel<MacrosmanualWidget> {
  ///  Local state fields for this component.

  String kal = '';

  String? foodpic;

  ///  State fields for stateful widgets in this component.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

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
  // State field(s) for quanity widget.
  FocusNode? quanityFocusNode;
  TextEditingController? quanityController;
  String? Function(BuildContext, String?)? quanityControllerValidator;
  // State field(s) for measure widget.
  FocusNode? measureFocusNode;
  TextEditingController? measureController;
  String? Function(BuildContext, String?)? measureControllerValidator;
  // Stores action output result for [Custom Action - isConnected] action in Button widget.
  bool? isConnected;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  UsersNamesRecord? getUserId;

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

    quanityFocusNode?.dispose();
    quanityController?.dispose();

    measureFocusNode?.dispose();
    measureController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
