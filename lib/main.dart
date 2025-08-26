import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_route_app/providers/app_Language_Provider.dart';
import 'package:news_route_app/providers/app_theme_provider.dart';
import 'package:news_route_app/ui/home/home_screen.dart';
import 'package:news_route_app/utils/app_routes.dart';
import 'package:news_route_app/utils/app_themes.dart';
import 'package:news_route_app/utils/my_bloc_observer.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'l10n/app_localizations.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final savedLang = prefs.getString('language') ?? 'en';
  final savedTheme = prefs.getString('theme') == 'dark'
      ? ThemeMode.dark
      : ThemeMode.light;
  Bloc.observer = MyBlocObserver();

  runApp(
      MultiProvider(
      providers: [
      ChangeNotifierProvider(
      create: (_) => AppLanguageProvider()..setLanguage(savedLang),
  ),
  ChangeNotifierProvider(
  create: (_) => AppThemeProvider()..setTheme(savedTheme),
  ),],
      child: MyApp()));
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.homeScreenRouteName,
      routes: {
        AppRoutes.homeScreenRouteName : (context) => HomeScreen(),
      },
      locale: Locale(languageProvider.appLanguage),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: themeProvider.appTheme,
    );
  }
}
