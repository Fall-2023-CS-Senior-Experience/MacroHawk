import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/calender2_widget.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'calender_model.dart';
export 'calender_model.dart';

class CalenderWidget extends StatefulWidget {
  const CalenderWidget({
    Key? key,
    required this.tab,
  }) : super(key: key);

  final String? tab;

  @override
  _CalenderWidgetState createState() => _CalenderWidgetState();
}

class _CalenderWidgetState extends State<CalenderWidget> {
  late CalenderModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CalenderModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: MediaQuery.sizeOf(context).width * 1.0,
      height: MediaQuery.sizeOf(context).height * 1.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          FlutterFlowCalendar(
            color: FlutterFlowTheme.of(context).primary,
            iconColor: FlutterFlowTheme.of(context).secondaryText,
            weekFormat: false,
            weekStartsMonday: false,
            initialDate: getCurrentTimestamp,
            rowHeight: 64.0,
            onChange: (DateTimeRange? newSelectedDate) async {
              _model.calendarSelectedDay = newSelectedDate;
              if (widget.tab == 'day') {
                setState(() {
                  FFAppState().dayS = _model.calendarSelectedDay?.start;
                  FFAppState().dayE = _model.calendarSelectedDay?.end;
                });
              } else {
                if (widget.tab == 'week') {
                  setState(() {
                    FFAppState().weekS = _model.calendarSelectedDay?.start;
                  });
                } else {
                  setState(() {
                    FFAppState().monthS = _model.calendarSelectedDay?.start;
                  });
                }
              }

              setState(() {});
            },
            titleStyle: FlutterFlowTheme.of(context).headlineSmall,
            dayOfWeekStyle: FlutterFlowTheme.of(context).labelLarge,
            dateStyle: FlutterFlowTheme.of(context).bodyMedium,
            selectedDateStyle: FlutterFlowTheme.of(context).titleSmall,
            inactiveDateStyle: FlutterFlowTheme.of(context).labelMedium,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                'Start Date',
                style: FlutterFlowTheme.of(context).bodyMedium,
              ),
              Text(
                'Date Start\": ${_model.calendarSelectedDay?.start?.toString()}',
                style: FlutterFlowTheme.of(context).bodyMedium,
              ),
            ].divide(SizedBox(width: 30.0)).addToStart(SizedBox(width: 10.0)),
          ),
          Text(
            'End date: ${_model.calendarSelectedDay?.end?.toString()}',
            style: FlutterFlowTheme.of(context).bodyMedium,
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
            child: FFButtonWidget(
              onPressed: () async {
                if (widget.tab == 'day') {
                  _model.resultD = await queryNutritionsRecordOnce(
                    parent: FFAppState().userIdRef,
                    queryBuilder: (nutritionsRecord) => nutritionsRecord
                        .where(
                          'current_time',
                          isGreaterThanOrEqualTo: FFAppState().dayS,
                        )
                        .where(
                          'current_time',
                          isLessThanOrEqualTo: FFAppState().dayE,
                        ),
                  );
                  _model.updatePage(() {
                    FFAppState().kalDay =
                        functions.kcalSum(_model.resultD?.toList())! / 1000;
                    FFAppState().fatD =
                        functions.fatSum(_model.resultD?.toList())!;
                    FFAppState().carbD =
                        functions.carbSum(_model.resultD?.toList())!;
                    FFAppState().proteinD =
                        functions.proteinSum(_model.resultD?.toList())!;
                  });
                  _model.updatePage(() {
                    FFAppState().insertAtIndexInKalmacros(
                        0,
                        functions.progressBar(
                            FFAppState().kalDay, FFAppState().calorieGoal)!);
                    FFAppState().insertAtIndexInCarbsProgressBar(
                        0,
                        functions.progressBar(
                            FFAppState().carbD, FFAppState().carbGoal)!);
                    FFAppState().insertAtIndexInProteinProgressBar(
                        0,
                        functions.progressBar(
                            FFAppState().proteinD, FFAppState().proteinGoal)!);
                    FFAppState().insertAtIndexInFatProgressBar(
                        0,
                        functions.progressBar(
                            FFAppState().fatD, FFAppState().fatGoal)!);
                    FFAppState().insertAtIndexInOffsetKal(
                        0,
                        functions.progressBarOffset(
                            FFAppState().kalDay, FFAppState().calorieGoal)!);
                    FFAppState().insertAtIndexInOffsetProtein(
                        0,
                        functions.progressBarOffset(
                            FFAppState().proteinD, FFAppState().proteinGoal)!);
                    FFAppState().insertAtIndexInOffsetFat(
                        0,
                        functions.progressBarOffset(
                            FFAppState().fatD, FFAppState().fatGoal)!);
                    FFAppState().insertAtIndexInOffsetCarbs(
                        0,
                        functions.progressBarOffset(
                            FFAppState().carbD, FFAppState().carbGoal)!);
                  });
                  context.safePop();
                } else {
                  await showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    enableDrag: false,
                    context: context,
                    builder: (context) {
                      return Padding(
                        padding: MediaQuery.viewInsetsOf(context),
                        child: Calender2Widget(
                          tab: FFAppState().tab,
                        ),
                      );
                    },
                  ).then((value) => safeSetState(() {}));

                  Navigator.pop(context);
                }

                setState(() {});
              },
              text: 'Next',
              options: FFButtonOptions(
                height: 40.0,
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).primary,
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Readex Pro',
                      color: Colors.white,
                    ),
                elevation: 3.0,
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
