import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'wed_card_model.dart';
export 'wed_card_model.dart';

class WedCardWidget extends StatefulWidget {
  const WedCardWidget({Key? key}) : super(key: key);

  @override
  _WedCardWidgetState createState() => _WedCardWidgetState();
}

class _WedCardWidgetState extends State<WedCardWidget> {
  late WedCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WedCardModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      color: FlutterFlowTheme.of(context).secondaryBackground,
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            'Wed',
            style: FlutterFlowTheme.of(context).bodyMedium,
          ),
          ToggleIcon(
            onPressed: () async {
              setState(() => _model.toggle = !_model.toggle);
            },
            value: _model.toggle,
            onIcon: Icon(
              Icons.check_circle,
              color: Color(0xCC83EF39),
              size: 30.0,
            ),
            offIcon: Icon(
              Icons.circle,
              color: FlutterFlowTheme.of(context).secondaryText,
              size: 30.0,
            ),
          ),
        ],
      ),
    );
  }
}