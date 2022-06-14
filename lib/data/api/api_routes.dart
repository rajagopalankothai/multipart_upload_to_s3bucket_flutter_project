import 'package:flutter_presigned_url/data/api/api_client.dart';

class ApiRoutes {
  static const ApiConfig debugConfig = ApiConfig(
    scheme: 'https',
    host: '89ae-110-172-132-147.ngrok.io',
    scope: scope,
  );

  static const String debugScope = '';
  static const String scope = '/api/v1';
}
