import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'secret_widget.dart' show SecretWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SecretModel extends FlutterFlowModel<SecretWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for foodName widget.
  FocusNode? foodNameFocusNode;
  TextEditingController? foodNameController;
  String? Function(BuildContext, String?)? foodNameControllerValidator;
  String? _foodNameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for calories widget.
  FocusNode? caloriesFocusNode;
  TextEditingController? caloriesController;
  String? Function(BuildContext, String?)? caloriesControllerValidator;
  String? _caloriesControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp('^[0-9]*').hasMatch(val)) {
      return 'Can only be numbers';
    }
    return null;
  }

  // State field(s) for carbs widget.
  FocusNode? carbsFocusNode;
  TextEditingController? carbsController;
  String? Function(BuildContext, String?)? carbsControllerValidator;
  String? _carbsControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp('^[0-9]\$').hasMatch(val)) {
      return 'Can only be numbers';
    }
    return null;
  }

  // State field(s) for protein widget.
  FocusNode? proteinFocusNode;
  TextEditingController? proteinController;
  String? Function(BuildContext, String?)? proteinControllerValidator;
  String? _proteinControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp('^[0-9]\$').hasMatch(val)) {
      return 'Can only be numbers';
    }
    return null;
  }

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    foodNameControllerValidator = _foodNameControllerValidator;
    caloriesControllerValidator = _caloriesControllerValidator;
    carbsControllerValidator = _carbsControllerValidator;
    proteinControllerValidator = _proteinControllerValidator;
  }

  void dispose() {
    unfocusNode.dispose();
    foodNameFocusNode?.dispose();
    foodNameController?.dispose();

    caloriesFocusNode?.dispose();
    caloriesController?.dispose();

    carbsFocusNode?.dispose();
    carbsController?.dispose();

    proteinFocusNode?.dispose();
    proteinController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
