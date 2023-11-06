import '/components/calender2_widget.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
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
                valueOrDefault<String>(
                  dateTimeFormat('yMMMd', FFAppState().dateStart),
                  'date',
                ),
                style: FlutterFlowTheme.of(context).bodyMedium,
              ),
            ].divide(SizedBox(width: 30.0)).addToStart(SizedBox(width: 10.0)),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
            child: FFButtonWidget(
              onPressed: () async {
                if (widget.tab == 'day') {
                  Navigator.pop(context);
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
