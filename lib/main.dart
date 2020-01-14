import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'PredefinedFiles/appConstatant.dart';
import 'PredefinedFiles/appLocalization.dart';
import 'Views/Anonymous/LangCountryPage.dart';
import 'Views/Anonymous/LoginByEmailPage.dart'; 
import 'Views/Anonymous/OnboardingPage.dart';
import 'Views/Anonymous/SplashScreen.dart';
import 'Views/DashBoard/DashBoardPage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(ConFezz());
}

class ConFezz extends StatefulWidget {
  @override
  _ConFezzState createState() => _ConFezzState();
}

//Entry point of an app
class _ConFezzState extends State<ConFezz> {
  Locale _locale;
  //Initial value before any selection is made

  //Routes to screen
  final routes = <String, WidgetBuilder>{
    LoginByEmailPage.tag: (context) => LoginByEmailPage(),

    DashBoardPage.tag: (context) => DashBoardPage(),
    LangCountryPage.tag: (context) => LangCountryPage(),
    OnboardingPage.tag: (context) => OnboardingPage(),

    // SignUpPage.tag: (context) => SignUpPage(),
    // PrivacyPolicyPage.tag: (context) => PrivacyPolicyPage(),
    // TermsConditionsPage.tag: (context) => TermsConditionsPage(),

    // ForgotPassword.tag: (context) => ForgotPassword(),
    // UpdatePasswordByCode.tag: (context) => UpdatePasswordByCode(),
    // ChatList.tag: (context) => ChatList(),
    // ChatScreen.tag: (context) => ChatScreen(),
    // RecorderPage.tag: (context) => RecorderPage(),
    // SavedPostsPage.tag: (context) => SavedPostsPage(),
    // BlockedListPage.tag: (context) => BlockedListPage(),
  };
  @override
  void initState() {
    super.initState();
    _locale = appLanguageId == 1 ? Locale('en') : Locale('ar');
  }

  @override
  Widget build(BuildContext context) {
    return DynamicTheme(
      defaultBrightness: Brightness.light,
      data: (brightness) => ThemeData(
        primarySwatch: Colors.green,
        buttonColor: Colors.black,
        accentColor: Colors.green,
        iconTheme: IconThemeData(color: Colors.black),
        brightness: brightness,
        // fontFamily: 'Almohanad',
      ),
      themedWidgetBuilder: (context, theme) {
        return MaterialApp(
          title: 'ConFezz',
          theme: theme,
          debugShowCheckedModeBanner: false,
          home: SplashScreenPage(),
          localizationsDelegates: [
            const AppLocalizationsDelegate(),
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: [
            const Locale('en', ''),
            const Locale('ar', ''),
          ],
          routes: routes,
          locale: _locale,
        );
      },
    );
  }
}
