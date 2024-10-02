enum Flavor { prod, dev }

class Env {
  final String baseURL;

  static const String _baseUrlProd = "https://production.endpoint.com";
  static const String _baseUrlDev = "https://developement.endpoint.com";

  static final Env instance = Env.of();

  const Env._({required this.baseURL});

  factory Env.of() {
    String flavor = const String.fromEnvironment('FLAVOR');
    if (flavor == Flavor.prod.name) {
      return Env._prod();
    } else {
      return Env._dev();
    }
  }

  factory Env._prod() {
    return const Env._(baseURL: _baseUrlProd);
  }

  factory Env._dev() {
    return const Env._(baseURL: _baseUrlDev);
  }
}
