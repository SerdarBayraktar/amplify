/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, annotate_overrides, dead_code, dead_codepublic_member_api_docs, depend_on_referenced_packages, file_names, library_private_types_in_public_api, no_leading_underscores_for_library_prefixes, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, null_check_on_nullable_type_parameter, prefer_adjacent_string_concatenation, prefer_const_constructors, prefer_if_null_operators, prefer_interpolation_to_compose_strings, slash_for_doc_comments, sort_child_properties_last, unnecessary_const, unnecessary_constructor_name, unnecessary_late, unnecessary_new, unnecessary_null_aware_assignments, unnecessary_nullable_for_final_variable_declarations, unnecessary_string_interpolations, use_build_context_synchronously

import 'package:amplify_core/amplify_core.dart';
import 'package:flutter/foundation.dart';

/** This is an auto generated class representing the Homework type in your schema. */
@immutable
class Homework extends Model {
  static const classType = const _HomeworkModelType();
  final String? id;
  final String? book;
  final String? teacher;
  final int? time;
  final int? pageStart;
  final int? pageEnd;
  final int? startDateTime;
  final String? teacherNote;
  final bool? isFinished;
  final TemporalDateTime? createdAt;
  final TemporalDateTime? updatedAt;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id!;
  }

  const Homework._internal(
      {@required this.id,
      @required this.book,
      @required this.teacher,
      @required this.time,
      @required this.pageStart,
      @required this.pageEnd,
      @required this.startDateTime,
      this.teacherNote,
      this.isFinished,
      this.createdAt,
      this.updatedAt});

  factory Homework(
      {String? id,
      @required String? book,
      @required String? teacher,
      @required int? time,
      @required int? pageStart,
      @required int? pageEnd,
      @required int? startDateTime,
        String? teacherNote,
      bool? isFinished}) {
    return Homework._internal(
        id: id == null ? UUID.getUUID() : id,
        book: book,
        teacher: teacher,
        time: time,
        pageStart: pageStart,
        pageEnd: pageEnd,
        startDateTime: startDateTime,
        teacherNote: teacherNote,
        isFinished: isFinished);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Homework &&
        id == other.id &&
        book == other.book &&
        teacher == other.teacher &&
        time == other.time &&
        pageStart == other.pageStart &&
        pageEnd == other.pageEnd &&
        startDateTime == other.startDateTime &&
        teacherNote == other.teacherNote &&
        isFinished == other.isFinished;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("Homework {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("book=" + "$book" + ", ");
    buffer.write("teacher=" + "$teacher" + ", ");
    buffer.write("time=" + (time != null ? time.toString() : "null") + ", ");
    buffer.write("pageStart=" +
        (pageStart != null ? pageStart.toString() : "null") +
        ", ");
    buffer.write(
        "pageEnd=" + (pageEnd != null ? pageEnd.toString() : "null") + ", ");
    buffer.write("startDateTime=" +
        (startDateTime != null ? startDateTime.toString() : "null") +
        ", ");
    buffer.write("teacherNote=" + "$teacherNote" + ", ");
    buffer.write("isFinished=" +
        (isFinished != null ? isFinished.toString() : "null") +
        ", ");
    buffer.write("createdAt=" +
        (createdAt != null ? createdAt!.format() : "null") +
        ", ");
    buffer.write(
        "updatedAt=" + (updatedAt != null ? updatedAt!.format() : "null"));
    buffer.write("}");

    return buffer.toString();
  }

  Homework copyWith(
      {String? id,
        String? book,
        String? teacher,
        int? time,
        int? pageStart,
        int? pageEnd,
        int? startDateTime,
        String? teacherNote,
      bool? isFinished}) {
    return Homework._internal(
        id: id ?? this.id,
        book: book ?? this.book,
        teacher: teacher ?? this.teacher,
        time: time ?? this.time,
        pageStart: pageStart ?? this.pageStart,
        pageEnd: pageEnd ?? this.pageEnd,
        startDateTime: startDateTime ?? this.startDateTime,
        teacherNote: teacherNote ?? this.teacherNote,
        isFinished: isFinished ?? this.isFinished);
  }

  Homework.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        book = json['book'],
        teacher = json['teacher'],
        time = (json['time'] as num)?.toInt(),
        pageStart = (json['pageStart'] as num)?.toInt(),
        pageEnd = (json['pageEnd'] as num)?.toInt(),
        startDateTime = (json['startDateTime'] as num)?.toInt(),
        teacherNote = json['teacherNote'],
        isFinished = json['isFinished'],
        createdAt = json['createdAt'] != null
            ? TemporalDateTime.fromString(json['createdAt'])
            : null,
        updatedAt = json['updatedAt'] != null
            ? TemporalDateTime.fromString(json['updatedAt'])
            : null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'book': book,
        'teacher': teacher,
        'time': time,
        'pageStart': pageStart,
        'pageEnd': pageEnd,
        'startDateTime': startDateTime,
        'teacherNote': teacherNote,
        'isFinished': isFinished,
        'createdAt': createdAt?.format(),
        'updatedAt': updatedAt?.format()
      };

  static final QueryField ID = QueryField(fieldName: "homework.id");
  static final QueryField BOOK = QueryField(fieldName: "book");
  static final QueryField TEACHER = QueryField(fieldName: "teacher");
  static final QueryField TIME = QueryField(fieldName: "time");
  static final QueryField PAGESTART = QueryField(fieldName: "pageStart");
  static final QueryField PAGEEND = QueryField(fieldName: "pageEnd");
  static final QueryField STARTDATETIME =
      QueryField(fieldName: "startDateTime");
  static final QueryField TEACHERNOTE = QueryField(fieldName: "teacherNote");
  static final QueryField ISFINISHED = QueryField(fieldName: "isFinished");
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Homework";
    modelSchemaDefinition.pluralName = "Homework";

    modelSchemaDefinition.authRules = [
      AuthRule(authStrategy: AuthStrategy.PUBLIC, operations: [
        ModelOperation.CREATE,
        ModelOperation.UPDATE,
        ModelOperation.DELETE,
        ModelOperation.READ
      ])
    ];

    modelSchemaDefinition.addField(ModelFieldDefinition.id());

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Homework.BOOK,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Homework.TEACHER,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Homework.TIME,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.int)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Homework.PAGESTART,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.int)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Homework.PAGEEND,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.int)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Homework.STARTDATETIME,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.int)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Homework.TEACHERNOTE,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Homework.ISFINISHED,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.bool)));

    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
        fieldName: 'createdAt',
        isRequired: false,
        isReadOnly: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)));

    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
        fieldName: 'updatedAt',
        isRequired: false,
        isReadOnly: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)));
  });
}

class _HomeworkModelType extends ModelType<Homework> {
  const _HomeworkModelType();

  @override
  Homework fromJson(Map<String, dynamic> jsonData) {
    return Homework.fromJson(jsonData);
  }
}
