import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/calender_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'macros_model.dart';
export 'macros_model.dart';

class MacrosWidget extends StatefulWidget {
  const MacrosWidget({Key? key}) : super(key: key);

  @override
  _MacrosWidgetState createState() => _MacrosWidgetState();
}

class _MacrosWidgetState extends State<MacrosWidget>
    with TickerProviderStateMixin {
  late MacrosModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MacrosModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.querymacros = await queryNutritionRecordOnce(
        queryBuilder: (nutritionRecord) => nutritionRecord
            .where(
              'current_time',
              isLessThanOrEqualTo: FFAppState().dayE,
            )
            .where(
              'current_time',
              isGreaterThanOrEqualTo: FFAppState().dayS,
            ),
      );
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: true,
          leading: FlutterFlowIconButton(
            borderColor: FlutterFlowTheme.of(context).primary,
            borderRadius: 20.0,
            borderWidth: 1.0,
            buttonSize: 40.0,
            fillColor: FlutterFlowTheme.of(context).accent1,
            icon: Icon(
              Icons.arrow_back,
              color: FlutterFlowTheme.of(context).lineColor,
              size: 30.0,
            ),
            onPressed: () async {
              context.pushNamed('Home');
            },
          ),
          title: Align(
            alignment: AlignmentDirectional(0.00, 0.00),
            child: Text(
              'Macros',
              style: FlutterFlowTheme.of(context).titleMedium,
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.pushNamed('Profile');
                },
                child: Container(
                  width: 100.0,
                  height: 100.0,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.network(
                    'https://picsum.photos/seed/671/600',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
          centerTitle: true,
          elevation: 4.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: MediaQuery.sizeOf(context).height * 0.35,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      if (_model.tabBarCurrentIndex.toString() == '0') {
                        setState(() {
                          FFAppState().tabindexMacros = 'day';
                        });
                      } else {
                        if (_model.tabBarCurrentIndex.toString() == '1') {
                          setState(() {
                            FFAppState().tabindexMacros = 'week';
                          });
                        } else {
                          setState(() {
                            FFAppState().tabindexMacros = 'month';
                          });
                        }
                      }
                    },
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment(0.0, 0),
                          child: TabBar(
                            labelColor:
                                FlutterFlowTheme.of(context).primaryText,
                            unselectedLabelColor:
                                FlutterFlowTheme.of(context).secondaryText,
                            labelStyle:
                                FlutterFlowTheme.of(context).titleMedium,
                            unselectedLabelStyle: TextStyle(),
                            indicatorColor:
                                FlutterFlowTheme.of(context).primary,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                4.0, 4.0, 4.0, 4.0),
                            tabs: [
                              Tab(
                                text: 'Day',
                              ),
                              Tab(
                                text: 'Week',
                              ),
                              Tab(
                                text: 'Month',
                              ),
                            ],
                            controller: _model.tabBarController,
                          ),
                        ),
                        Expanded(
                          child: TabBarView(
                            controller: _model.tabBarController,
                            children: [
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  setState(() {
                                    FFAppState().dateStart = FFAppState().dayS;
                                    FFAppState().dateEnd = FFAppState().dayE;
                                  });
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        FlutterFlowIconButton(
                                          borderColor: Color(0xCC090808),
                                          borderRadius: 20.0,
                                          borderWidth: 1.0,
                                          buttonSize: 40.0,
                                          fillColor: Color(0xFFEAEF39),
                                          icon: Icon(
                                            Icons.date_range,
                                            color: Color(0xCC090808),
                                            size: 24.0,
                                          ),
                                          onPressed: () async {
                                            setState(() {
                                              FFAppState().tab = 'day';
                                            });
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              enableDrag: false,
                                              context: context,
                                              builder: (context) {
                                                return GestureDetector(
                                                  onTap: () => _model
                                                          .unfocusNode
                                                          .canRequestFocus
                                                      ? FocusScope.of(context)
                                                          .requestFocus(_model
                                                              .unfocusNode)
                                                      : FocusScope.of(context)
                                                          .unfocus(),
                                                  child: Padding(
                                                    padding:
                                                        MediaQuery.viewInsetsOf(
                                                            context),
                                                    child: CalenderWidget(
                                                      tab: FFAppState().tab,
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));
                                          },
                                        ),
                                        Text(
                                          dateTimeFormat(
                                              'yMMMd', FFAppState().dayS),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                      ]
                                          .divide(SizedBox(width: 10.0))
                                          .addToStart(SizedBox(width: 10.0)),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 0.0),
                                      child: Text(
                                        'Hello World',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                      ),
                                    ),
                                    CircularPercentIndicator(
                                      percent: 0.5,
                                      radius: MediaQuery.sizeOf(context).width *
                                          0.075,
                                      lineWidth: 12.0,
                                      animation: true,
                                      animateFromLastPercent: true,
                                      progressColor:
                                          FlutterFlowTheme.of(context).primary,
                                      backgroundColor:
                                          FlutterFlowTheme.of(context).accent4,
                                      center: Text(
                                        (FFAppState().dayCalories /
                                                FFAppState().calorieGoal)
                                            .toString(),
                                        style: FlutterFlowTheme.of(context)
                                            .headlineSmall,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            'Protein',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                          Expanded(
                                            child: LinearPercentIndicator(
                                              percent: (FFAppState()
                                                          .dayProtein /
                                                      FFAppState().proteinGoal)
                                                  .toDouble(),
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.5,
                                              lineHeight: 15.0,
                                              animation: true,
                                              animateFromLastPercent: true,
                                              progressColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .accent4,
                                              center: Text(
                                                FFAppState()
                                                    .dayProtein
                                                    .toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineSmall
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          fontSize: 14.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                              padding: EdgeInsets.zero,
                                            ),
                                          ),
                                        ]
                                            .divide(SizedBox(width: 20.0))
                                            .addToStart(SizedBox(width: 50.0)),
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          'Fat',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                        Expanded(
                                          child: LinearPercentIndicator(
                                            percent: (FFAppState().dayFat /
                                                    FFAppState().fatGoal)
                                                .toDouble(),
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.5,
                                            lineHeight: 15.0,
                                            animation: true,
                                            animateFromLastPercent: true,
                                            progressColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .accent4,
                                            center: Text(
                                              (FFAppState().dayFat /
                                                      FFAppState().fatGoal)
                                                  .toString(),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineSmall
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        fontSize: 14.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                            ),
                                            padding: EdgeInsets.zero,
                                          ),
                                        ),
                                      ]
                                          .divide(SizedBox(width: 20.0))
                                          .addToStart(SizedBox(width: 50.0)),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          'Carbs',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                        Expanded(
                                          child: LinearPercentIndicator(
                                            percent: (FFAppState().dayCarbs /
                                                    FFAppState().carbGoal)
                                                .toDouble(),
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.5,
                                            lineHeight: 15.0,
                                            animation: true,
                                            animateFromLastPercent: true,
                                            progressColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .accent4,
                                            center: Text(
                                              (FFAppState().dayCarbs /
                                                      FFAppState().carbGoal)
                                                  .toString(),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineSmall
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        fontSize: 14.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                            ),
                                            padding: EdgeInsets.zero,
                                          ),
                                        ),
                                      ]
                                          .divide(SizedBox(width: 20.0))
                                          .addToStart(SizedBox(width: 50.0)),
                                    ),
                                  ],
                                ),
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  setState(() {
                                    FFAppState().dateStart = FFAppState().weekS;
                                    FFAppState().dateEnd = FFAppState().weekE;
                                  });
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        FlutterFlowIconButton(
                                          borderColor: Color(0xCC090808),
                                          borderRadius: 20.0,
                                          borderWidth: 1.0,
                                          buttonSize: 40.0,
                                          fillColor: Color(0xFFEAEF39),
                                          icon: Icon(
                                            Icons.date_range,
                                            color: Color(0xCC090808),
                                            size: 24.0,
                                          ),
                                          onPressed: () async {
                                            setState(() {
                                              FFAppState().tab = 'week';
                                            });
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              enableDrag: false,
                                              context: context,
                                              builder: (context) {
                                                return GestureDetector(
                                                  onTap: () => _model
                                                          .unfocusNode
                                                          .canRequestFocus
                                                      ? FocusScope.of(context)
                                                          .requestFocus(_model
                                                              .unfocusNode)
                                                      : FocusScope.of(context)
                                                          .unfocus(),
                                                  child: Padding(
                                                    padding:
                                                        MediaQuery.viewInsetsOf(
                                                            context),
                                                    child: CalenderWidget(
                                                      tab: FFAppState().tab,
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));
                                          },
                                        ),
                                        Text(
                                          valueOrDefault<String>(
                                            dateTimeFormat(
                                                'yMMMd', FFAppState().weekS),
                                            'date',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                        Text(
                                          valueOrDefault<String>(
                                            dateTimeFormat(
                                                'yMMMd', FFAppState().weekE),
                                            'date',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                      ]
                                          .divide(SizedBox(width: 10.0))
                                          .addToStart(SizedBox(width: 10.0)),
                                    ),
                                  ],
                                ),
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  setState(() {
                                    FFAppState().dateStart =
                                        FFAppState().monthS;
                                    FFAppState().dateEnd = FFAppState().monthE;
                                  });
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        FlutterFlowIconButton(
                                          borderColor: Color(0xCC090808),
                                          borderRadius: 20.0,
                                          borderWidth: 1.0,
                                          buttonSize: 40.0,
                                          fillColor: Color(0xFFEAEF39),
                                          icon: Icon(
                                            Icons.date_range,
                                            color: Color(0xCC090808),
                                            size: 24.0,
                                          ),
                                          onPressed: () async {
                                            setState(() {
                                              FFAppState().tab = 'month';
                                            });
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              enableDrag: false,
                                              context: context,
                                              builder: (context) {
                                                return GestureDetector(
                                                  onTap: () => _model
                                                          .unfocusNode
                                                          .canRequestFocus
                                                      ? FocusScope.of(context)
                                                          .requestFocus(_model
                                                              .unfocusNode)
                                                      : FocusScope.of(context)
                                                          .unfocus(),
                                                  child: Padding(
                                                    padding:
                                                        MediaQuery.viewInsetsOf(
                                                            context),
                                                    child: CalenderWidget(
                                                      tab: FFAppState().tab,
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));
                                          },
                                        ),
                                        Text(
                                          dateTimeFormat(
                                              'yMMMd', FFAppState().monthS),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                        Text(
                                          valueOrDefault<String>(
                                            dateTimeFormat(
                                                'yMMMd', FFAppState().monthE),
                                            'date',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                      ]
                                          .divide(SizedBox(width: 10.0))
                                          .addToStart(SizedBox(width: 10.0)),
                                    ),
                                  ],
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
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                    child: Container(
                      width: double.infinity,
                      height: 60.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      alignment: AlignmentDirectional(0.00, 0.00),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            12.0, 12.0, 12.0, 12.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Icon(
                              Icons.local_dining_rounded,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'Breakfast',
                                style: FlutterFlowTheme.of(context).labelMedium,
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: AlignmentDirectional(0.90, 0.00),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed(
                                      'Breakfast',
                                      queryParameters: {
                                        'mealtime': serializeParam(
                                          'breakfast',
                                          ParamType.String,
                                        ),
                                      }.withoutNulls,
                                    );

                                    if (FFAppState().tabindexMacros == 'day') {
                                      setState(() {
                                        FFAppState().dateStart =
                                            FFAppState().dayS;
                                        FFAppState().dateEnd =
                                            FFAppState().dayE;
                                      });
                                    } else {
                                      if (FFAppState().tabindexMacros ==
                                          'week') {
                                        setState(() {
                                          FFAppState().dateStart =
                                              FFAppState().weekS;
                                          FFAppState().dateEnd =
                                              FFAppState().weekE;
                                        });
                                      } else {
                                        setState(() {
                                          FFAppState().dateStart =
                                              FFAppState().monthS;
                                          FFAppState().dateEnd =
                                              FFAppState().monthE;
                                        });
                                      }
                                    }
                                  },
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 18.0,
                                  ),
                                ),
                              ),
                            ),
                          ].divide(SizedBox(width: 10.0)),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                    child: Container(
                      width: double.infinity,
                      height: 60.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      alignment: AlignmentDirectional(0.00, 0.00),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            12.0, 12.0, 12.0, 12.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Icon(
                              Icons.grain_rounded,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'Lunch',
                                style: FlutterFlowTheme.of(context).labelMedium,
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: AlignmentDirectional(0.90, 0.00),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed(
                                      'Lunch',
                                      queryParameters: {
                                        'mealtime': serializeParam(
                                          'lunch',
                                          ParamType.String,
                                        ),
                                      }.withoutNulls,
                                    );

                                    if (FFAppState().tabindexMacros == 'day') {
                                      setState(() {
                                        FFAppState().dateStart =
                                            FFAppState().dayS;
                                        FFAppState().dateEnd =
                                            FFAppState().dayE;
                                      });
                                    } else {
                                      if (FFAppState().tabindexMacros ==
                                          'week') {
                                        setState(() {
                                          FFAppState().dateStart =
                                              FFAppState().weekS;
                                          FFAppState().dateEnd =
                                              FFAppState().weekE;
                                        });
                                      } else {
                                        setState(() {
                                          FFAppState().dateStart =
                                              FFAppState().monthS;
                                          FFAppState().dateEnd =
                                              FFAppState().monthE;
                                        });
                                      }
                                    }
                                  },
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 18.0,
                                  ),
                                ),
                              ),
                            ),
                          ].divide(SizedBox(width: 10.0)),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                    child: Container(
                      width: double.infinity,
                      height: 60.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      alignment: AlignmentDirectional(0.00, 0.00),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            12.0, 12.0, 12.0, 12.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Icon(
                              Icons.local_fire_department_rounded,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'Dinner',
                                style: FlutterFlowTheme.of(context).labelMedium,
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: AlignmentDirectional(0.90, 0.00),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed(
                                      'Dinner',
                                      queryParameters: {
                                        'mealtime': serializeParam(
                                          'dinner',
                                          ParamType.String,
                                        ),
                                      }.withoutNulls,
                                    );

                                    if (FFAppState().tabindexMacros == 'day') {
                                      setState(() {
                                        FFAppState().dateStart =
                                            FFAppState().dayS;
                                        FFAppState().dateEnd =
                                            FFAppState().dayE;
                                      });
                                    } else {
                                      if (FFAppState().tabindexMacros ==
                                          'week') {
                                        setState(() {
                                          FFAppState().dateStart =
                                              FFAppState().weekS;
                                          FFAppState().dateEnd =
                                              FFAppState().weekE;
                                        });
                                      } else {
                                        setState(() {
                                          FFAppState().dateStart =
                                              FFAppState().monthS;
                                          FFAppState().dateEnd =
                                              FFAppState().monthE;
                                        });
                                      }
                                    }
                                  },
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 18.0,
                                  ),
                                ),
                              ),
                            ),
                          ].divide(SizedBox(width: 10.0)),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                    child: Container(
                      width: double.infinity,
                      height: 60.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      alignment: AlignmentDirectional(0.00, 0.00),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            12.0, 12.0, 12.0, 12.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Icon(
                              Icons.local_mall_rounded,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'Snacks',
                                style: FlutterFlowTheme.of(context).labelMedium,
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: AlignmentDirectional(0.90, 0.00),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed(
                                      'Snack',
                                      queryParameters: {
                                        'mealtime': serializeParam(
                                          'snack',
                                          ParamType.String,
                                        ),
                                      }.withoutNulls,
                                    );

                                    if (FFAppState().tabindexMacros == 'day') {
                                      setState(() {
                                        FFAppState().dateStart =
                                            FFAppState().dayS;
                                        FFAppState().dateEnd =
                                            FFAppState().dayE;
                                      });
                                    } else {
                                      if (FFAppState().tabindexMacros ==
                                          'week') {
                                        setState(() {
                                          FFAppState().dateStart =
                                              FFAppState().weekS;
                                          FFAppState().dateEnd =
                                              FFAppState().weekE;
                                        });
                                      } else {
                                        setState(() {
                                          FFAppState().dateStart =
                                              FFAppState().monthS;
                                          FFAppState().dateEnd =
                                              FFAppState().monthE;
                                        });
                                      }
                                    }
                                  },
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 18.0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    FFButtonWidget(
                      onPressed: () {
                        print('Button pressed ...');
                      },
                      text: 'Button',
                      options: FFButtonOptions(
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
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
                    Flexible(
                      child: Text(
                        '       Macronutrient Calculator',
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
