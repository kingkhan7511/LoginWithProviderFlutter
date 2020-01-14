import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:iconfezz/Generics/appPref.dart';
import 'package:iconfezz/Models/Generic/CountryModel.dart';
import 'package:iconfezz/Models/Generic/languageModel.dart';
import 'package:iconfezz/PredefinedFiles/appConstatant.dart';
import 'package:iconfezz/PredefinedFiles/appLocalization.dart';
import 'package:iconfezz/Views/Anonymous/LoginByEmailPage.dart';
import 'package:iconfezz/Views/Widgets/CountryPickerDialog.dart';
import 'package:iconfezz/Views/Widgets/LanguagePickerDialog.dart';

class LangCountryPage extends StatefulWidget {
  static String tag = 'LangCountryPage';

  @override
  _LangCountryPageState createState() => _LangCountryPageState();
}

class _LangCountryPageState extends State<LangCountryPage> {
  CountryModel _selectedDialogCountry;
  LanguagesModel _selectedLanguage;

  bool isCountryDownloaded = true;
  bool isInternet = true;

  double _width = double.maxFinite;
  double _height = 50.0;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  AppLocalizations appLocalizations;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    appLocalizations = AppLocalizations.of(context);
    return SafeArea(
      bottom: false,
      child: Directionality(
        textDirection: isRightToLeft ? TextDirection.rtl : TextDirection.ltr,
        child: Scaffold(
          key: _scaffoldKey,
          resizeToAvoidBottomInset: false,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 100),
              Container(
                height: 100,
                child: Image.asset('assets/logo3.png', height: 100, width: 100),
              ),
              SizedBox(height: 50),
              Divider(
                color: Colors.green,
              ),
              _chooseLanguageCard(),
              Divider(
                color: Colors.green,
              ),
              _chooseCountryWidget(),
              Divider(
                color: Colors.green,
              ),
              // isInternet
              //     ? Container()
              //     : Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceAround,
              //         children: <Widget>[
              //           Text(appLocalizations.getMessageByLangAndKey(
              //               appLanguageCode, 'nic')),
              //           IconButton(
              //             icon: Icon(Icons.refresh),
              //             onPressed: _getCountries,
              //           ),
              //         ],
              //       ),
              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: _nextButton(),
              ),
              //SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }

  _nextButton() {
    return Container(
      width: _width,
      height: _height,
      child: RaisedButton(
        color: Colors.green,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            5.0,
          ),
        ),
        elevation: 10,
        onPressed: _selectedDialogCountry == null
            ? null
            : () {
                Navigator.pushNamed(context, LoginByEmailPage.tag);
              },
        child: Text(
          appLocalizations.getMessageByLangAndKey(appLanguageCode, 'nxt'),
          style: TextStyle(color: Colors.white, fontSize: appfontSize),
        ),
      ),
    );
  }

  _chooseCountryWidget() {
    return ListTile(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => CountryPickerDialog( 
            onItemSelect: (country) {
              setState(
                () {
                  _selectedDialogCountry = country;
                  String encodedCountry = json.encode(country.toString());
                  savePrefs('selected_Country', encodedCountry);
                },
              );
            },
          ),
        );
      },
      title: // isCountryDownloaded
          // ?
          Text(
        _selectedDialogCountry != null
            ? _selectedDialogCountry.countryName
            : appLocalizations.getMessageByLangAndKey(
                appLanguageCode, 'scntry'),
        style: TextStyle(color: Colors.green),
      ),
      // : Center(
      //     child: CircularProgressIndicator(),
      //   ),
      trailing: Icon(Icons.arrow_drop_down),
      leading: Container(
        height: 30.0,
        width: 40.0,
        child: _selectedDialogCountry != null
            ? CachedNetworkImage(
                fit: BoxFit.fitHeight,
                imageUrl: _selectedDialogCountry.flag,
                placeholder: (context, url) =>
                    Icon(Icons.flag, color: Colors.grey),
                errorWidget: (context, url, error) =>
                    Icon(Icons.error, color: Colors.red),
              )
            : Icon(Icons.flag, color: Colors.grey),
        margin: EdgeInsets.all(8.0),
      ),
    );
  }

  _chooseLanguageCard() {
    return ListTile(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => LanguagePickerDialog(
            onItemSelect: (language) {
              setState(
                () {
                  //_getCountries();
                  // to languages Id in Constant
                  appLanguageId = language.id;
                  appLanguageCode = language.code;
                  // to use in this file
                  _selectedLanguage = language;
                  //for direction
                  if (rtlLanguages.contains(language.id)) {
                    setState(() {
                      isRightToLeft = true;
                    });
                  } else {
                    isRightToLeft = false;
                  }
                  // Save in shared Pref
                  String encodedSelectedLanguage =
                      json.encode(language.toJson());
                  savePrefs('selected_language', encodedSelectedLanguage);
                  print(encodedSelectedLanguage);
                },
              );
            },
          ),
        );
      },
      title: Text(
        _selectedLanguage != null
            ? '${_selectedLanguage.name} - ${_selectedLanguage.nativeName}'
            : appLocalizations.getMessageByLangAndKey(
                appLanguageCode, 'slctlng'),
        style: TextStyle(color: Colors.green),
      ),
      trailing: Icon(Icons.arrow_drop_down),
      leading: Container(
        height: 30.0,
        width: 40.0,
        child: _selectedLanguage != null
            ? Icon(Icons.translate, color: Colors.green)
            : Icon(Icons.translate, color: Colors.grey),
        margin: EdgeInsets.all(8.0),
      ),
    );
  }

  // _getCountries() async {
  //   if (await _networkController.checkInternet()) {
  //     setState(() {
  //       isInternet = true;
  //       isCountryDownloaded = false;
  //     });
  //     BackendService.getCountries(appLanguageId).then((countriesData) {
  //       setState(() {
  //         _countries = [];
  //         _countries.addAll(countriesData);
  //         isCountryDownloaded = true;
  //       });
  //     });
  //   } else {
  //     if (isInternet) {
  //       setState(() {
  //         isInternet = false;
  //       });
  //     }
  //   }
  // }

}
