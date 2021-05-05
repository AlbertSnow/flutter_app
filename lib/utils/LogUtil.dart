debugLog(String msg) {
  print("${LogUtil.DEBUG_TAG}: $msg");
}

errorLog(String msg) {
  print("${LogUtil.ERROR_TAG}: $msg");
}

class LogUtil {
  static const String DEBUG_TAG = "AlbertDebug";
  static const String ERROR_TAG = "AlbertError";
}
