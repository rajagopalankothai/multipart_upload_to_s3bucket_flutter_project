import 'package:flutter/material.dart';
import 'package:flutter_presigned_url/data/api/api_client.dart';
import 'package:flutter_presigned_url/data/app_repository_provider.dart';
import 'package:flutter_presigned_url/data/preference_client.dart';
import 'package:flutter_presigned_url/data/services/api_service.dart';
import 'package:flutter_presigned_url/data/services/auth_service.dart';

class AppRepository {
  AppRepository({required this.preferencesClient, required this.config})
      : assert(preferencesClient != null && config != null) {
    apiClient = ApiClient(config: config!);
    services = <ApiService>[
      AuthService(client: apiClient!),
    ];
  }

  final PreferencesClient? preferencesClient;
  final ApiConfig? config;
  ApiClient? apiClient;
  List<ApiService>? services;

  static AppRepository of(BuildContext context) {
    final AppRepositoryProvider? provider =
        context.dependOnInheritedWidgetOfExactType<AppRepositoryProvider>();
    if (provider == null) {
      throw 'AppRepositoryProvider not found';
    }

    return provider.repository;
  }

  ApiService getService<T>() {
    return services!.firstWhere((ApiService s) => s is T);
  }
}
