import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> with TickerProviderStateMixin {
  final animationsMap = {
    'textOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
      ],
    ),
    'wrapOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
      ],
    ),
  };
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'home'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        title: Text(
          'Agenda de Eventos',
          textAlign: TextAlign.center,
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: FlutterFlowTheme.of(context).primaryBackground,
              ),
        ),
        actions: [
          FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30,
            borderWidth: 1,
            buttonSize: 60,
            icon: Icon(
              Icons.logout,
              color: FlutterFlowTheme.of(context).primaryBackground,
              size: 30,
            ),
            showLoadingIndicator: true,
            onPressed: () async {
              logFirebaseEvent('HOME_PAGE_logout_ICN_ON_TAP');
              logFirebaseEvent('IconButton_alert_dialog');
              var confirmDialogResponse = await showDialog<bool>(
                    context: context,
                    builder: (alertDialogContext) {
                      return AlertDialog(
                        content: Text('Sair da sua conta?'),
                        actions: [
                          TextButton(
                            onPressed: () =>
                                Navigator.pop(alertDialogContext, false),
                            child: Text('Cancelar'),
                          ),
                          TextButton(
                            onPressed: () =>
                                Navigator.pop(alertDialogContext, true),
                            child: Text('Sair'),
                          ),
                        ],
                      );
                    },
                  ) ??
                  false;
              if (confirmDialogResponse) {
                logFirebaseEvent('IconButton_auth');
                GoRouter.of(context).prepareAuthEvent();
                await signOut();
              }

              context.goNamedAuth('signIn', mounted);
            },
          ),
        ],
        centerTitle: true,
        elevation: 2,
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AuthUserStreamWidget(
                child: SelectionArea(
                    child: Text(
                  'Olá, ${currentUserDisplayName}!',
                  style: FlutterFlowTheme.of(context).title1,
                )).animateOnPageLoad(animationsMap['textOnPageLoadAnimation']!),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 4),
                      child: Text(
                        'Próximos eventos:',
                        style: FlutterFlowTheme.of(context).subtitle2.override(
                              fontFamily: 'Poppins',
                              color: FlutterFlowTheme.of(context).secondaryText,
                            ),
                      ),
                    ),
                    FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent('HOME_PAGE_VER_TODOS_BTN_ON_TAP');
                        logFirebaseEvent('Button_navigate_to');

                        context.pushNamed('eventos');
                      },
                      text: 'Ver Todos',
                      options: FFButtonOptions(
                        width: 130,
                        height: 40,
                        color: FlutterFlowTheme.of(context).primaryColor,
                        textStyle:
                            FlutterFlowTheme.of(context).subtitle2.override(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                ),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 44),
                child: StreamBuilder<List<EventosRecord>>(
                  stream: queryEventosRecord(
                    queryBuilder: (eventosRecord) => eventosRecord.where(
                        'dataHora',
                        isGreaterThanOrEqualTo: getCurrentTimestamp),
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: SpinKitRing(
                            color: FlutterFlowTheme.of(context).primaryColor,
                            size: 50,
                          ),
                        ),
                      );
                    }
                    List<EventosRecord> wrapEventosRecordList = snapshot.data!;
                    return Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      alignment: WrapAlignment.start,
                      crossAxisAlignment: WrapCrossAlignment.start,
                      direction: Axis.horizontal,
                      runAlignment: WrapAlignment.start,
                      verticalDirection: VerticalDirection.down,
                      clipBehavior: Clip.none,
                      children: List.generate(wrapEventosRecordList.length,
                          (wrapIndex) {
                        final wrapEventosRecord =
                            wrapEventosRecordList[wrapIndex];
                        return Container(
                          width: MediaQuery.of(context).size.width * 0.45,
                          height: 190,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 4,
                                color: Color(0x230E151B),
                                offset: Offset(0, 2),
                              )
                            ],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                            child: InkWell(
                              onTap: () async {
                                logFirebaseEvent(
                                    'HOME_PAGE_Column_t22zot6w_ON_TAP');
                                logFirebaseEvent('Column_navigate_to');

                                context.pushNamed(
                                  'detalhe_evento',
                                  queryParams: {
                                    'evento': serializeParam(
                                      wrapEventosRecord,
                                      ParamType.Document,
                                    ),
                                  }.withoutNulls,
                                  extra: <String, dynamic>{
                                    'evento': wrapEventosRecord,
                                  },
                                );
                              },
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  StreamBuilder<LocaisRecord>(
                                    stream: LocaisRecord.getDocument(
                                        wrapEventosRecord.local!),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50,
                                            height: 50,
                                            child: SpinKitRing(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              size: 50,
                                            ),
                                          ),
                                        );
                                      }
                                      final imageLocaisRecord = snapshot.data!;
                                      return ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(
                                          valueOrDefault<String>(
                                            imageLocaisRecord.logomarca,
                                            'https://media.istockphoto.com/id/1255230725/pt/vetorial/music-band-concert-silhouettes.jpg?s=612x612&w=0&k=20&c=3cEZElLWuCSOXZtHTAIot8mIED1TF4IHIOEsekVlT8Y=',
                                          ),
                                          width: double.infinity,
                                          height: 115,
                                          fit: BoxFit.cover,
                                        ),
                                      );
                                    },
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8, 12, 0, 0),
                                    child: Text(
                                      wrapEventosRecord.nome!
                                          .maybeHandleOverflow(
                                        maxChars: 16,
                                        replacement: '…',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1,
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8, 4, 0, 0),
                                        child: Text(
                                          dateTimeFormat('d/M H:mm',
                                              wrapEventosRecord.dataHora!),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText2,
                                        ),
                                      ),
                                      if (valueOrDefault<bool>(
                                          currentUserDocument?.integrante,
                                          false))
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8, 4, 0, 0),
                                          child: AuthUserStreamWidget(
                                            child: Text(
                                              formatNumber(
                                                wrapEventosRecord.cache!,
                                                formatType: FormatType.custom,
                                                currency: 'R\$ ',
                                                format: '',
                                                locale: '',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText2,
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                    ).animateOnPageLoad(
                        animationsMap['wrapOnPageLoadAnimation']!);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
