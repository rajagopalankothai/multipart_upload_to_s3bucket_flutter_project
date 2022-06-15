import 'package:flutter/material.dart';
import 'package:flutter_presigned_url/data/api/api_routes.dart';
import 'package:flutter_presigned_url/data/app_repository.dart';
import 'package:flutter_presigned_url/data/preference_client.dart';
import 'package:flutter_presigned_url/home_page.dart';
import 'package:flutter_presigned_url/middleware/middleware.dart';
import 'package:flutter_presigned_url/models/models.dart';
import 'package:flutter_presigned_url/reducer/reducers.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final AppRepository repository = AppRepository(
      preferencesClient: PreferencesClient(prefs: prefs),
      config: ApiRoutes.debugConfig);
  runApp(MyApp(repository: repository));
}

class MyApp extends StatefulWidget {
  MyApp({Key? key, required AppRepository repository})
      : store = Store<AppState>(reducer,
            middleware: middleware(repository),
            initialState: AppState.initState()),
        super(key: key);
  final Store<AppState> store;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  late Store<AppState> store;

  @override
  void initState() {
    super.initState();
    store = widget.store;
    WidgetsBinding.instance!.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: 'Flutter Pre-Signed URL Demo',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const MyHomePage(title: 'Flutter Pre-Signed URL Demo'),
      ),
    );
  }
}
