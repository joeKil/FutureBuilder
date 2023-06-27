import 'package:json_annotation/json_annotation.dart';

part 'photo.g.dart';

@JsonSerializable(explicitToJson: true)
class PhotoDTO {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  PhotoDTO({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  factory PhotoDTO.fromJson(Map<String, dynamic> json) => _$PhotoDTOFromJson(json);

  Map<String, dynamic> toJson() => _$PhotoDTOToJson(this);
}
