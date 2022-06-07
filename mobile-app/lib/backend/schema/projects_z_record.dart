import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'projects_z_record.g.dart';

abstract class ProjectsZRecord
    implements Built<ProjectsZRecord, ProjectsZRecordBuilder> {
  static Serializer<ProjectsZRecord> get serializer =>
      _$projectsZRecordSerializer;

  @nullable
  String get name;

  @nullable
  String get type;

  @nullable
  String get whitepaper;

  @nullable
  String get description;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(ProjectsZRecordBuilder builder) => builder
    ..name = ''
    ..type = ''
    ..whitepaper = ''
    ..description = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('projectsZ');

  static Stream<ProjectsZRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<ProjectsZRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  ProjectsZRecord._();
  factory ProjectsZRecord([void Function(ProjectsZRecordBuilder) updates]) =
      _$ProjectsZRecord;

  static ProjectsZRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createProjectsZRecordData({
  String name,
  String type,
  String whitepaper,
  String description,
}) =>
    serializers.toFirestore(
        ProjectsZRecord.serializer,
        ProjectsZRecord((p) => p
          ..name = name
          ..type = type
          ..whitepaper = whitepaper
          ..description = description));
