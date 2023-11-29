import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'workout_select_widget.dart' show WorkoutSelectWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class WorkoutSelectModel extends FlutterFlowModel<WorkoutSelectWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TypeofWorkout widget.
  String? typeofWorkoutValue;
  FormFieldController<String>? typeofWorkoutValueController;
  // State field(s) for dropMuscle widget.
  String? dropMuscleValue;
  FormFieldController<String>? dropMuscleValueController;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
