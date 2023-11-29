import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'macrosmanual_model.dart';
export 'macrosmanual_model.dart';

class MacrosmanualWidget extends StatefulWidget {
  const MacrosmanualWidget({
    Key? key,
    required this.mealtime,
    required this.tab,
  }) : super(key: key);

  final String? mealtime;
  final int? tab;

  @override
  _MacrosmanualWidgetState createState() => _MacrosmanualWidgetState();
}

class _MacrosmanualWidgetState extends State<MacrosmanualWidget> {
  late MacrosmanualModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MacrosmanualModel());

    _model.textFieldNameController ??= TextEditingController();
    _model.textFieldNameFocusNode ??= FocusNode();

    _model.textFieldCalController ??= TextEditingController(text: '0');
    _model.textFieldCalFocusNode ??= FocusNode();

    _model.textFieldProController ??= TextEditingController(text: '0');
    _model.textFieldProFocusNode ??= FocusNode();

    _model.textFieldFatController ??= TextEditingController(text: '0');
    _model.textFieldFatFocusNode ??= FocusNode();

    _model.textFieldCarbController ??= TextEditingController(text: '0');
    _model.textFieldCarbFocusNode ??= FocusNode();

    _model.quanityController ??= TextEditingController(text: '0');
    _model.quanityFocusNode ??= FocusNode();

    _model.measureController ??= TextEditingController();
    _model.measureFocusNode ??= FocusNode();

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
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                final selectedMedia = await selectMediaWithSourceBottomSheet(
                  context: context,
                  allowPhoto: true,
                );
                if (selectedMedia != null &&
                    selectedMedia.every(
                        (m) => validateFileFormat(m.storagePath, context))) {
                  setState(() => _model.isDataUploading = true);
                  var selectedUploadedFiles = <FFUploadedFile>[];

                  var downloadUrls = <String>[];
                  try {
                    selectedUploadedFiles = selectedMedia
                        .map((m) => FFUploadedFile(
                              name: m.storagePath.split('/').last,
                              bytes: m.bytes,
                              height: m.dimensions?.height,
                              width: m.dimensions?.width,
                              blurHash: m.blurHash,
                            ))
                        .toList();

                    downloadUrls = (await Future.wait(
                      selectedMedia.map(
                        (m) async => await uploadData(m.storagePath, m.bytes),
                      ),
                    ))
                        .where((u) => u != null)
                        .map((u) => u!)
                        .toList();
                  } finally {
                    _model.isDataUploading = false;
                  }
                  if (selectedUploadedFiles.length == selectedMedia.length &&
                      downloadUrls.length == selectedMedia.length) {
                    setState(() {
                      _model.uploadedLocalFile = selectedUploadedFiles.first;
                      _model.uploadedFileUrl = downloadUrls.first;
                    });
                  } else {
                    setState(() {});
                    return;
                  }
                }
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  'https://picsum.photos/seed/935/600',
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: MediaQuery.sizeOf(context).height * 0.25,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                  child: TextFormField(
                    controller: _model.textFieldNameController,
                    focusNode: _model.textFieldNameFocusNode,
                    autofocus: true,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Food Name',
                      labelStyle: FlutterFlowTheme.of(context).labelMedium,
                      hintStyle: FlutterFlowTheme.of(context).labelMedium,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).alternate,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).primary,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      errorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedErrorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium,
                    textAlign: TextAlign.center,
                    validator: _model.textFieldNameControllerValidator
                        .asValidator(context),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                child: Text(
                  'Calories',
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                  child: TextFormField(
                    controller: _model.textFieldCalController,
                    focusNode: _model.textFieldCalFocusNode,
                    autofocus: true,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelStyle: FlutterFlowTheme.of(context).labelMedium,
                      hintStyle: FlutterFlowTheme.of(context).labelMedium,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).alternate,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).primary,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      errorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedErrorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium,
                    textAlign: TextAlign.center,
                    validator: _model.textFieldCalControllerValidator
                        .asValidator(context),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                child: Text(
                  'kcal',
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                child: Text(
                  'Protein',
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                  child: TextFormField(
                    controller: _model.textFieldProController,
                    focusNode: _model.textFieldProFocusNode,
                    autofocus: true,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelStyle: FlutterFlowTheme.of(context).labelMedium,
                      hintStyle: FlutterFlowTheme.of(context).labelMedium,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).alternate,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).primary,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      errorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedErrorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium,
                    textAlign: TextAlign.center,
                    validator: _model.textFieldProControllerValidator
                        .asValidator(context),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                child: Text(
                  'grams',
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                child: Text(
                  'Fats',
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                  child: TextFormField(
                    controller: _model.textFieldFatController,
                    focusNode: _model.textFieldFatFocusNode,
                    autofocus: true,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelStyle: FlutterFlowTheme.of(context).labelMedium,
                      hintStyle: FlutterFlowTheme.of(context).labelMedium,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).alternate,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).primary,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      errorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedErrorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium,
                    textAlign: TextAlign.center,
                    validator: _model.textFieldFatControllerValidator
                        .asValidator(context),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                child: Text(
                  'grams',
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                child: Text(
                  'Carbs',
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                  child: TextFormField(
                    controller: _model.textFieldCarbController,
                    focusNode: _model.textFieldCarbFocusNode,
                    autofocus: true,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelStyle: FlutterFlowTheme.of(context).labelMedium,
                      hintStyle: FlutterFlowTheme.of(context).labelMedium,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).alternate,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).primary,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      errorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedErrorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium,
                    textAlign: TextAlign.center,
                    validator: _model.textFieldCarbControllerValidator
                        .asValidator(context),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                child: Text(
                  'grams',
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                child: Text(
                  'Quanity',
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                  child: TextFormField(
                    controller: _model.quanityController,
                    focusNode: _model.quanityFocusNode,
                    autofocus: true,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelStyle: FlutterFlowTheme.of(context).labelMedium,
                      hintStyle: FlutterFlowTheme.of(context).labelMedium,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).alternate,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).primary,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      errorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedErrorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium,
                    textAlign: TextAlign.center,
                    validator:
                        _model.quanityControllerValidator.asValidator(context),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                child: Text(
                  'Measure',
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                  child: TextFormField(
                    controller: _model.measureController,
                    focusNode: _model.measureFocusNode,
                    autofocus: true,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'cup/whole/serving',
                      labelStyle: FlutterFlowTheme.of(context).labelMedium,
                      hintStyle: FlutterFlowTheme.of(context).labelMedium,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).alternate,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).primary,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      errorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedErrorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium,
                    textAlign: TextAlign.center,
                    validator:
                        _model.measureControllerValidator.asValidator(context),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                FFButtonWidget(
                  onPressed: () async {
                    _model.isConnected = await actions.isConnected(
                      FFAppState().isConnected,
                    );
                    setState(() {
                      FFAppState().isConnected = _model.isConnected!;
                    });
                    if (FFAppState().isConnected == true) {
                      _model.getUserId = await queryUsersNamesRecordOnce(
                        queryBuilder: (usersNamesRecord) =>
                            usersNamesRecord.where(
                          'username',
                          isEqualTo: FFAppState().username,
                        ),
                        singleRecord: true,
                      ).then((s) => s.firstOrNull);

                      await NutritionsRecord.createDoc(
                              _model.getUserId!.reference)
                          .set(createNutritionsRecordData(
                        image: _model.uploadedFileUrl,
                        name: _model.textFieldNameController.text,
                        calories: _model.textFieldCalController.text,
                        carbs: _model.textFieldCarbController.text,
                        proteins: _model.textFieldProController.text,
                        fats: _model.textFieldFatController.text,
                        currentTime: getCurrentTimestamp,
                        mealtime: widget.mealtime,
                      ));
                      if (widget.mealtime == 'breakfast') {
                        context.pushNamed(
                          'Breakfast',
                          queryParameters: {
                            'mealtime': serializeParam(
                              widget.mealtime,
                              ParamType.String,
                            ),
                            'tab': serializeParam(
                              0,
                              ParamType.int,
                            ),
                          }.withoutNulls,
                        );

                        FFAppState().update(() {
                          FFAppState().dayCalories = FFAppState().dayCalories +
                              int.parse(_model.textFieldCalController.text) +
                              FFAppState().dayCalories;
                          FFAppState().dayFat = FFAppState().dayFat +
                              int.parse(_model.textFieldFatController.text) +
                              FFAppState().dayFat;
                          FFAppState().dayProtein = FFAppState().dayProtein +
                              int.parse(_model.textFieldProController.text) +
                              FFAppState().dayProtein;
                          FFAppState().dayCarbs = FFAppState().dayCarbs +
                              int.parse(_model.textFieldCarbController.text) +
                              FFAppState().dayCarbs;
                        });
                      } else {
                        if (widget.mealtime == 'lunch') {
                          context.pushNamed(
                            'Lunch',
                            queryParameters: {
                              'mealtime': serializeParam(
                                'lunch',
                                ParamType.String,
                              ),
                              'tab': serializeParam(
                                widget.tab,
                                ParamType.int,
                              ),
                            }.withoutNulls,
                          );

                          FFAppState().update(() {
                            FFAppState().dayCalories = FFAppState()
                                    .dayCalories +
                                int.parse(_model.textFieldCalController.text) +
                                FFAppState().dayCalories;
                            FFAppState().dayFat = FFAppState().dayFat +
                                int.parse(_model.textFieldFatController.text) +
                                FFAppState().dayFat;
                            FFAppState().dayProtein = FFAppState().dayProtein +
                                int.parse(_model.textFieldProController.text) +
                                FFAppState().dayProtein;
                            FFAppState().dayCarbs = FFAppState().dayCarbs +
                                int.parse(_model.textFieldCarbController.text) +
                                FFAppState().dayCarbs;
                          });
                        } else {
                          if (widget.mealtime == 'dinner') {
                            context.pushNamed(
                              'Dinner',
                              queryParameters: {
                                'mealtime': serializeParam(
                                  'dinner',
                                  ParamType.String,
                                ),
                                'tab': serializeParam(
                                  widget.tab,
                                  ParamType.int,
                                ),
                              }.withoutNulls,
                            );

                            FFAppState().update(() {
                              FFAppState().dayCalories =
                                  FFAppState().dayCalories +
                                      int.parse(
                                          _model.textFieldCalController.text) +
                                      FFAppState().dayCalories;
                              FFAppState().dayFat = FFAppState().dayFat +
                                  int.parse(
                                      _model.textFieldFatController.text) +
                                  FFAppState().dayFat;
                              FFAppState().dayProtein =
                                  FFAppState().dayProtein +
                                      int.parse(
                                          _model.textFieldProController.text) +
                                      FFAppState().dayProtein;
                              FFAppState().dayCarbs = FFAppState().dayCarbs +
                                  int.parse(
                                      _model.textFieldCarbController.text) +
                                  FFAppState().dayCarbs;
                            });
                          } else {
                            context.pushNamed(
                              'Snack',
                              queryParameters: {
                                'mealtime': serializeParam(
                                  'snack',
                                  ParamType.String,
                                ),
                                'tab': serializeParam(
                                  widget.tab,
                                  ParamType.int,
                                ),
                              }.withoutNulls,
                            );

                            FFAppState().update(() {
                              FFAppState().dayCalories =
                                  FFAppState().dayCalories +
                                      int.parse(
                                          _model.textFieldCalController.text) +
                                      FFAppState().dayCalories;
                              FFAppState().dayFat = FFAppState().dayFat +
                                  int.parse(
                                      _model.textFieldFatController.text) +
                                  FFAppState().dayFat;
                              FFAppState().dayProtein =
                                  FFAppState().dayProtein +
                                      int.parse(
                                          _model.textFieldProController.text) +
                                      FFAppState().dayProtein;
                              FFAppState().dayCarbs = FFAppState().dayCarbs +
                                  int.parse(
                                      _model.textFieldCarbController.text) +
                                  FFAppState().dayCarbs;
                            });
                          }
                        }
                      }
                    } else {
                      Navigator.pop(context);
                      setState(() {
                        FFAppState().addToOffLineSave(OfflineSaveStruct(
                          calories: _model.textFieldCalController.text,
                          fats: _model.textFieldFatController.text,
                          protein: _model.textFieldProController.text,
                          carbs: _model.textFieldProController.text,
                          mealtime: widget.mealtime,
                          date: getCurrentTimestamp,
                          measure: _model.measureController.text,
                          quanity: _model.quanityController.text,
                          name: _model.textFieldNameController.text,
                          image: _model.uploadedFileUrl,
                        ));
                        FFAppState().isConnected = false;
                      });
                    }

                    setState(() {});
                  },
                  text: 'Save',
                  options: FFButtonOptions(
                    height: 37.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
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
                FFButtonWidget(
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                  text: 'Cancel',
                  options: FFButtonOptions(
                    height: 40.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
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
              ].divide(SizedBox(width: 20.0)).addToStart(SizedBox(width: 40.0)),
            ),
          ),
        ],
      ),
    );
  }
}
