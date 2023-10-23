import '/components/fri_card_widget.dart';
import '/components/mon_card_widget.dart';
import '/components/sat_card_widget.dart';
import '/components/sun_card_widget.dart';
import '/components/thu_card_widget.dart';
import '/components/tue_card_widget.dart';
import '/components/wed_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for monCard component.
  late MonCardModel monCardModel;
  // Model for tueCard component.
  late TueCardModel tueCardModel;
  // Model for wedCard component.
  late WedCardModel wedCardModel;
  // Model for thuCard component.
  late ThuCardModel thuCardModel;
  // Model for friCard component.
  late FriCardModel friCardModel;
  // Model for satCard component.
  late SatCardModel satCardModel;
  // Model for sunCard component.
  late SunCardModel sunCardModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    monCardModel = createModel(context, () => MonCardModel());
    tueCardModel = createModel(context, () => TueCardModel());
    wedCardModel = createModel(context, () => WedCardModel());
    thuCardModel = createModel(context, () => ThuCardModel());
    friCardModel = createModel(context, () => FriCardModel());
    satCardModel = createModel(context, () => SatCardModel());
    sunCardModel = createModel(context, () => SunCardModel());
  }

  void dispose() {
    unfocusNode.dispose();
    monCardModel.dispose();
    tueCardModel.dispose();
    wedCardModel.dispose();
    thuCardModel.dispose();
    friCardModel.dispose();
    satCardModel.dispose();
    sunCardModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
