import 'package:flutter_presigned_url/data/api/api_client.dart';

class ApiRoutes {
  static const ApiConfig debugConfig = ApiConfig(
    scheme: 'http',
    host: 'veyleyapi.ddns.net',
    scope: scope,
  );

  static const String scope = '/api/v1';
}
