import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:map_launcher/map_launcher.dart' as $ml;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class LocaisWidget extends StatefulWidget {
  const LocaisWidget({Key? key}) : super(key: key);

  @override
  _LocaisWidgetState createState() => _LocaisWidgetState();
}

class _LocaisWidgetState extends State<LocaisWidget> {
  PagingController<DocumentSnapshot?, LocaisRecord>? _pagingController;
  Query? _pagingQuery;
  List<StreamSubscription?> _streamSubscriptions = [];

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'locais'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _streamSubscriptions.forEach((s) => s?.cancel());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () async {
            logFirebaseEvent('LOCAIS_arrow_back_rounded_ICN_ON_TAP');
            logFirebaseEvent('IconButton_navigate_to');

            context.pushNamed('home');
          },
        ),
        title: Text(
          'Locais de Shows',
          textAlign: TextAlign.center,
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: FlutterFlowTheme.of(context).primaryBackground,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 2,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              if (valueOrDefault<bool>(currentUserDocument?.integrante, false))
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                  child: AuthUserStreamWidget(
                    child:
                        PagedListView<DocumentSnapshot<Object?>?, LocaisRecord>(
                      pagingController: () {
                        final Query<Object?> Function(Query<Object?>)
                            queryBuilder = (locaisRecord) => locaisRecord;
                        if (_pagingController != null) {
                          final query = queryBuilder(LocaisRecord.collection);
                          if (query != _pagingQuery) {
                            // The query has changed
                            _pagingQuery = query;
                            _streamSubscriptions.forEach((s) => s?.cancel());
                            _streamSubscriptions.clear();
                            _pagingController!.refresh();
                          }
                          return _pagingController!;
                        }

                        _pagingController =
                            PagingController(firstPageKey: null);
                        _pagingQuery = queryBuilder(LocaisRecord.collection);
                        _pagingController!
                            .addPageRequestListener((nextPageMarker) {
                          queryLocaisRecordPage(
                            queryBuilder: (locaisRecord) => locaisRecord,
                            nextPageMarker: nextPageMarker,
                            pageSize: 25,
                            isStream: true,
                          ).then((page) {
                            _pagingController!.appendPage(
                              page.data,
                              page.nextPageMarker,
                            );
                            final streamSubscription =
                                page.dataStream?.listen((data) {
                              final itemIndexes = _pagingController!.itemList!
                                  .asMap()
                                  .map((k, v) => MapEntry(v.reference.id, k));
                              data.forEach((item) {
                                final index = itemIndexes[item.reference.id];
                                final items = _pagingController!.itemList!;
                                if (index != null) {
                                  items.replaceRange(index, index + 1, [item]);
                                  _pagingController!.itemList = {
                                    for (var item in items) item.reference: item
                                  }.values.toList();
                                }
                              });
                              setState(() {});
                            });
                            _streamSubscriptions.add(streamSubscription);
                          });
                        });
                        return _pagingController!;
                      }(),
                      padding: EdgeInsets.zero,
                      primary: false,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      builderDelegate: PagedChildBuilderDelegate<LocaisRecord>(
                        // Customize what your widget looks like when it's loading the first page.
                        firstPageProgressIndicatorBuilder: (_) => Center(
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: SpinKitRing(
                              color: FlutterFlowTheme.of(context).primaryColor,
                              size: 50,
                            ),
                          ),
                        ),

                        itemBuilder: (context, _, listViewIndex) {
                          final listViewLocaisRecord =
                              _pagingController!.itemList![listViewIndex];
                          return Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 0, 16, 8),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 3,
                                    color: Color(0x430F1113),
                                    offset: Offset(0, 1),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12, 4, 12, 4),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Icon(
                                              Icons.person,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              size: 20,
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 4, 0, 0),
                                              child: Text(
                                                valueOrDefault<String>(
                                                  listViewLocaisRecord
                                                      .nomeContato,
                                                  'Contato do Local',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText2
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryColor,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Icon(
                                              Icons.phone,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              size: 20,
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 4, 0, 0),
                                              child: Text(
                                                valueOrDefault<String>(
                                                  listViewLocaisRecord.telefone,
                                                  'Telefone do Contato',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText2
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryColor,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.85,
                                    height: 1,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12, 4, 12, 4),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 4, 0, 0),
                                          child: Text(
                                            listViewLocaisRecord.nomeLocal!,
                                            style: FlutterFlowTheme.of(context)
                                                .subtitle1,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12, 4, 12, 4),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            valueOrDefault<String>(
                                              listViewLocaisRecord.observacao,
                                              'Sem observação para esse local.',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText2,
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
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12, 4, 12, 8),
                                      child: Wrap(
                                        spacing: 0,
                                        runSpacing: 0,
                                        alignment: WrapAlignment.start,
                                        crossAxisAlignment:
                                            WrapCrossAlignment.start,
                                        direction: Axis.horizontal,
                                        runAlignment: WrapAlignment.start,
                                        verticalDirection:
                                            VerticalDirection.down,
                                        clipBehavior: Clip.none,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    4, 0, 0, 0),
                                            child: InkWell(
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'LOCAIS_PAGE_Text_lnuvjie0_ON_TAP');
                                                logFirebaseEvent(
                                                    'Text_launch_map');
                                                await launchMap(
                                                  address:
                                                      '${listViewLocaisRecord.endereco}, ${listViewLocaisRecord.numero?.toString()} - ${listViewLocaisRecord.bairro} - ${listViewLocaisRecord.cidade}',
                                                  title: '',
                                                );
                                              },
                                              child: Text(
                                                '${listViewLocaisRecord.endereco}, ${listViewLocaisRecord.numero?.toString()} - ${listViewLocaisRecord.bairro} - ${listViewLocaisRecord.cidade}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
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
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              if (valueOrDefault<bool>(
                      currentUserDocument?.integrante, false) ==
                  false)
                AuthUserStreamWidget(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.8,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      shape: BoxShape.rectangle,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 25),
                          child: Text(
                            'Você não tem permissão para visualizar essa página.',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context).title1,
                          ),
                        ),
                        FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent('LOCAIS_PAGE_HOME_BTN_ON_TAP');
                            logFirebaseEvent('Button_navigate_to');

                            context.pushNamed('home');
                          },
                          text: 'Home',
                          icon: Icon(
                            Icons.arrow_back_outlined,
                            size: 15,
                          ),
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
                ),
            ],
          ),
        ),
      ),
    );
  }
}
