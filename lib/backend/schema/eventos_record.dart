import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'eventos_record.g.dart';

abstract class EventosRecord
    implements Built<EventosRecord, EventosRecordBuilder> {
  static Serializer<EventosRecord> get serializer => _$eventosRecordSerializer;

  int? get cache;

  DateTime? get dataHora;

  String? get descricao;

  DocumentReference? get local;

  String? get nome;

  String? get nomeContratante;

  String? get telefoneContratante;

  bool? get particular;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(EventosRecordBuilder builder) => builder
    ..cache = 0
    ..descricao = ''
    ..nome = ''
    ..nomeContratante = ''
    ..telefoneContratante = ''
    ..particular = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('eventos');

  static Stream<EventosRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<EventosRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  EventosRecord._();
  factory EventosRecord([void Function(EventosRecordBuilder) updates]) =
      _$EventosRecord;

  static EventosRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createEventosRecordData({
  int? cache,
  DateTime? dataHora,
  String? descricao,
  DocumentReference? local,
  String? nome,
  String? nomeContratante,
  String? telefoneContratante,
  bool? particular,
}) {
  final firestoreData = serializers.toFirestore(
    EventosRecord.serializer,
    EventosRecord(
      (e) => e
        ..cache = cache
        ..dataHora = dataHora
        ..descricao = descricao
        ..local = local
        ..nome = nome
        ..nomeContratante = nomeContratante
        ..telefoneContratante = telefoneContratante
        ..particular = particular,
    ),
  );

  return firestoreData;
}
