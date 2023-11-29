import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'calculate_cal_model.dart';
export 'calculate_cal_model.dart';

class CalculateCalWidget extends StatefulWidget {
  const CalculateCalWidget({Key? key}) : super(key: key);

  @override
  _CalculateCalWidgetState createState() => _CalculateCalWidgetState();
}

class _CalculateCalWidgetState extends State<CalculateCalWidget> {
  late CalculateCalModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CalculateCalModel());

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
      width: 302.0,
      height: 299.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          ListView(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: [],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                'Hello World',
                style: FlutterFlowTheme.of(context).bodyMedium,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
