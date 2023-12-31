import '/components/workout_select_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'workout_plans_widget.dart' show WorkoutPlansWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class WorkoutPlansModel extends FlutterFlowModel<WorkoutPlansWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for WorkoutSelect component.
  late WorkoutSelectModel workoutSelectModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    workoutSelectModel = createModel(context, () => WorkoutSelectModel());
  }

  void dispose() {
    unfocusNode.dispose();
    workoutSelectModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
