import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:iconfezz/Generics/ConfezzValidator.dart';
import 'package:iconfezz/Generics/NetworkController.dart';
import 'package:iconfezz/Generics/appPref.dart';
import 'package:iconfezz/Models/ApiResponseModel.dart';
import 'package:iconfezz/Models/User/UserLoginModel.dart';
import 'package:iconfezz/PredefinedFiles/appConstatant.dart';
import 'package:iconfezz/PredefinedFiles/appLocalization.dart';
import 'package:iconfezz/Services/AnonymousServices.dart';
import 'package:iconfezz/Views/DashBoard/DashBoardPage.dart';
import 'package:progress_dialog/progress_dialog.dart';

class LoginProviderModel with ChangeNotifier {
  String _emailMobile;
  String _password;
  String _responseMessage;
  bool showMessage = false;
  String get getResponseMessage =>
      _responseMessage == null ? '' : _responseMessage;
  String get getEmail => _emailMobile == null ? '' : _emailMobile;
  String get getPassword => _password == null ? '' : _password;

  set setEmail(String email) {
    this._emailMobile = email;
  }

  set setPassowrd(String password) {
    this._password = password;
  }

  checkLogin(BuildContext context) async {
    _responseMessage = ConfezzValidator.validateEmail(context, _emailMobile);
    if (_responseMessage == null) {
      _responseMessage = ConfezzValidator.validatePassword(context, _password);
      if (_responseMessage == null) {
        bool isInternetConnected = await NetworkController.checkInternet();

        if (isInternetConnected) {
          _setIsLoading(context, true);

          Map<String, dynamic> body = {
            "AppLangId": appLanguageId,
            // add .trimRight because it was adding \t at the end in arabic lang
            "EmailMobile": _emailMobile,
            "Password": _password,
          };

          ApiResponseModel _apiResponseModel =
              await AnonymousService.postLogin(body);

          if (_apiResponseModel != null) {
            if (_apiResponseModel.statuscode == HTTP_OK) {
              String userModel = json.encode(_apiResponseModel.data);

              bool isSaved = await savePrefs('UserLoginModel', userModel);

              // save in constant
              userLoginModel = UserLoginModel.fromJson(_apiResponseModel.data);
              if (isSaved) {
                // remove progress bar
                _setIsLoading(context, false);

                Navigator.of(context).pushReplacementNamed(DashBoardPage.tag);
                print('Successfully Login');
                //don't remove this return other wise below
                //_setIsLoading(context, false);
                //will execute and the app will get crash
                return;
              } else {
                //unable to save data in pref
                _updateMessage(context, 'xcptn');
              }
            } else {
              // not successfully login
              _responseMessage = _apiResponseModel.message == null
                  ? AppLocalizations.of(context)
                      .getMessageByLangAndKey(appLanguageCode, 'emlphntrgsrd')
                  : _apiResponseModel.message;
              showMessage = true;
              notifyListeners();
            }
          } else {
            // exception message
            _updateMessage(context, 'xcptn');
          }
          _setIsLoading(context, false);
        } else {
          //no internet
          _updateMessage(context, 'nic');
          showMessage = true;
          notifyListeners();
        }
      } else {
        // invalida password
        showMessage = true;
        notifyListeners();
      }
    } else {
      //invalid email
      showMessage = true;
      notifyListeners();
    }
  }

  _updateMessage(BuildContext context, String key) {
    _responseMessage = AppLocalizations.of(context)
        .getMessageByLangAndKey(appLanguageCode, key);
    showMessage = true;
  }

  _setIsLoading(BuildContext context, bool condition) {
    ProgressDialog pr = new ProgressDialog(context,
        isDismissible: false, type: ProgressDialogType.Normal);
    if (condition) {
      pr.style(
          message: 'Please wait checking your credentails...',
          borderRadius: 10.0,
          backgroundColor: Colors.white,
          progressWidget: CircularProgressIndicator(),
          elevation: 10.0,
          insetAnimCurve: Curves.easeInOut,
          progress: 0.0,
          maxProgress: 100.0,
          progressTextStyle: TextStyle(color: Colors.black, fontSize: 8.0),
          messageTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 15.0,
          ));
      pr.show();
    } else {
      Navigator.pop(context);
    }
  }
}
