import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'test_workouts_model.dart';
export 'test_workouts_model.dart';

class TestWorkoutsWidget extends StatefulWidget {
  const TestWorkoutsWidget({Key? key}) : super(key: key);

  @override
  _TestWorkoutsWidgetState createState() => _TestWorkoutsWidgetState();
}

class _TestWorkoutsWidgetState extends State<TestWorkoutsWidget> {
  late TestWorkoutsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TestWorkoutsModel());

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
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            context.pushNamed('addExercise');
          },
          backgroundColor: FlutterFlowTheme.of(context).primary,
          elevation: 8.0,
          child: Icon(
            Icons.add,
            color: FlutterFlowTheme.of(context).info,
            size: 24.0,
          ),
        ),
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Text(
            'Workouts',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: Colors.white,
                  fontSize: 22.0,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                child: Text(
                  'Don\'t see anything? Press the + button in the bottom right to add exercises to your workout plan.\n\nFinished your set? check the complete box next to the exercise to finish it!',
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
              ),
              Text(
                'Your workout plan',
                style: FlutterFlowTheme.of(context).headlineSmall,
              ),
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Builder(
                      builder: (context) {
                        final days = FFAppState().workoutDaysGoal.toList();
                        return ListView.separated(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: days.length,
                          separatorBuilder: (_, __) => SizedBox(height: 5.0),
                          itemBuilder: (context, daysIndex) {
                            final daysItem = days[daysIndex];
                            return Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: MediaQuery.sizeOf(context).height * 0.13,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 5.0, 0.0, 0.0),
                                      child: Text(
                                        daysItem,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                      ),
                                    ),
                                    StreamBuilder<List<WorkoutsRecord>>(
                                      stream: queryWorkoutsRecord(
                                        queryBuilder: (workoutsRecord) =>
                                            workoutsRecord
                                                .where(
                                                  'displayName',
                                                  isEqualTo:
                                                      FFAppState().displayName,
                                                )
                                                .where(
                                                  'plannedDays',
                                                  arrayContains: daysItem,
                                                ),
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        List<WorkoutsRecord>
                                            listViewWorkoutsRecordList =
                                            snapshot.data!;
                                        return ListView.builder(
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount:
                                              listViewWorkoutsRecordList.length,
                                          itemBuilder:
                                              (context, listViewIndex) {
                                            final listViewWorkoutsRecord =
                                                listViewWorkoutsRecordList[
                                                    listViewIndex];
                                            return Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.05,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      '${listViewWorkoutsRecord.name} | Reps: ${listViewWorkoutsRecord.reps.toString()} | Weight: ${listViewWorkoutsRecord.weight.toString()}',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(5.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      '| Complete?',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                    ),
                                                  ),
                                                  Theme(
                                                    data: ThemeData(
                                                      checkboxTheme:
                                                          CheckboxThemeData(
                                                        visualDensity:
                                                            VisualDensity
                                                                .compact,
                                                        materialTapTargetSize:
                                                            MaterialTapTargetSize
                                                                .shrinkWrap,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      4.0),
                                                        ),
                                                      ),
                                                      unselectedWidgetColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                    ),
                                                    child: Checkbox(
                                                      value: _model
                                                              .checkboxValueMap[
                                                          listViewWorkoutsRecord] ??= false,
                                                      onChanged:
                                                          (newValue) async {
                                                        setState(() => _model
                                                                    .checkboxValueMap[
                                                                listViewWorkoutsRecord] =
                                                            newValue!);
                                                        if (newValue!) {
                                                          await listViewWorkoutsRecord
                                                              .reference
                                                              .update({
                                                            ...mapToFirestore(
                                                              {
                                                                'completedDays':
                                                                    FieldValue
                                                                        .arrayUnion([
                                                                  daysItem
                                                                ]),
                                                              },
                                                            ),
                                                          });
                                                        } else {
                                                          await listViewWorkoutsRecord
                                                              .reference
                                                              .update({
                                                            ...mapToFirestore(
                                                              {
                                                                'completedDays':
                                                                    FieldValue
                                                                        .arrayRemove([
                                                                  daysItem
                                                                ]),
                                                              },
                                                            ),
                                                          });
                                                        }
                                                      },
                                                      activeColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      checkColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ].divide(SizedBox(height: 5.0)),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ].divide(SizedBox(height: 10.0)).around(SizedBox(height: 10.0)),
          ),
        ),
      ),
    );
  }
}
