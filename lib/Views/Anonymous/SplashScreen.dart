import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:iconfezz/Generics/appPref.dart';
import 'package:iconfezz/Models/Generic/languageModel.dart';
import 'package:iconfezz/Models/User/UserLoginModel.dart';
import 'package:iconfezz/PredefinedFiles/appConstatant.dart';
import 'package:iconfezz/PredefinedFiles/appLocalization.dart';
import 'package:iconfezz/Views/DashBoard/DashBoardPage.dart';
import 'LoginByEmailPage.dart';
import 'OnboardingPage.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({Key key}) : super(key: key);

  _readDataFromSharedPref(BuildContext context) async {
    await Future.delayed(Duration(seconds: 2));
    // don't remove this
    var _selectedCountry = await getpreferences('selected_Country');
    if (_selectedCountry == null) {
      Navigator.pushReplacementNamed(context, OnboardingPage.tag);
      return;
    }
    var _selectedLanguage = await getpreferences('selected_language');
    if (_selectedCountry == null) {
      appLanguageId = 1;
      isRightToLeft = false;
      Navigator.pushReplacementNamed(context, OnboardingPage.tag);
      return;
    } else {
      LanguagesModel languagesModel =
          LanguagesModel.fromJson(json.decode(_selectedLanguage));
      if (rtlLanguages.contains(languagesModel.id)) {
        isRightToLeft = true;
      } else {
        isRightToLeft = false;
      }
      appLanguageCode = languagesModel.code;
    }

    var userLoggedIn = await getpreferences('UserLoginModel');
    if (userLoggedIn == null) {
      Navigator.pushReplacementNamed(context, LoginByEmailPage.tag);
      return;
    } else {
      userLoginModel = UserLoginModel.fromJson(json.decode(userLoggedIn));
      Navigator.pushReplacementNamed(context, DashBoardPage.tag);
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context);

    _readDataFromSharedPref(context);

    return _buildBody(appLocalizations);
  }

  _buildBody(AppLocalizations appLocalizations) {
    return SafeArea(
      bottom: false,
      child: Directionality(
        textDirection: isRightToLeft ? TextDirection.rtl : TextDirection.ltr,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 6,
                child: Center(child: Image.asset('assets/logo3.png')),
              ),
              Expanded(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      '© 2019 ConFezz Company.' +
                          appLocalizations.getMessageByLangAndKey(
                              appLanguageCode, 'allrghtsrsrvd'),
                      style: TextStyle(fontSize: 12.0, color: Colors.green),
                    ),
                  )),
              SizedBox(
                height: 30.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
