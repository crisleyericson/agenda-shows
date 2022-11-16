import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_expanded_image_view.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

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
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 22,
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
            onPressed: () async {
              GoRouter.of(context).prepareAuthEvent();
              await signOut();

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
                )),
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
                    InkWell(
                      onTap: () async {
                        context.pushNamed('eventos');
                      },
                      child: Text(
                        'Ver Todos',
                        style: FlutterFlowTheme.of(context).bodyText1,
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
                          child: CircularProgressIndicator(
                            color: FlutterFlowTheme.of(context).primaryColor,
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
                                  InkWell(
                                    onTap: () async {
                                      await Navigator.push(
                                        context,
                                        PageTransition(
                                          type: PageTransitionType.fade,
                                          child: FlutterFlowExpandedImageView(
                                            image: Image.network(
                                              valueOrDefault<String>(
                                                wrapEventosRecord.flyer,
                                                'https://media.istockphoto.com/id/1255230725/pt/vetorial/music-band-concert-silhouettes.jpg?s=612x612&w=0&k=20&c=3cEZElLWuCSOXZtHTAIot8mIED1TF4IHIOEsekVlT8Y=',
                                              ),
                                              fit: BoxFit.contain,
                                            ),
                                            allowRotation: true,
                                            tag: valueOrDefault<String>(
                                              wrapEventosRecord.flyer,
                                              'https://media.istockphoto.com/id/1255230725/pt/vetorial/music-band-concert-silhouettes.jpg?s=612x612&w=0&k=20&c=3cEZElLWuCSOXZtHTAIot8mIED1TF4IHIOEsekVlT8Y=' +
                                                  '$wrapIndex',
                                            ),
                                            useHeroAnimation: true,
                                          ),
                                        ),
                                      );
                                    },
                                    child: Hero(
                                      tag: valueOrDefault<String>(
                                        wrapEventosRecord.flyer,
                                        'https://media.istockphoto.com/id/1255230725/pt/vetorial/music-band-concert-silhouettes.jpg?s=612x612&w=0&k=20&c=3cEZElLWuCSOXZtHTAIot8mIED1TF4IHIOEsekVlT8Y=' +
                                            '$wrapIndex',
                                      ),
                                      transitionOnUserGestures: true,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(
                                          valueOrDefault<String>(
                                            wrapEventosRecord.flyer,
                                            'https://media.istockphoto.com/id/1255230725/pt/vetorial/music-band-concert-silhouettes.jpg?s=612x612&w=0&k=20&c=3cEZElLWuCSOXZtHTAIot8mIED1TF4IHIOEsekVlT8Y=',
                                          ),
                                          width: double.infinity,
                                          height: 115,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
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
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8, 4, 0, 0),
                                        child: Text(
                                          formatNumber(
                                            wrapEventosRecord.cache!,
                                            formatType: FormatType.custom,
                                            currency: 'R\$ ',
                                            format: '',
                                            locale: '',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText2,
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
                    );
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
