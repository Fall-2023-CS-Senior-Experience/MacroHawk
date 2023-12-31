import '/backend/backend.dart';
import '/components/macrospop_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'snack_widget.dart' show SnackWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SnackModel extends FlutterFlowModel<SnackWidget> {
  ///  Local state fields for this page.

  DateTime? dinnerStart;

  DateTime? dinnerEnd;

  List<NutritionRecord> snackListname = [];
  void addToSnackListname(NutritionRecord item) => snackListname.add(item);
  void removeFromSnackListname(NutritionRecord item) =>
      snackListname.remove(item);
  void removeAtIndexFromSnackListname(int index) =>
      snackListname.removeAt(index);
  void insertAtIndexInSnackListname(int index, NutritionRecord item) =>
      snackListname.insert(index, item);
  void updateSnackListnameAtIndex(
          int index, Function(NutritionRecord) updateFn) =>
      snackListname[index] = updateFn(snackListname[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for foodinput widget.
  FocusNode? foodinputFocusNode;
  TextEditingController? foodinputController;
  String? Function(BuildContext, String?)? foodinputControllerValidator;
  // State field(s) for TextFieldBrand widget.
  FocusNode? textFieldBrandFocusNode;
  TextEditingController? textFieldBrandController;
  String? Function(BuildContext, String?)? textFieldBrandControllerValidator;
  // State field(s) for DropDownCat widget.
  String? dropDownCatValue;
  FormFieldController<String>? dropDownCatValueController;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    foodinputFocusNode?.dispose();
    foodinputController?.dispose();

    textFieldBrandFocusNode?.dispose();
    textFieldBrandController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
