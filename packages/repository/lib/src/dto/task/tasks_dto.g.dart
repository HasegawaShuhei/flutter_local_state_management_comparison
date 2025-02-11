// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasks_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TasksDtoImpl _$$TasksDtoImplFromJson(Map<String, dynamic> json) =>
    _$TasksDtoImpl(
      items: (json['items'] as List<dynamic>?)
              ?.map((e) => TaskDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$TasksDtoImplToJson(_$TasksDtoImpl instance) =>
    <String, dynamic>{
      'items': instance.items,
    };
