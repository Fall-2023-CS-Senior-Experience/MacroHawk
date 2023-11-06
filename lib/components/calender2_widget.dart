import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
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
                  dateTimeFormat('yMMMd', FFAppState().dateStart),
                  'date',
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
                  dateTimeFormat('yMMMd', FFAppState().dateEnd),
                  'date',
                ),
                style: FlutterFlowTheme.of(context).bodyMedium,
              ),
            ].divide(SizedBox(width: 30.0)).addToStart(SizedBox(width: 10.0)),
          ),
          FFButtonWidget(
            onPressed: () async {
              Navigator.pop(context);
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
