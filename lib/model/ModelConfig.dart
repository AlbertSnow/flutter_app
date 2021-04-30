
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

  @override
  String toString() {
    return 'ModelConfig{name: $name, remoteAddress: $remoteAddress, remoteServiceSNI: $remoteServiceSNI, port: $port, password: $password, isTurnOnIPv6: $isTurnOnIPv6, isConfirmCertificate: $isConfirmCertificate, isFilterMainLandIPAddress: $isFilterMainLandIPAddress, isAllowAccessLAN: $isAllowAccessLAN}';
  }
}