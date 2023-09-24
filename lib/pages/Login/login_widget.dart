import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'login_model.dart';
export 'login_model.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  late LoginModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      GoRouter.of(context).prepareAuthEvent();
      if (_model.passwordController.text != _model.passwordController.text) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Passwords don\'t match!',
            ),
          ),
        );
        return;
      }

      final user = await authManager.createAccountWithEmail(
        context,
        _model.emailAddressController.text,
        _model.passwordController.text,
      );
      if (user == null) {
        return;
      }

      context.goNamedAuth('null', context.mounted);
    });

    _model.emailAddressController ??= TextEditingController();
    _model.passwordController ??= TextEditingController();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: SafeArea(
          top: true,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex: 6,
                child: Container(
                  width: 100,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  alignment: AlignmentDirectional(0.00, -1.00),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (responsiveVisibility(
                              context: context,
                              phone: false,
                              tablet: false,
                            ))
                              Container(
                                width: double.infinity,
                                height: 140,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(16),
                                    bottomRight: Radius.circular(16),
                                    topLeft: Radius.circular(0),
                                    topRight: Radius.circular(0),
                                  ),
                                ),
                              ),
                            if (responsiveVisibility(
                              context: context,
                              tabletLandscape: false,
                              desktop: false,
                            ))
                              Container(
                                width: double.infinity,
                                height: 140,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(16),
                                    bottomRight: Radius.circular(16),
                                    topLeft: Radius.circular(0),
                                    topRight: Radius.circular(0),
                                  ),
                                ),
                                alignment: AlignmentDirectional(-1.00, 0.00),
                                child: Align(
                                  alignment: AlignmentDirectional(0.00, 0.00),
                                  child: Text(
                                    'Marco Hawk',
                                    style: FlutterFlowTheme.of(context)
                                        .displaySmall
                                        .override(
                                      fontFamily: 'Plus Jakarta Sans',
                                      color: Color(0xFF101213),
                                      fontSize: 36,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            Container(
                              width: double.infinity,
                              constraints: BoxConstraints(
                                maxWidth: 430,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0.00, 0.00),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24, 24, 24, 24),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Welcome Back',
                                        style: FlutterFlowTheme.of(context)
                                            .headlineLarge
                                            .override(
                                          fontFamily: 'Urbanist',
                                          color: Color(0xFF101213),
                                          fontSize: 32,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 12, 0, 24),
                                        child: Text(
                                          'Let\'s get started by filling out the form below.',
                                          style: FlutterFlowTheme.of(context)
                                              .labelMedium
                                              .override(
                                            fontFamily: 'Plus Jakarta Sans',
                                            color: Color(0xFF57636C),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 16),
                                        child: Container(
                                          width: double.infinity,
                                          child: TextFormField(
                                            controller:
                                            _model.emailAddressController,
                                            autofocus: true,
                                            autofillHints: [
                                              AutofillHints.email
                                            ],
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText: 'Email',
                                              labelStyle: FlutterFlowTheme.of(
                                                  context)
                                                  .labelLarge
                                                  .override(
                                                fontFamily:
                                                'Plus Jakarta Sans',
                                                color: Color(0xFF57636C),
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xFFF1F4F8),
                                                  width: 2,
                                                ),
                                                borderRadius:
                                                BorderRadius.circular(12),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xFF4B39EF),
                                                  width: 2,
                                                ),
                                                borderRadius:
                                                BorderRadius.circular(12),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xFFE0E3E7),
                                                  width: 2,
                                                ),
                                                borderRadius:
                                                BorderRadius.circular(12),
                                              ),
                                              focusedErrorBorder:
                                              OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xFFE0E3E7),
                                                  width: 2,
                                                ),
                                                borderRadius:
                                                BorderRadius.circular(12),
                                              ),
                                              filled: true,
                                              fillColor: Color(0xFFF1F4F8),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                              fontFamily:
                                              'Plus Jakarta Sans',
                                              color: Color(0xFF101213),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            keyboardType:
                                            TextInputType.emailAddress,
                                            validator: _model
                                                .emailAddressControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 16),
                                        child: Container(
                                          width: double.infinity,
                                          child: TextFormField(
                                            controller:
                                            _model.passwordController,
                                            autofocus: true,
                                            autofillHints: [
                                              AutofillHints.password
                                            ],
                                            obscureText:
                                            !_model.passwordVisibility,
                                            decoration: InputDecoration(
                                              labelText: 'Password',
                                              labelStyle: FlutterFlowTheme.of(
                                                  context)
                                                  .labelLarge
                                                  .override(
                                                fontFamily:
                                                'Plus Jakarta Sans',
                                                color: Color(0xFF57636C),
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xFFF1F4F8),
                                                  width: 2,
                                                ),
                                                borderRadius:
                                                BorderRadius.circular(12),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xFF4B39EF),
                                                  width: 2,
                                                ),
                                                borderRadius:
                                                BorderRadius.circular(12),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xFFE0E3E7),
                                                  width: 2,
                                                ),
                                                borderRadius:
                                                BorderRadius.circular(12),
                                              ),
                                              focusedErrorBorder:
                                              OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xFFE0E3E7),
                                                  width: 2,
                                                ),
                                                borderRadius:
                                                BorderRadius.circular(12),
                                              ),
                                              filled: true,
                                              fillColor: Color(0xFFF1F4F8),
                                              suffixIcon: InkWell(
                                                onTap: () => setState(
                                                      () => _model
                                                      .passwordVisibility =
                                                  !_model
                                                      .passwordVisibility,
                                                ),
                                                focusNode: FocusNode(
                                                    skipTraversal: true),
                                                child: Icon(
                                                  _model.passwordVisibility
                                                      ? Icons
                                                      .visibility_outlined
                                                      : Icons
                                                      .visibility_off_outlined,
                                                  color: Color(0xFF57636C),
                                                  size: 24,
                                                ),
                                              ),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                              fontFamily:
                                              'Plus Jakarta Sans',
                                              color: Color(0xFF101213),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            validator: _model
                                                .passwordControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 16),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            GoRouter.of(context)
                                                .prepareAuthEvent();

                                            final user = await authManager
                                                .signInWithEmail(
                                              context,
                                              _model
                                                  .emailAddressController.text,
                                              _model.passwordController.text,
                                            );
                                            if (user == null) {
                                              return;
                                            }

                                            context.goNamedAuth(
                                                'null', context.mounted);
                                          },
                                          text: 'Sign In',
                                          options: FFButtonOptions(
                                            width: double.infinity,
                                            height: 44,
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0, 0, 0, 0),
                                            iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0, 0, 0, 0),
                                            color: Color(0xFF4B39EF),
                                            textStyle:
                                            FlutterFlowTheme.of(context)
                                                .titleSmall
                                                .override(
                                              fontFamily:
                                              'Plus Jakarta Sans',
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight:
                                              FontWeight.w500,
                                            ),
                                            elevation: 3,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(12),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 24),
                                        child: Container(
                                          width: 370,
                                          child: Stack(
                                            alignment:
                                            AlignmentDirectional(0, 0),
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.00, 0.00),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 12, 0, 12),
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: 2,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFFF1F4F8),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.00, 0.00),
                                                child: Container(
                                                  width: 70,
                                                  height: 32,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                  ),
                                                  alignment:
                                                  AlignmentDirectional(
                                                      0.00, 0.00),
                                                  child: Text(
                                                    'OR',
                                                    style: FlutterFlowTheme.of(
                                                        context)
                                                        .labelMedium
                                                        .override(
                                                      fontFamily:
                                                      'Plus Jakarta Sans',
                                                      color:
                                                      Color(0xFF57636C),
                                                      fontSize: 14,
                                                      fontWeight:
                                                      FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 16),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            GoRouter.of(context)
                                                .prepareAuthEvent();
                                            final user = await authManager
                                                .signInWithGoogle(context);
                                            if (user == null) {
                                              return;
                                            }

                                            context.goNamedAuth(
                                                'null', context.mounted);
                                          },
                                          text: 'Continue with Google',
                                          icon: FaIcon(
                                            FontAwesomeIcons.google,
                                            size: 20,
                                          ),
                                          options: FFButtonOptions(
                                            width: double.infinity,
                                            height: 44,
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0, 0, 0, 0),
                                            iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0, 0, 0, 0),
                                            color: Colors.white,
                                            textStyle:
                                            FlutterFlowTheme.of(context)
                                                .titleSmall
                                                .override(
                                              fontFamily:
                                              'Plus Jakarta Sans',
                                              color: Color(0xFF101213),
                                              fontSize: 16,
                                              fontWeight:
                                              FontWeight.w500,
                                            ),
                                            elevation: 0,
                                            borderSide: BorderSide(
                                              color: Color(0xFFE0E3E7),
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(12),
                                            hoverColor: Color(0xFFF1F4F8),
                                          ),
                                        ),
                                      ),
                                      isAndroid
                                          ? Container()
                                          : Padding(
                                        padding: EdgeInsetsDirectional
                                            .fromSTEB(0, 0, 0, 16),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            GoRouter.of(context)
                                                .prepareAuthEvent();
                                            final user = await authManager
                                                .signInWithApple(context);
                                            if (user == null) {
                                              return;
                                            }

                                            context.goNamedAuth(
                                                'null', context.mounted);
                                          },
                                          text: 'Continue with Apple',
                                          icon: FaIcon(
                                            FontAwesomeIcons.apple,
                                            size: 20,
                                          ),
                                          options: FFButtonOptions(
                                            width: double.infinity,
                                            height: 44,
                                            padding: EdgeInsetsDirectional
                                                .fromSTEB(0, 0, 0, 0),
                                            iconPadding:
                                            EdgeInsetsDirectional
                                                .fromSTEB(0, 0, 0, 0),
                                            color: Colors.white,
                                            textStyle: FlutterFlowTheme
                                                .of(context)
                                                .titleSmall
                                                .override(
                                              fontFamily:
                                              'Plus Jakarta Sans',
                                              color:
                                              Color(0xFF101213),
                                              fontSize: 16,
                                              fontWeight:
                                              FontWeight.w500,
                                            ),
                                            elevation: 0,
                                            borderSide: BorderSide(
                                              color: Color(0xFFE0E3E7),
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(12),
                                            hoverColor: Color(0xFFF1F4F8),
                                          ),
                                        ),
                                      ),

                                      // You will have to add an action on this rich text to go to your login page.
                                      Align(
                                        alignment:
                                        AlignmentDirectional(0.00, 0.00),
                                        child: Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0, 12, 0, 12),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              GoRouter.of(context)
                                                  .prepareAuthEvent();
                                              final user = await authManager
                                                  .signInAnonymously(context);
                                              if (user == null) {
                                                return;
                                              }

                                              context.goNamedAuth(
                                                  'null', context.mounted);
                                            },
                                            child: RichText(
                                              textScaleFactor:
                                              MediaQuery.of(context)
                                                  .textScaleFactor,
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text:
                                                    'Don\'t have an account? ',
                                                    style: TextStyle(),
                                                  ),
                                                  TextSpan(
                                                    text: '',
                                                    style: FlutterFlowTheme.of(
                                                        context)
                                                        .bodyMedium
                                                        .override(
                                                      fontFamily:
                                                      'Plus Jakarta Sans',
                                                      color:
                                                      Color(0xFF4B39EF),
                                                      fontSize: 14,
                                                      fontWeight:
                                                      FontWeight.w600,
                                                    ),
                                                  )
                                                ],
                                                style:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                  fontFamily:
                                                  'Plus Jakarta Sans',
                                                  color:
                                                  Color(0xFF101213),
                                                  fontSize: 14,
                                                  fontWeight:
                                                  FontWeight.w500,
                                                ),
                                              ),
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
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.00, 1.00),
                        child: FFButtonWidget(
                          onPressed: () async {
                            GoRouter.of(context).prepareAuthEvent();
                            if (_model.passwordController.text !=
                                _model.passwordController.text) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Passwords don\'t match!',
                                  ),
                                ),
                              );
                              return;
                            }

                            final user =
                            await authManager.createAccountWithEmail(
                              context,
                              _model.emailAddressController.text,
                              _model.passwordController.text,
                            );
                            if (user == null) {
                              return;
                            }

                            context.goNamedAuth('null', context.mounted);
                          },
                          text: 'Sigun Up here',
                          options: FFButtonOptions(
                            height: 40,
                            padding:
                            EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                            iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                              fontFamily: 'Readex Pro',
                              color: Colors.white,
                            ),
                            elevation: 3,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (responsiveVisibility(
                context: context,
                phone: false,
                tablet: false,
              ))
                Expanded(
                  flex: 8,
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                    child: Container(
                      width: 100,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFF4B39EF), Color(0xFF39D2C0)],
                          stops: [0, 1],
                          begin: AlignmentDirectional(1, -1),
                          end: AlignmentDirectional(-1, 1),
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(24, 24, 24, 24),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: double.infinity,
                              constraints: BoxConstraints(
                                maxWidth: 400,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 3,
                                    color: Color(0x2E000000),
                                    offset: Offset(0, 2),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: Color(0xFFF1F4F8),
                                  width: 2,
                                ),
                              ),
                              child: Padding(
                                padding:
                                EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12, 12, 12, 8),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 8, 0),
                                                child: Container(
                                                  width: 40,
                                                  height: 40,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFEEEEEE),
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Icon(
                                                    Icons.person,
                                                    color: Color(0xFF4B39EF),
                                                    size: 24,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                'UserName',
                                                style:
                                                FlutterFlowTheme.of(context)
                                                    .titleMedium
                                                    .override(
                                                  fontFamily:
                                                  'Plus Jakarta Sans',
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontWeight:
                                                  FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                'Overall',
                                                style:
                                                FlutterFlowTheme.of(context)
                                                    .bodySmall
                                                    .override(
                                                  fontFamily:
                                                  'Plus Jakarta Sans',
                                                  color:
                                                  Color(0xFF101213),
                                                  fontSize: 12,
                                                  fontWeight:
                                                  FontWeight.w500,
                                                ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        0, 0, 4, 0),
                                                    child: Text(
                                                      '5',
                                                      style: FlutterFlowTheme
                                                          .of(context)
                                                          .headlineMedium
                                                          .override(
                                                        fontFamily:
                                                        'Plus Jakarta Sans',
                                                        color: Color(
                                                            0xFF101213),
                                                        fontSize: 24,
                                                        fontWeight:
                                                        FontWeight.w500,
                                                      ),
                                                    ),
                                                  ),
                                                  Icon(
                                                    Icons.star_rounded,
                                                    color: Color(0xFF4B39EF),
                                                    size: 20,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12, 0, 12, 8),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: AutoSizeText(
                                              'Nice outdoor courts, solid concrete and good hoops for the neighborhood.',
                                              style: FlutterFlowTheme.of(
                                                  context)
                                                  .bodyMedium
                                                  .override(
                                                fontFamily:
                                                'Plus Jakarta Sans',
                                                color: Color(0xFF101213),
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
