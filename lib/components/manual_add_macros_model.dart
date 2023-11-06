import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'manual_add_macros_widget.dart' show ManualAddMacrosWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ManualAddMacrosModel extends FlutterFlowModel<ManualAddMacrosWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for foodName widget.
  FocusNode? foodNameFocusNode;
  TextEditingController? foodNameController;
  String? Function(BuildContext, String?)? foodNameControllerValidator;
  // State field(s) for calAdd widget.
  FocusNode? calAddFocusNode;
  TextEditingController? calAddController;
  String? Function(BuildContext, String?)? calAddControllerValidator;
  // State field(s) for fatAdd widget.
  FocusNode? fatAddFocusNode;
  TextEditingController? fatAddController;
  String? Function(BuildContext, String?)? fatAddControllerValidator;
  // State field(s) for proAdd widget.
  FocusNode? proAddFocusNode;
  TextEditingController? proAddController;
  String? Function(BuildContext, String?)? proAddControllerValidator;
  // State field(s) for carAdd widget.
  FocusNode? carAddFocusNode;
  TextEditingController? carAddController;
  String? Function(BuildContext, String?)? carAddControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    foodNameFocusNode?.dispose();
    foodNameController?.dispose();

    calAddFocusNode?.dispose();
    calAddController?.dispose();

    fatAddFocusNode?.dispose();
    fatAddController?.dispose();

    proAddFocusNode?.dispose();
    proAddController?.dispose();

    carAddFocusNode?.dispose();
    carAddController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
