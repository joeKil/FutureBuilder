import 'package:json_annotation/json_annotation.dart';

part 'album.g.dart';

@JsonSerializable(explicitToJson: true)
class AlbumDTO {
  final int userId;
  final int id;
  final String title;

  AlbumDTO({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory AlbumDTO.fromJson(Map<String, dynamic> json) => _$AlbumDTOFromJson(json);

  Map<String, dynamic> toJson() => _$AlbumDTOToJson(this);
}
