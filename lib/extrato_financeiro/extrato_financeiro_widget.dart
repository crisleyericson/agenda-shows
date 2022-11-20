import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ExtratoFinanceiroWidget extends StatefulWidget {
  const ExtratoFinanceiroWidget({Key? key}) : super(key: key);

  @override
  _ExtratoFinanceiroWidgetState createState() =>
      _ExtratoFinanceiroWidgetState();
}

class _ExtratoFinanceiroWidgetState extends State<ExtratoFinanceiroWidget> {
  PagingController<DocumentSnapshot?, FinanceiroRecord>? _pagingController;
  Query? _pagingQuery;
  List<StreamSubscription?> _streamSubscriptions = [];

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'extratoFinanceiro'});
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
          buttonSize: 46,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 24,
          ),
          onPressed: () async {
            logFirebaseEvent('EXTRATO_FINANCEIRO_arrow_back_rounded_IC');
            logFirebaseEvent('IconButton_navigate_to');

            context.pushNamed('home');
          },
        ),
        title: Text(
          'Extrato Financeiro',
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
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            if (valueOrDefault<bool>(currentUserDocument?.integrante, false))
              AuthUserStreamWidget(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 155,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).primaryColor,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 5,
                                color: Color(0x32171717),
                                offset: Offset(0, 2),
                              )
                            ],
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(16),
                              bottomRight: Radius.circular(16),
                              topLeft: Radius.circular(0),
                              topRight: Radius.circular(0),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 9),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20, 0, 20, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 4, 0, 0),
                                          child: Text(
                                            'Saldo em Caixa',
                                            style: FlutterFlowTheme.of(context)
                                                .title1
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: Colors.white,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20, 0, 20, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 12, 0, 0),
                                        child: StreamBuilder<
                                            List<FinanceiroRecord>>(
                                          stream: queryFinanceiroRecord(),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 50,
                                                  height: 50,
                                                  child: SpinKitRing(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryColor,
                                                    size: 50,
                                                  ),
                                                ),
                                              );
                                            }
                                            List<FinanceiroRecord>
                                                textFinanceiroRecordList =
                                                snapshot.data!;
                                            return Text(
                                              formatNumber(
                                                functions.saldoEmConta(
                                                    textFinanceiroRecordList
                                                        .toList()),
                                                formatType: FormatType.custom,
                                                currency: 'R\$ ',
                                                format: '',
                                                locale: '',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .title1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.white,
                                                        fontSize: 36,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20, 8, 20, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 4, 0),
                                            child: Text(
                                              'Entradas',
                                              textAlign: TextAlign.end,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText2
                                                  .override(
                                                    fontFamily: 'Poppins',
                                                    color: Color(0xB3FFFFFF),
                                                    fontWeight: FontWeight.w300,
                                                  ),
                                            ),
                                          ),
                                          StreamBuilder<List<FinanceiroRecord>>(
                                            stream: queryFinanceiroRecord(
                                              queryBuilder:
                                                  (financeiroRecord) =>
                                                      financeiroRecord.where(
                                                          'movimentacao',
                                                          isEqualTo: 'Entrada'),
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 50,
                                                    height: 50,
                                                    child: SpinKitRing(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryColor,
                                                      size: 50,
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<FinanceiroRecord>
                                                  textFinanceiroRecordList =
                                                  snapshot.data!;
                                              return Text(
                                                formatNumber(
                                                  functions.somarValores(
                                                      textFinanceiroRecordList
                                                          .toList()),
                                                  formatType: FormatType.custom,
                                                  currency: 'R\$ ',
                                                  format: '',
                                                  locale: '',
                                                ),
                                                textAlign: TextAlign.end,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .title3
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .customColor1,
                                                        ),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 4, 0),
                                            child: Text(
                                              'Saídas',
                                              textAlign: TextAlign.end,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText2
                                                  .override(
                                                    fontFamily: 'Poppins',
                                                    color: Color(0xB3FFFFFF),
                                                    fontWeight: FontWeight.w300,
                                                  ),
                                            ),
                                          ),
                                          StreamBuilder<List<FinanceiroRecord>>(
                                            stream: queryFinanceiroRecord(
                                              queryBuilder:
                                                  (financeiroRecord) =>
                                                      financeiroRecord.where(
                                                          'movimentacao',
                                                          isEqualTo: 'Saida'),
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 50,
                                                    height: 50,
                                                    child: SpinKitRing(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryColor,
                                                      size: 50,
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<FinanceiroRecord>
                                                  textFinanceiroRecordList =
                                                  snapshot.data!;
                                              return Text(
                                                formatNumber(
                                                  functions.somarValores(
                                                      textFinanceiroRecordList
                                                          .toList()),
                                                  formatType: FormatType.custom,
                                                  currency: 'R\$ ',
                                                  format: '',
                                                  locale: '',
                                                ),
                                                textAlign: TextAlign.end,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .title3
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color:
                                                              Color(0xFFFF0000),
                                                        ),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 12, 0, 0),
                                    child: Text(
                                      'Transações',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          PagedListView<DocumentSnapshot<Object?>?,
                              FinanceiroRecord>(
                            pagingController: () {
                              final Query<Object?> Function(Query<Object?>)
                                  queryBuilder = (financeiroRecord) =>
                                      financeiroRecord.orderBy('data',
                                          descending: true);
                              if (_pagingController != null) {
                                final query =
                                    queryBuilder(FinanceiroRecord.collection);
                                if (query != _pagingQuery) {
                                  // The query has changed
                                  _pagingQuery = query;
                                  _streamSubscriptions
                                      .forEach((s) => s?.cancel());
                                  _streamSubscriptions.clear();
                                  _pagingController!.refresh();
                                }
                                return _pagingController!;
                              }

                              _pagingController =
                                  PagingController(firstPageKey: null);
                              _pagingQuery =
                                  queryBuilder(FinanceiroRecord.collection);
                              _pagingController!
                                  .addPageRequestListener((nextPageMarker) {
                                queryFinanceiroRecordPage(
                                  queryBuilder: (financeiroRecord) =>
                                      financeiroRecord.orderBy('data',
                                          descending: true),
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
                                    final itemIndexes = _pagingController!
                                        .itemList!
                                        .asMap()
                                        .map((k, v) =>
                                            MapEntry(v.reference.id, k));
                                    data.forEach((item) {
                                      final index =
                                          itemIndexes[item.reference.id];
                                      final items =
                                          _pagingController!.itemList!;
                                      if (index != null) {
                                        items.replaceRange(
                                            index, index + 1, [item]);
                                        _pagingController!.itemList = {
                                          for (var item in items)
                                            item.reference: item
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
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            builderDelegate:
                                PagedChildBuilderDelegate<FinanceiroRecord>(
                              // Customize what your widget looks like when it's loading the first page.
                              firstPageProgressIndicatorBuilder: (_) => Center(
                                child: SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: SpinKitRing(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    size: 50,
                                  ),
                                ),
                              ),

                              itemBuilder: (context, _, listViewIndex) {
                                final listViewFinanceiroRecord =
                                    _pagingController!.itemList![listViewIndex];
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 8),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.92,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 3,
                                          color: Color(0x35000000),
                                          offset: Offset(0, 1),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        width: 1,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          4, 4, 4, 4),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8, 0, 0, 0),
                                            child: Card(
                                              clipBehavior:
                                                  Clip.antiAliasWithSaveLayer,
                                              color:
                                                  listViewFinanceiroRecord
                                                              .movimentacao ==
                                                          'Entrada'
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .customColor1
                                                      : Color(0xFFFF0000),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(40),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(8, 8, 8, 8),
                                                child: Icon(
                                                  Icons.attach_money_outlined,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  size: 24,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(12, 0, 0, 0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    listViewFinanceiroRecord
                                                        .descricao!,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .subtitle1,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 4, 0, 0),
                                                    child: Text(
                                                      listViewFinanceiroRecord
                                                          .movimentacao!,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12, 0, 12, 0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Text(
                                                  listViewFinanceiroRecord
                                                              .movimentacao ==
                                                          'Saida'
                                                      ? formatNumber(
                                                          listViewFinanceiroRecord
                                                              .valor!,
                                                          formatType:
                                                              FormatType.custom,
                                                          currency: 'R\$ -',
                                                          format: '',
                                                          locale: '',
                                                        )
                                                      : formatNumber(
                                                          listViewFinanceiroRecord
                                                              .valor!,
                                                          formatType:
                                                              FormatType.custom,
                                                          currency: 'R\$ ',
                                                          format: '',
                                                          locale: '',
                                                        ),
                                                  textAlign: TextAlign.end,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .subtitle2,
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 4, 0, 0),
                                                  child: Text(
                                                    dateTimeFormat(
                                                        'd/M/y',
                                                        listViewFinanceiroRecord
                                                            .data!),
                                                    textAlign: TextAlign.end,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .grayIcon,
                                                          fontSize: 12,
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
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            if (valueOrDefault<bool>(currentUserDocument?.integrante, false) ==
                false)
              AuthUserStreamWidget(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.8,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
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
                          logFirebaseEvent(
                              'EXTRATO_FINANCEIRO_PAGE_HOME_BTN_ON_TAP');
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
    );
  }
}
