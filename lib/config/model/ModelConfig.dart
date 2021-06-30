import 'package:json_annotation/json_annotation.dart';

part 'ModelConfig.g.dart';

@JsonSerializable()
class ModelConfig {
  String name = "";
  String remoteAddress = "";
  String remoteServiceSNI = "";
  String port = "";
  String password = "";

  bool isTurnOnIPv6 = true;
  bool isConfirmCertificate = false;
  bool isFilterMainLandIPAddress = false;
  bool isAllowAccessLAN = true;

  ModelConfig();

  // ModelConfig(
  //     this.name,
  //     this.remoteAddress,
  //     this.remoteServiceSNI,
  //     this.port,
  //     this.password,
  //     this.isTurnOnIPv6,
  //     this.isConfirmCertificate,
  //     this.isFilterMainLandIPAddress,
  //     this.isAllowAccessLAN);

  @override
  String toString() {
    return 'ModelConfig{name: $name, remoteAddress: $remoteAddress, remoteServiceSNI: $remoteServiceSNI, port: $port, password: $password, isTurnOnIPv6: $isTurnOnIPv6, isConfirmCertificate: $isConfirmCertificate, isFilterMainLandIPAddress: $isFilterMainLandIPAddress, isAllowAccessLAN: $isAllowAccessLAN}';
  }

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory ModelConfig.fromJson(Map<String, dynamic> json) => _$ModelConfigFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$ModelConfigToJson(this);

}