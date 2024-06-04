import 'package:json_annotation/json_annotation.dart';
part 'image.g.dart';

@JsonSerializable()
class Image {
  int id;
  String url;

  Image({required this.id, required this.url});

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);

  Map<String, dynamic> toJson() => _$ImageToJson(this);
}
