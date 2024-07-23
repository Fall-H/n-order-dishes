class EnvConfig {
  final String appTitle;
  final String appDomain;
  final String baseUrl;
  final int connectTimeout;
  final int receiveTimeout;

  EnvConfig(
      {required this.appTitle,
      required this.appDomain,
      required this.baseUrl,
      required this.connectTimeout,
      required this.receiveTimeout});
}

// 获取的配置信息
class Env {
  // 获取到当前环境
  static const appEnv = String.fromEnvironment(EnvName.envKey);

  // 开发环境
  static final EnvConfig _debugConfig = EnvConfig(
      appTitle: "debugTitle",
      appDomain: "http://www.debugxxx.com",
      baseUrl: "http://localhost:8888",
      connectTimeout: 5000,
      receiveTimeout: 5000);

  // 发布环境
  static final EnvConfig _releaseConfig = EnvConfig(
      appTitle: "releaseTitle",
      appDomain: "http://www.releasexxx.com",
      baseUrl: "http://localhost:8888",
      connectTimeout: 5000,
      receiveTimeout: 5000);

  // 测试环境
  static final EnvConfig _testConfig = EnvConfig(
      appTitle: "testTitle",
      appDomain: "http://www.testxxx.com",
      baseUrl: "http://localhost:8888",
      connectTimeout: 5000,
      receiveTimeout: 5000);

  static EnvConfig get envConfig => _getEnvConfig();

// 根据不同环境返回对应的环境配置
  static EnvConfig _getEnvConfig() {
    switch (appEnv) {
      case EnvName.debug:
        return _debugConfig;
      case EnvName.release:
        return _releaseConfig;
      case EnvName.test:
        return _testConfig;
      default:
        return _debugConfig;
    }
  }
}

// 声明的环境
abstract class EnvName {
  // 环境key
  static const String envKey = "DART_DEFINE_APP_ENV";

  // 环境value
  static const String debug = "debug";
  static const String release = "release";
  static const String test = "test";
}
