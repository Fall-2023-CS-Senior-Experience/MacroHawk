import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'sun_card_model.dart';
export 'sun_card_model.dart';

class SunCardWidget extends StatefulWidget {
  const SunCardWidget({Key? key}) : super(key: key);

  @override
  _SunCardWidgetState createState() => _SunCardWidgetState();
}

class _SunCardWidgetState extends State<SunCardWidget> {
  late SunCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SunCardModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

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
            'Sun',
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
