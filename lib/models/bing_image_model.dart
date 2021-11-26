import 'package:json_annotation/json_annotation.dart';

part 'bing_image_model.g.dart';

@JsonSerializable()
class BingImageModel {
  String? url;
  String? startdate;
  String? copyright;

  BingImageModel({this.url, this.startdate, this.copyright});

  factory BingImageModel.fromJson(Map<String, dynamic> json) {
    return _$BingImageModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BingImageModelToJson(this);
}
