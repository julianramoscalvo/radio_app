import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:radio_app/src/data/services/remote/radio_api.dart';
import '../config/constants/constants.dart';
import '../config/languages/generated/l10n.dart';
import '../config/theme/app_theme.dart';
import '../config/router.dart';
import '../data/repositories/remote/radio_repository.dart';
import '../utils/helpers/config.dart';
import 'app_bloc_observer.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await startService();
  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}

Future<void> startService() async {
  GetIt.I.registerSingleton<MyTheme>(MyTheme());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<RadioApiService>(
          create: (_) => RadioApiService(),
        ),
      ],
      child: Builder(builder: (context) {
        return MultiRepositoryProvider(
          providers: [
            RepositoryProvider(
              create: (_) => RadioRepository(
                apiService:
                    Provider.of<RadioApiService>(context, listen: false),
              ),
            ),
          ],
          child: MaterialApp.router(
            title: APP_NAME,
            debugShowCheckedModeBanner: false,
            themeMode: AppTheme.themeMode,
            theme: AppTheme.lightTheme(
              context: context,
            ),
            darkTheme: AppTheme.darkTheme(
              context: context,
            ),
            localizationsDelegates: const [
              L.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: L.delegate.supportedLocales,
            routerConfig: router,
          ),
        );
      }),
    );
  }
}
