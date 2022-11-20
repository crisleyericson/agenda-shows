// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'financeiro_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<FinanceiroRecord> _$financeiroRecordSerializer =
    new _$FinanceiroRecordSerializer();

class _$FinanceiroRecordSerializer
    implements StructuredSerializer<FinanceiroRecord> {
  @override
  final Iterable<Type> types = const [FinanceiroRecord, _$FinanceiroRecord];
  @override
  final String wireName = 'FinanceiroRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, FinanceiroRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.data;
    if (value != null) {
      result
        ..add('data')
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
    value = object.movimentacao;
    if (value != null) {
      result
        ..add('movimentacao')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.valor;
    if (value != null) {
      result
        ..add('valor')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
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
  FinanceiroRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FinanceiroRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'data':
          result.data = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'descricao':
          result.descricao = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'movimentacao':
          result.movimentacao = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'valor':
          result.valor = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
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

class _$FinanceiroRecord extends FinanceiroRecord {
  @override
  final DateTime? data;
  @override
  final String? descricao;
  @override
  final String? movimentacao;
  @override
  final double? valor;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$FinanceiroRecord(
          [void Function(FinanceiroRecordBuilder)? updates]) =>
      (new FinanceiroRecordBuilder()..update(updates))._build();

  _$FinanceiroRecord._(
      {this.data, this.descricao, this.movimentacao, this.valor, this.ffRef})
      : super._();

  @override
  FinanceiroRecord rebuild(void Function(FinanceiroRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FinanceiroRecordBuilder toBuilder() =>
      new FinanceiroRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FinanceiroRecord &&
        data == other.data &&
        descricao == other.descricao &&
        movimentacao == other.movimentacao &&
        valor == other.valor &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, data.hashCode), descricao.hashCode),
                movimentacao.hashCode),
            valor.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'FinanceiroRecord')
          ..add('data', data)
          ..add('descricao', descricao)
          ..add('movimentacao', movimentacao)
          ..add('valor', valor)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class FinanceiroRecordBuilder
    implements Builder<FinanceiroRecord, FinanceiroRecordBuilder> {
  _$FinanceiroRecord? _$v;

  DateTime? _data;
  DateTime? get data => _$this._data;
  set data(DateTime? data) => _$this._data = data;

  String? _descricao;
  String? get descricao => _$this._descricao;
  set descricao(String? descricao) => _$this._descricao = descricao;

  String? _movimentacao;
  String? get movimentacao => _$this._movimentacao;
  set movimentacao(String? movimentacao) => _$this._movimentacao = movimentacao;

  double? _valor;
  double? get valor => _$this._valor;
  set valor(double? valor) => _$this._valor = valor;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  FinanceiroRecordBuilder() {
    FinanceiroRecord._initializeBuilder(this);
  }

  FinanceiroRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data;
      _descricao = $v.descricao;
      _movimentacao = $v.movimentacao;
      _valor = $v.valor;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FinanceiroRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FinanceiroRecord;
  }

  @override
  void update(void Function(FinanceiroRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FinanceiroRecord build() => _build();

  _$FinanceiroRecord _build() {
    final _$result = _$v ??
        new _$FinanceiroRecord._(
            data: data,
            descricao: descricao,
            movimentacao: movimentacao,
            valor: valor,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
