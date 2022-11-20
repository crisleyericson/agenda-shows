import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:map_launcher/map_launcher.dart' as $ml;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class DetalheEventoWidget extends StatefulWidget {
  const DetalheEventoWidget({
    Key? key,
    this.evento,
  }) : super(key: key);

  final EventosRecord? evento;

  @override
  _DetalheEventoWidgetState createState() => _DetalheEventoWidgetState();
}

class _DetalheEventoWidgetState extends State<DetalheEventoWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'detalhe_evento'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<LocaisRecord>(
      stream: LocaisRecord.getDocument(widget.evento!.local!),
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
        final detalheEventoLocaisRecord = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          body: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Stack(
                          children: [
                            Image.network(
                              valueOrDefault<String>(
                                detalheEventoLocaisRecord.logomarca,
                                'https://media.istockphoto.com/id/1255230725/pt/vetorial/music-band-concert-silhouettes.jpg?s=612x612&w=0&k=20&c=3cEZElLWuCSOXZtHTAIot8mIED1TF4IHIOEsekVlT8Y=',
                              ),
                              width: double.infinity,
                              height: 300,
                              fit: BoxFit.cover,
                            ),
                            Align(
                              alignment: AlignmentDirectional(0, 0),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 90,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xB3090F13),
                                      Color(0x00090F13)
                                    ],
                                    stops: [0, 1],
                                    begin: AlignmentDirectional(0, -1),
                                    end: AlignmentDirectional(0, 1),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16, 40, 16, 16),
                              child: InkWell(
                                onTap: () async {
                                  logFirebaseEvent(
                                      'DETALHE_EVENTO_backArrowCircle_ON_TAP');
                                  logFirebaseEvent(
                                      'backArrowCircle_navigate_back');
                                  context.pop();
                                },
                                child: Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  color: FlutterFlowTheme.of(context).black600,
                                  elevation: 3,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        4, 4, 4, 4),
                                    child: Icon(
                                      Icons.arrow_back_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      size: 24,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(12, 16, 12, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              if (valueOrDefault<bool>(
                                      currentUserDocument?.integrante, false) ==
                                  true)
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 4, 0, 4),
                                  child: AuthUserStreamWidget(
                                    child: Text(
                                      'Cachê: ${formatNumber(
                                        widget.evento!.cache,
                                        formatType: FormatType.custom,
                                        currency: 'R\$ ',
                                        format: '',
                                        locale: '',
                                      )}',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText2
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.87,
                          height: 1,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).grayIcon,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 4),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                                child: AutoSizeText(
                                  widget.evento!.nome!,
                                  textAlign: TextAlign.start,
                                  maxLines: 1,
                                  style: FlutterFlowTheme.of(context).title2,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              if (valueOrDefault<bool>(
                                  currentUserDocument?.integrante, false))
                                Expanded(
                                  child: AuthUserStreamWidget(
                                    child: Text(
                                      valueOrDefault<String>(
                                        widget.evento!.descricao,
                                        'Sem Descrição do Evento',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText2,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 8),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 4),
                                    child: Icon(
                                      Icons.schedule,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                      size: 20,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        4, 0, 0, 0),
                                    child: Text(
                                      dateTimeFormat(
                                          'd/M H:mm', widget.evento!.dataHora!),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                              if (valueOrDefault<bool>(
                                      currentUserDocument?.integrante, false) ||
                                  !widget.evento!.particular!)
                                AuthUserStreamWidget(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24, 0, 0, 4),
                                        child: Icon(
                                          Icons.location_on_sharp,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          size: 20,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            4, 0, 0, 0),
                                        child: InkWell(
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'DETALHE_EVENTO_PAGE_Text-Location_ON_TAP');
                                            logFirebaseEvent(
                                                'Text-Location_launch_map');
                                            await launchMap(
                                              mapType: $ml.MapType.waze,
                                              address:
                                                  '${detalheEventoLocaisRecord.endereco} ${detalheEventoLocaisRecord.numero?.toString()} ${detalheEventoLocaisRecord.bairro} ${detalheEventoLocaisRecord.cidade}',
                                              title: '',
                                            );
                                          },
                                          child: Text(
                                            'Abrir endereço no Waze',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryColor,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 4, 0, 4),
                                child: Text(
                                  'Endereço',
                                  style: FlutterFlowTheme.of(context).bodyText2,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(12, 0, 12, 4),
                            child: Wrap(
                              spacing: 0,
                              runSpacing: 0,
                              alignment: WrapAlignment.start,
                              crossAxisAlignment: WrapCrossAlignment.start,
                              direction: Axis.horizontal,
                              runAlignment: WrapAlignment.start,
                              verticalDirection: VerticalDirection.down,
                              clipBehavior: Clip.antiAlias,
                              children: [
                                Visibility(
                                  visible: valueOrDefault<bool>(
                                          currentUserDocument?.integrante,
                                          false) ||
                                      !widget.evento!.particular!,
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 4, 0, 4),
                                    child: AuthUserStreamWidget(
                                      child: Text(
                                        '${detalheEventoLocaisRecord.endereco}, ${detalheEventoLocaisRecord.numero.toString()} - ${detalheEventoLocaisRecord.bairro} - ${detalheEventoLocaisRecord.cidade}',
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1,
                                      ),
                                    ),
                                  ),
                                ),
                                Visibility(
                                  visible: !valueOrDefault<bool>(
                                          currentUserDocument?.integrante,
                                          false) &&
                                      widget.evento!.particular!,
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 4, 0, 4),
                                    child: AuthUserStreamWidget(
                                      child: Text(
                                        '*** Evento Particular ***',
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 4, 0, 4),
                                child: Text(
                                  'Local do Evento',
                                  style: FlutterFlowTheme.of(context).bodyText2,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 4),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 4, 0, 4),
                                  child: Text(
                                    detalheEventoLocaisRecord.nomeLocal!,
                                    textAlign: TextAlign.start,
                                    style:
                                        FlutterFlowTheme.of(context).bodyText1,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 4, 0, 4),
                                child: Text(
                                  'Nome do Contratante',
                                  style: FlutterFlowTheme.of(context).bodyText2,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 4),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              if (valueOrDefault<bool>(
                                  currentUserDocument?.integrante, false))
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 4, 0, 4),
                                    child: AuthUserStreamWidget(
                                      child: Text(
                                        widget.evento!.nomeContratante!,
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1,
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 4, 0, 4),
                                child: Text(
                                  'Telefone do Contratante',
                                  style: FlutterFlowTheme.of(context).bodyText2,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 4),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              if (valueOrDefault<bool>(
                                  currentUserDocument?.integrante, false))
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 4, 0, 4),
                                    child: AuthUserStreamWidget(
                                      child: Text(
                                        widget.evento!.telefoneContratante!,
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1,
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 4, 0, 4),
                                child: Text(
                                  'Observação do Local',
                                  style: FlutterFlowTheme.of(context).bodyText2,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 4),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              if (valueOrDefault<bool>(
                                  currentUserDocument?.integrante, false))
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 4, 0, 4),
                                    child: AuthUserStreamWidget(
                                      child: Text(
                                        detalheEventoLocaisRecord.observacao!,
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1,
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
