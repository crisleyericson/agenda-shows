// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'locais_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<LocaisRecord> _$locaisRecordSerializer =
    new _$LocaisRecordSerializer();

class _$LocaisRecordSerializer implements StructuredSerializer<LocaisRecord> {
  @override
  final Iterable<Type> types = const [LocaisRecord, _$LocaisRecord];
  @override
  final String wireName = 'LocaisRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, LocaisRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.bairro;
    if (value != null) {
      result
        ..add('bairro')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.cidade;
    if (value != null) {
      result
        ..add('cidade')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.endereco;
    if (value != null) {
      result
        ..add('endereco')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.nomeContato;
    if (value != null) {
      result
        ..add('nomeContato')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.nomeLocal;
    if (value != null) {
      result
        ..add('nomeLocal')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.numero;
    if (value != null) {
      result
        ..add('numero')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.observacao;
    if (value != null) {
      result
        ..add('observacao')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.telefone;
    if (value != null) {
      result
        ..add('telefone')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.logomarca;
    if (value != null) {
      result
        ..add('logomarca')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
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
  LocaisRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new LocaisRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'bairro':
          result.bairro = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'cidade':
          result.cidade = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'endereco':
          result.endereco = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'nomeContato':
          result.nomeContato = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'nomeLocal':
          result.nomeLocal = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'numero':
          result.numero = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'observacao':
          result.observacao = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'telefone':
          result.telefone = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'logomarca':
          result.logomarca = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
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

class _$LocaisRecord extends LocaisRecord {
  @override
  final String? bairro;
  @override
  final String? cidade;
  @override
  final String? endereco;
  @override
  final String? nomeContato;
  @override
  final String? nomeLocal;
  @override
  final int? numero;
  @override
  final String? observacao;
  @override
  final String? telefone;
  @override
  final String? logomarca;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$LocaisRecord([void Function(LocaisRecordBuilder)? updates]) =>
      (new LocaisRecordBuilder()..update(updates))._build();

  _$LocaisRecord._(
      {this.bairro,
      this.cidade,
      this.endereco,
      this.nomeContato,
      this.nomeLocal,
      this.numero,
      this.observacao,
      this.telefone,
      this.logomarca,
      this.ffRef})
      : super._();

  @override
  LocaisRecord rebuild(void Function(LocaisRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LocaisRecordBuilder toBuilder() => new LocaisRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LocaisRecord &&
        bairro == other.bairro &&
        cidade == other.cidade &&
        endereco == other.endereco &&
        nomeContato == other.nomeContato &&
        nomeLocal == other.nomeLocal &&
        numero == other.numero &&
        observacao == other.observacao &&
        telefone == other.telefone &&
        logomarca == other.logomarca &&
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
                            $jc(
                                $jc(
                                    $jc($jc(0, bairro.hashCode),
                                        cidade.hashCode),
                                    endereco.hashCode),
                                nomeContato.hashCode),
                            nomeLocal.hashCode),
                        numero.hashCode),
                    observacao.hashCode),
                telefone.hashCode),
            logomarca.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'LocaisRecord')
          ..add('bairro', bairro)
          ..add('cidade', cidade)
          ..add('endereco', endereco)
          ..add('nomeContato', nomeContato)
          ..add('nomeLocal', nomeLocal)
          ..add('numero', numero)
          ..add('observacao', observacao)
          ..add('telefone', telefone)
          ..add('logomarca', logomarca)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class LocaisRecordBuilder
    implements Builder<LocaisRecord, LocaisRecordBuilder> {
  _$LocaisRecord? _$v;

  String? _bairro;
  String? get bairro => _$this._bairro;
  set bairro(String? bairro) => _$this._bairro = bairro;

  String? _cidade;
  String? get cidade => _$this._cidade;
  set cidade(String? cidade) => _$this._cidade = cidade;

  String? _endereco;
  String? get endereco => _$this._endereco;
  set endereco(String? endereco) => _$this._endereco = endereco;

  String? _nomeContato;
  String? get nomeContato => _$this._nomeContato;
  set nomeContato(String? nomeContato) => _$this._nomeContato = nomeContato;

  String? _nomeLocal;
  String? get nomeLocal => _$this._nomeLocal;
  set nomeLocal(String? nomeLocal) => _$this._nomeLocal = nomeLocal;

  int? _numero;
  int? get numero => _$this._numero;
  set numero(int? numero) => _$this._numero = numero;

  String? _observacao;
  String? get observacao => _$this._observacao;
  set observacao(String? observacao) => _$this._observacao = observacao;

  String? _telefone;
  String? get telefone => _$this._telefone;
  set telefone(String? telefone) => _$this._telefone = telefone;

  String? _logomarca;
  String? get logomarca => _$this._logomarca;
  set logomarca(String? logomarca) => _$this._logomarca = logomarca;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  LocaisRecordBuilder() {
    LocaisRecord._initializeBuilder(this);
  }

  LocaisRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _bairro = $v.bairro;
      _cidade = $v.cidade;
      _endereco = $v.endereco;
      _nomeContato = $v.nomeContato;
      _nomeLocal = $v.nomeLocal;
      _numero = $v.numero;
      _observacao = $v.observacao;
      _telefone = $v.telefone;
      _logomarca = $v.logomarca;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LocaisRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$LocaisRecord;
  }

  @override
  void update(void Function(LocaisRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  LocaisRecord build() => _build();

  _$LocaisRecord _build() {
    final _$result = _$v ??
        new _$LocaisRecord._(
            bairro: bairro,
            cidade: cidade,
            endereco: endereco,
            nomeContato: nomeContato,
            nomeLocal: nomeLocal,
            numero: numero,
            observacao: observacao,
            telefone: telefone,
            logomarca: logomarca,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
