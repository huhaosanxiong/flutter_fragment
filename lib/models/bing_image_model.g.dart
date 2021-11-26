// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bing_image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BingImageModel _$BingImageModelFromJson(Map<String, dynamic> json) =>
    BingImageModel(
      url: json['url'] as String?,
      startdate: json['startdate'] as String?,
      copyright: json['copyright'] as String?,
    );

Map<String, dynamic> _$BingImageModelToJson(BingImageModel instance) =>
    <String, dynamic>{
      'url': instance.url,
      'startdate': instance.startdate,
      'copyright': instance.copyright,
    };
