// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'projects_z_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ProjectsZRecord> _$projectsZRecordSerializer =
    new _$ProjectsZRecordSerializer();

class _$ProjectsZRecordSerializer
    implements StructuredSerializer<ProjectsZRecord> {
  @override
  final Iterable<Type> types = const [ProjectsZRecord, _$ProjectsZRecord];
  @override
  final String wireName = 'ProjectsZRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, ProjectsZRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.type;
    if (value != null) {
      result
        ..add('type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.whitepaper;
    if (value != null) {
      result
        ..add('whitepaper')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.reference;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    return result;
  }

  @override
  ProjectsZRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ProjectsZRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'whitepaper':
          result.whitepaper = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'Document__Reference__Field':
          result.reference = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
      }
    }

    return result.build();
  }
}

class _$ProjectsZRecord extends ProjectsZRecord {
  @override
  final String name;
  @override
  final String type;
  @override
  final String whitepaper;
  @override
  final String description;
  @override
  final DocumentReference<Object> reference;

  factory _$ProjectsZRecord([void Function(ProjectsZRecordBuilder) updates]) =>
      (new ProjectsZRecordBuilder()..update(updates)).build();

  _$ProjectsZRecord._(
      {this.name, this.type, this.whitepaper, this.description, this.reference})
      : super._();

  @override
  ProjectsZRecord rebuild(void Function(ProjectsZRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProjectsZRecordBuilder toBuilder() =>
      new ProjectsZRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProjectsZRecord &&
        name == other.name &&
        type == other.type &&
        whitepaper == other.whitepaper &&
        description == other.description &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, name.hashCode), type.hashCode), whitepaper.hashCode),
            description.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ProjectsZRecord')
          ..add('name', name)
          ..add('type', type)
          ..add('whitepaper', whitepaper)
          ..add('description', description)
          ..add('reference', reference))
        .toString();
  }
}

class ProjectsZRecordBuilder
    implements Builder<ProjectsZRecord, ProjectsZRecordBuilder> {
  _$ProjectsZRecord _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _type;
  String get type => _$this._type;
  set type(String type) => _$this._type = type;

  String _whitepaper;
  String get whitepaper => _$this._whitepaper;
  set whitepaper(String whitepaper) => _$this._whitepaper = whitepaper;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  ProjectsZRecordBuilder() {
    ProjectsZRecord._initializeBuilder(this);
  }

  ProjectsZRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _type = $v.type;
      _whitepaper = $v.whitepaper;
      _description = $v.description;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProjectsZRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ProjectsZRecord;
  }

  @override
  void update(void Function(ProjectsZRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ProjectsZRecord build() {
    final _$result = _$v ??
        new _$ProjectsZRecord._(
            name: name,
            type: type,
            whitepaper: whitepaper,
            description: description,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
