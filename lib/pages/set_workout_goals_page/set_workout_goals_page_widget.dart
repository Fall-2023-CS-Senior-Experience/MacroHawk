import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'set_workout_goals_page_model.dart';
export 'set_workout_goals_page_model.dart';

class SetWorkoutGoalsPageWidget extends StatefulWidget {
  const SetWorkoutGoalsPageWidget({Key? key}) : super(key: key);

  @override
  _SetWorkoutGoalsPageWidgetState createState() =>
      _SetWorkoutGoalsPageWidgetState();
}

class _SetWorkoutGoalsPageWidgetState extends State<SetWorkoutGoalsPageWidget> {
  late SetWorkoutGoalsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SetWorkoutGoalsPageModel());

    if (!isWeb) {
      _keyboardVisibilitySubscription =
          KeyboardVisibilityController().onChange.listen((bool visible) {
        setState(() {
          _isKeyboardVisible = visible;
        });
      });
    }

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    if (!isWeb) {
      _keyboardVisibilitySubscription.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          actions: [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Align(
            alignment: AlignmentDirectional(0.00, 0.00),
            child: Container(
              width: double.infinity,
              constraints: BoxConstraints(
                maxWidth: 670.0,
              ),
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 32.0, 0.0, 8.0),
                                  child: Text(
                                    'Almost Done!',
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .displayMedium,
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 0.0, 8.0),
                              child: Text(
                                'Let\'s set your workouts goals.',
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.of(context)
                                    .displayMedium
                                    .override(
                                      fontFamily: 'Outfit',
                                      fontSize: 32.0,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 0.0, 8.0),
                              child: Text(
                                'Which days will you workout?',
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.of(context)
                                    .displayMedium
                                    .override(
                                      fontFamily: 'Outfit',
                                      fontSize: 20.0,
                                    ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: MediaQuery.sizeOf(context).height * 0.4,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Theme(
                                    data: ThemeData(
                                      checkboxTheme: CheckboxThemeData(
                                        visualDensity: VisualDensity.compact,
                                        materialTapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                      ),
                                      unselectedWidgetColor:
                                          FlutterFlowTheme.of(context)
                                              .secondaryText,
                                    ),
                                    child: CheckboxListTile(
                                      value: _model.mondayCheckboxValue ??=
                                          false,
                                      onChanged: (newValue) async {
                                        setState(() => _model
                                            .mondayCheckboxValue = newValue!);
                                        if (newValue!) {
                                          FFAppState()
                                              .addToWorkoutDaysGoal('Monday');
                                        }
                                      },
                                      title: Text(
                                        'Monday',
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge,
                                      ),
                                      tileColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      activeColor:
                                          FlutterFlowTheme.of(context).primary,
                                      checkColor:
                                          FlutterFlowTheme.of(context).info,
                                      dense: false,
                                      controlAffinity:
                                          ListTileControlAffinity.trailing,
                                    ),
                                  ),
                                  Theme(
                                    data: ThemeData(
                                      checkboxTheme: CheckboxThemeData(
                                        visualDensity: VisualDensity.compact,
                                        materialTapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                      ),
                                      unselectedWidgetColor:
                                          FlutterFlowTheme.of(context)
                                              .secondaryText,
                                    ),
                                    child: CheckboxListTile(
                                      value: _model.tuesdayCheckboxValue ??=
                                          false,
                                      onChanged: (newValue) async {
                                        setState(() => _model
                                            .tuesdayCheckboxValue = newValue!);
                                        if (newValue!) {
                                          FFAppState()
                                              .addToWorkoutDaysGoal('Tuesday');
                                        }
                                      },
                                      title: Text(
                                        'Tuesday',
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge,
                                      ),
                                      tileColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      activeColor:
                                          FlutterFlowTheme.of(context).primary,
                                      checkColor:
                                          FlutterFlowTheme.of(context).info,
                                      dense: false,
                                      controlAffinity:
                                          ListTileControlAffinity.trailing,
                                    ),
                                  ),
                                  Theme(
                                    data: ThemeData(
                                      checkboxTheme: CheckboxThemeData(
                                        visualDensity: VisualDensity.compact,
                                        materialTapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                      ),
                                      unselectedWidgetColor:
                                          FlutterFlowTheme.of(context)
                                              .secondaryText,
                                    ),
                                    child: CheckboxListTile(
                                      value: _model.wednesdayCheckboxValue ??=
                                          false,
                                      onChanged: (newValue) async {
                                        setState(() =>
                                            _model.wednesdayCheckboxValue =
                                                newValue!);
                                        if (newValue!) {
                                          FFAppState().addToWorkoutDaysGoal(
                                              'Wednesday');
                                        }
                                      },
                                      title: Text(
                                        'Wednesday',
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge,
                                      ),
                                      tileColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      activeColor:
                                          FlutterFlowTheme.of(context).primary,
                                      checkColor:
                                          FlutterFlowTheme.of(context).info,
                                      dense: false,
                                      controlAffinity:
                                          ListTileControlAffinity.trailing,
                                    ),
                                  ),
                                  Theme(
                                    data: ThemeData(
                                      checkboxTheme: CheckboxThemeData(
                                        visualDensity: VisualDensity.compact,
                                        materialTapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                      ),
                                      unselectedWidgetColor:
                                          FlutterFlowTheme.of(context)
                                              .secondaryText,
                                    ),
                                    child: CheckboxListTile(
                                      value: _model.thursdayCheckboxValue ??=
                                          false,
                                      onChanged: (newValue) async {
                                        setState(() => _model
                                            .thursdayCheckboxValue = newValue!);
                                        if (newValue!) {
                                          FFAppState()
                                              .addToWorkoutDaysGoal('Thursday');
                                        }
                                      },
                                      title: Text(
                                        'Thursday',
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge,
                                      ),
                                      tileColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      activeColor:
                                          FlutterFlowTheme.of(context).primary,
                                      checkColor:
                                          FlutterFlowTheme.of(context).info,
                                      dense: false,
                                      controlAffinity:
                                          ListTileControlAffinity.trailing,
                                    ),
                                  ),
                                  Theme(
                                    data: ThemeData(
                                      checkboxTheme: CheckboxThemeData(
                                        visualDensity: VisualDensity.compact,
                                        materialTapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                      ),
                                      unselectedWidgetColor:
                                          FlutterFlowTheme.of(context)
                                              .secondaryText,
                                    ),
                                    child: CheckboxListTile(
                                      value: _model.fridayCheckboxValue ??=
                                          false,
                                      onChanged: (newValue) async {
                                        setState(() => _model
                                            .fridayCheckboxValue = newValue!);
                                        if (newValue!) {
                                          FFAppState()
                                              .addToWorkoutDaysGoal('Friday');
                                        }
                                      },
                                      title: Text(
                                        'Friday',
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge,
                                      ),
                                      tileColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      activeColor:
                                          FlutterFlowTheme.of(context).primary,
                                      checkColor:
                                          FlutterFlowTheme.of(context).info,
                                      dense: false,
                                      controlAffinity:
                                          ListTileControlAffinity.trailing,
                                    ),
                                  ),
                                  Theme(
                                    data: ThemeData(
                                      checkboxTheme: CheckboxThemeData(
                                        visualDensity: VisualDensity.compact,
                                        materialTapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                      ),
                                      unselectedWidgetColor:
                                          FlutterFlowTheme.of(context)
                                              .secondaryText,
                                    ),
                                    child: CheckboxListTile(
                                      value: _model.saturdayCheckboxValue ??=
                                          false,
                                      onChanged: (newValue) async {
                                        setState(() => _model
                                            .saturdayCheckboxValue = newValue!);
                                        if (newValue!) {
                                          FFAppState()
                                              .addToWorkoutDaysGoal('Saturday');
                                        }
                                      },
                                      title: Text(
                                        'Saturday',
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge,
                                      ),
                                      tileColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      activeColor:
                                          FlutterFlowTheme.of(context).primary,
                                      checkColor:
                                          FlutterFlowTheme.of(context).info,
                                      dense: false,
                                      controlAffinity:
                                          ListTileControlAffinity.trailing,
                                    ),
                                  ),
                                  Theme(
                                    data: ThemeData(
                                      checkboxTheme: CheckboxThemeData(
                                        visualDensity: VisualDensity.compact,
                                        materialTapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                      ),
                                      unselectedWidgetColor:
                                          FlutterFlowTheme.of(context)
                                              .secondaryText,
                                    ),
                                    child: CheckboxListTile(
                                      value: _model.sundayCheckboxValue ??=
                                          false,
                                      onChanged: (newValue) async {
                                        setState(() => _model
                                            .sundayCheckboxValue = newValue!);
                                        if (newValue!) {
                                          FFAppState()
                                              .addToWorkoutDaysGoal('Sunday');
                                        }
                                      },
                                      title: Text(
                                        'Sunday',
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge,
                                      ),
                                      tileColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      activeColor:
                                          FlutterFlowTheme.of(context).primary,
                                      checkColor:
                                          FlutterFlowTheme.of(context).info,
                                      dense: false,
                                      controlAffinity:
                                          ListTileControlAffinity.trailing,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  if (!(isWeb
                      ? MediaQuery.viewInsetsOf(context).bottom > 0
                      : _isKeyboardVisible))
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          16.0, 12.0, 16.0, 24.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          context.pushNamed('Home');
                        },
                        text: 'Next',
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 60.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primaryText,
                          textStyle:
                              FlutterFlowTheme.of(context).titleMedium.override(
                                    fontFamily: 'Readex Pro',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                          elevation: 4.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(50.0),
                          hoverColor: FlutterFlowTheme.of(context).primaryText,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
