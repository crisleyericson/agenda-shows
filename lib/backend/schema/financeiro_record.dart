import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'financeiro_record.g.dart';

abstract class FinanceiroRecord
    implements Built<FinanceiroRecord, FinanceiroRecordBuilder> {
  static Serializer<FinanceiroRecord> get serializer =>
      _$financeiroRecordSerializer;

  DateTime? get data;

  String? get descricao;

  String? get movimentacao;

  double? get valor;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(FinanceiroRecordBuilder builder) => builder
    ..descricao = ''
    ..movimentacao = ''
    ..valor = 0.0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('financeiro');

  static Stream<FinanceiroRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<FinanceiroRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  FinanceiroRecord._();
  factory FinanceiroRecord([void Function(FinanceiroRecordBuilder) updates]) =
      _$FinanceiroRecord;

  static FinanceiroRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createFinanceiroRecordData({
  DateTime? data,
  String? descricao,
  String? movimentacao,
  double? valor,
}) {
  final firestoreData = serializers.toFirestore(
    FinanceiroRecord.serializer,
    FinanceiroRecord(
      (f) => f
        ..data = data
        ..descricao = descricao
        ..movimentacao = movimentacao
        ..valor = valor,
    ),
  );

  return firestoreData;
}
