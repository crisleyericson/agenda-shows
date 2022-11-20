import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'locais_record.g.dart';

abstract class LocaisRecord
    implements Built<LocaisRecord, LocaisRecordBuilder> {
  static Serializer<LocaisRecord> get serializer => _$locaisRecordSerializer;

  String? get bairro;

  String? get cidade;

  String? get endereco;

  String? get nomeContato;

  String? get nomeLocal;

  int? get numero;

  String? get observacao;

  String? get telefone;

  String? get logomarca;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(LocaisRecordBuilder builder) => builder
    ..bairro = ''
    ..cidade = ''
    ..endereco = ''
    ..nomeContato = ''
    ..nomeLocal = ''
    ..numero = 0
    ..observacao = ''
    ..telefone = ''
    ..logomarca = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('locais');

  static Stream<LocaisRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<LocaisRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  LocaisRecord._();
  factory LocaisRecord([void Function(LocaisRecordBuilder) updates]) =
      _$LocaisRecord;

  static LocaisRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createLocaisRecordData({
  String? bairro,
  String? cidade,
  String? endereco,
  String? nomeContato,
  String? nomeLocal,
  int? numero,
  String? observacao,
  String? telefone,
  String? logomarca,
}) {
  final firestoreData = serializers.toFirestore(
    LocaisRecord.serializer,
    LocaisRecord(
      (l) => l
        ..bairro = bairro
        ..cidade = cidade
        ..endereco = endereco
        ..nomeContato = nomeContato
        ..nomeLocal = nomeLocal
        ..numero = numero
        ..observacao = observacao
        ..telefone = telefone
        ..logomarca = logomarca,
    ),
  );

  return firestoreData;
}
