import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
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
import 'calender2_model.dart';
export 'calender2_model.dart';

class Calender2Widget extends StatefulWidget {
  const Calender2Widget({
    Key? key,
    required this.tab,
  }) : super(key: key);

  final String? tab;

  @override
  _Calender2WidgetState createState() => _Calender2WidgetState();
}

class _Calender2WidgetState extends State<Calender2Widget> {
  late Calender2Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Calender2Model());

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
              if (widget.tab == 'week') {
                setState(() {
                  FFAppState().weekE = _model.calendarSelectedDay?.end;
                });
              } else {
                setState(() {
                  FFAppState().monthE = _model.calendarSelectedDay?.end;
                });
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
                valueOrDefault<String>(
                  widget.tab == 'week'
                      ? valueOrDefault<String>(
                          dateTimeFormat('yMMMd', FFAppState().weekS),
                          'date start',
                        )
                      : valueOrDefault<String>(
                          dateTimeFormat('yMMMd', FFAppState().monthS),
                          'end',
                        ),
                  'end date',
                ),
                style: FlutterFlowTheme.of(context).bodyMedium,
              ),
            ].divide(SizedBox(width: 30.0)).addToStart(SizedBox(width: 10.0)),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                'End Date',
                style: FlutterFlowTheme.of(context).bodyMedium,
              ),
              Text(
                valueOrDefault<String>(
                  widget.tab == 'week'
                      ? valueOrDefault<String>(
                          dateTimeFormat('yMMMd', FFAppState().weekE),
                          'start',
                        )
                      : dateTimeFormat('yMMMd', FFAppState().monthE),
                  'end date',
                ),
                style: FlutterFlowTheme.of(context).bodyMedium,
              ),
            ].divide(SizedBox(width: 30.0)).addToStart(SizedBox(width: 10.0)),
          ),
          FFButtonWidget(
            onPressed: () async {
              if (widget.tab == 'week') {
                _model.resultW = await queryNutritionsRecordOnce(
                  parent: FFAppState().userIdRef,
                  queryBuilder: (nutritionsRecord) => nutritionsRecord
                      .where(
                        'current_time',
                        isGreaterThanOrEqualTo: FFAppState().weekS,
                      )
                      .where(
                        'current_time',
                        isLessThanOrEqualTo: FFAppState().weekE,
                      ),
                );
                _model.updatePage(() {
                  FFAppState().kcalW =
                      functions.kcalSum(_model.resultW?.toList())! / 1000;
                  FFAppState().fatW =
                      functions.fatSum(_model.resultW?.toList())!;
                  FFAppState().proteinW =
                      functions.proteinSum(_model.resultW?.toList())!;
                  FFAppState().carbW =
                      functions.carbSum(_model.resultW?.toList())!;
                });
                _model.updatePage(() {
                  FFAppState().insertAtIndexInKalmacros(
                      1,
                      functions.progressBar(
                          FFAppState().kcalW, FFAppState().calorieGoal)!);
                  FFAppState().insertAtIndexInCarbsProgressBar(
                      1,
                      functions.progressBar(
                          FFAppState().carbW, FFAppState().carbGoal)!);
                  FFAppState().insertAtIndexInProteinProgressBar(
                      1,
                      functions.progressBar(
                          FFAppState().proteinW, FFAppState().proteinGoal)!);
                  FFAppState().insertAtIndexInFatProgressBar(
                      1,
                      functions.progressBar(
                          FFAppState().fatW, FFAppState().fatGoal)!);
                  FFAppState().insertAtIndexInOffsetKal(
                      1,
                      functions.progressBarOffset(
                          FFAppState().kcalW, FFAppState().calorieGoal)!);
                  FFAppState().insertAtIndexInOffsetProtein(
                      1,
                      functions.progressBarOffset(
                          FFAppState().proteinW, FFAppState().proteinGoal)!);
                  FFAppState().insertAtIndexInOffsetFat(
                      1,
                      functions.progressBarOffset(
                          FFAppState().fatW, FFAppState().fatGoal)!);
                  FFAppState().insertAtIndexInOffsetCarbs(
                      1,
                      functions.progressBarOffset(
                          FFAppState().carbW, FFAppState().carbGoal)!);
                });
              } else {
                _model.resultM = await queryNutritionsRecordOnce(
                  parent: FFAppState().userIdRef,
                  queryBuilder: (nutritionsRecord) => nutritionsRecord
                      .where(
                        'current_time',
                        isGreaterThanOrEqualTo: FFAppState().monthS,
                      )
                      .where(
                        'current_time',
                        isLessThanOrEqualTo: FFAppState().monthE,
                      ),
                );
                _model.updatePage(() {
                  FFAppState().kalM =
                      functions.kcalSum(_model.resultM?.toList())! / 1000;
                  FFAppState().proteinM =
                      functions.proteinSum(_model.resultM?.toList())!;
                  FFAppState().fatM =
                      functions.fatSum(_model.resultM?.toList())!;
                  FFAppState().carbM =
                      functions.carbSum(_model.resultM?.toList())!;
                });
                _model.updatePage(() {
                  FFAppState().insertAtIndexInKalmacros(
                      2,
                      functions.progressBar(
                          FFAppState().kalM, FFAppState().calorieGoal)!);
                  FFAppState().insertAtIndexInCarbsProgressBar(
                      2,
                      functions.progressBar(
                          FFAppState().carbM, FFAppState().carbGoal)!);
                  FFAppState().insertAtIndexInProteinProgressBar(
                      2,
                      functions.progressBar(
                          FFAppState().proteinM, FFAppState().proteinGoal)!);
                  FFAppState().insertAtIndexInFatProgressBar(
                      2,
                      functions.progressBar(
                          FFAppState().fatM, FFAppState().fatGoal)!);
                  FFAppState().insertAtIndexInOffsetKal(
                      2,
                      functions.progressBarOffset(
                          FFAppState().kalM, FFAppState().calorieGoal)!);
                  FFAppState().insertAtIndexInOffsetProtein(
                      2,
                      functions.progressBarOffset(
                          FFAppState().proteinM, FFAppState().proteinGoal)!);
                  FFAppState().insertAtIndexInOffsetFat(
                      2,
                      functions.progressBarOffset(
                          FFAppState().fatM, FFAppState().fatGoal)!);
                  FFAppState().insertAtIndexInOffsetCarbs(
                      2,
                      functions.progressBarOffset(
                          FFAppState().carbM, FFAppState().carbGoal)!);
                });
              }

              context.pushNamed('Macros');

              setState(() {});
            },
            text: 'Done',
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
        ],
      ),
    );
  }
}
