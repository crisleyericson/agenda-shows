// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'eventos_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<EventosRecord> _$eventosRecordSerializer =
    new _$EventosRecordSerializer();

class _$EventosRecordSerializer implements StructuredSerializer<EventosRecord> {
  @override
  final Iterable<Type> types = const [EventosRecord, _$EventosRecord];
  @override
  final String wireName = 'EventosRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, EventosRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.cache;
    if (value != null) {
      result
        ..add('cache')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.dataHora;
    if (value != null) {
      result
        ..add('dataHora')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.descricao;
    if (value != null) {
      result
        ..add('descricao')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.local;
    if (value != null) {
      result
        ..add('local')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.nome;
    if (value != null) {
      result
        ..add('nome')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.nomeContratante;
    if (value != null) {
      result
        ..add('nomeContratante')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.telefoneContratante;
    if (value != null) {
      result
        ..add('telefoneContratante')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.particular;
    if (value != null) {
      result
        ..add('particular')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  EventosRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new EventosRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'cache':
          result.cache = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'dataHora':
          result.dataHora = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'descricao':
          result.descricao = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'local':
          result.local = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'nome':
          result.nome = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'nomeContratante':
          result.nomeContratante = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'telefoneContratante':
          result.telefoneContratante = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'particular':
          result.particular = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$EventosRecord extends EventosRecord {
  @override
  final int? cache;
  @override
  final DateTime? dataHora;
  @override
  final String? descricao;
  @override
  final DocumentReference<Object?>? local;
  @override
  final String? nome;
  @override
  final String? nomeContratante;
  @override
  final String? telefoneContratante;
  @override
  final bool? particular;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$EventosRecord([void Function(EventosRecordBuilder)? updates]) =>
      (new EventosRecordBuilder()..update(updates))._build();

  _$EventosRecord._(
      {this.cache,
      this.dataHora,
      this.descricao,
      this.local,
      this.nome,
      this.nomeContratante,
      this.telefoneContratante,
      this.particular,
      this.ffRef})
      : super._();

  @override
  EventosRecord rebuild(void Function(EventosRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EventosRecordBuilder toBuilder() => new EventosRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EventosRecord &&
        cache == other.cache &&
        dataHora == other.dataHora &&
        descricao == other.descricao &&
        local == other.local &&
        nome == other.nome &&
        nomeContratante == other.nomeContratante &&
        telefoneContratante == other.telefoneContratante &&
        particular == other.particular &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc($jc($jc(0, cache.hashCode), dataHora.hashCode),
                                descricao.hashCode),
                            local.hashCode),
                        nome.hashCode),
                    nomeContratante.hashCode),
                telefoneContratante.hashCode),
            particular.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'EventosRecord')
          ..add('cache', cache)
          ..add('dataHora', dataHora)
          ..add('descricao', descricao)
          ..add('local', local)
          ..add('nome', nome)
          ..add('nomeContratante', nomeContratante)
          ..add('telefoneContratante', telefoneContratante)
          ..add('particular', particular)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class EventosRecordBuilder
    implements Builder<EventosRecord, EventosRecordBuilder> {
  _$EventosRecord? _$v;

  int? _cache;
  int? get cache => _$this._cache;
  set cache(int? cache) => _$this._cache = cache;

  DateTime? _dataHora;
  DateTime? get dataHora => _$this._dataHora;
  set dataHora(DateTime? dataHora) => _$this._dataHora = dataHora;

  String? _descricao;
  String? get descricao => _$this._descricao;
  set descricao(String? descricao) => _$this._descricao = descricao;

  DocumentReference<Object?>? _local;
  DocumentReference<Object?>? get local => _$this._local;
  set local(DocumentReference<Object?>? local) => _$this._local = local;

  String? _nome;
  String? get nome => _$this._nome;
  set nome(String? nome) => _$this._nome = nome;

  String? _nomeContratante;
  String? get nomeContratante => _$this._nomeContratante;
  set nomeContratante(String? nomeContratante) =>
      _$this._nomeContratante = nomeContratante;

  String? _telefoneContratante;
  String? get telefoneContratante => _$this._telefoneContratante;
  set telefoneContratante(String? telefoneContratante) =>
      _$this._telefoneContratante = telefoneContratante;

  bool? _particular;
  bool? get particular => _$this._particular;
  set particular(bool? particular) => _$this._particular = particular;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  EventosRecordBuilder() {
    EventosRecord._initializeBuilder(this);
  }

  EventosRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _cache = $v.cache;
      _dataHora = $v.dataHora;
      _descricao = $v.descricao;
      _local = $v.local;
      _nome = $v.nome;
      _nomeContratante = $v.nomeContratante;
      _telefoneContratante = $v.telefoneContratante;
      _particular = $v.particular;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EventosRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$EventosRecord;
  }

  @override
  void update(void Function(EventosRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EventosRecord build() => _build();

  _$EventosRecord _build() {
    final _$result = _$v ??
        new _$EventosRecord._(
            cache: cache,
            dataHora: dataHora,
            descricao: descricao,
            local: local,
            nome: nome,
            nomeContratante: nomeContratante,
            telefoneContratante: telefoneContratante,
            particular: particular,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
