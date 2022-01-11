// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ModelConfig.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelConfig _$ModelConfigFromJson(Map<String, dynamic> json) {
  return ModelConfig()
    ..name = json['name'] as String
    ..remoteAddress = json['remoteAddress'] as String
    ..remoteServiceSNI = json['remoteServiceSNI'] as String
    ..port = json['port'] as String
    ..password = json['password'] as String
    ..isTurnOnIPv6 = json['isTurnOnIPv6'] as bool
    ..isConfirmCertificate = json['isConfirmCertificate'] as bool
    ..isFilterMainLandIPAddress = json['isFilterMainLandIPAddress'] as bool
    ..isAllowAccessLAN = json['isAllowAccessLAN'] as bool;
}

Map<String, dynamic> _$ModelConfigToJson(ModelConfig instance) =>
    <String, dynamic>{
      'name': instance.name,
      'remoteAddress': instance.remoteAddress,
      'remoteServiceSNI': instance.remoteServiceSNI,
      'port': instance.port,
      'password': instance.password,
      'isTurnOnIPv6': instance.isTurnOnIPv6,
      'isConfirmCertificate': instance.isConfirmCertificate,
      'isFilterMainLandIPAddress': instance.isFilterMainLandIPAddress,
      'isAllowAccessLAN': instance.isAllowAccessLAN,
    };
