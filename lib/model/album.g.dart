// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlbumDTO _$AlbumDTOFromJson(Map<String, dynamic> json) => AlbumDTO(
      userId: json['userId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
    );

Map<String, dynamic> _$AlbumDTOToJson(AlbumDTO instance) => <String, dynamic>{
      'userId': instance.userId,
      'id': instance.id,
      'title': instance.title,
    };
