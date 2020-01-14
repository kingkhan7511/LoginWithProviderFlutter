import 'package:flutter/material.dart';
import 'package:iconfezz/PredefinedFiles/appConstatant.dart';
import 'package:iconfezz/PredefinedFiles/appLocalization.dart';

class ConfezzValidator {
  ///Validate email entered
  static String validateEmail(BuildContext context, String value) {
    if (value == null) {
      // The form is empty
      return AppLocalizations.of(context)
          .getMessageByLangAndKey(appLanguageCode, 'eemlphn');
    }
    if (value.isEmpty) {
      // The form is empty
      return AppLocalizations.of(context)
          .getMessageByLangAndKey(appLanguageCode, 'eemlphn');
    }
    // This is just a regular expression for email addresses
    String p = "[a-zA-Z0-9\+\.\_\%\-\+]{1,256}" +
        "\\@" +
        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
        "(" +
        "\\." +
        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
        ")+";
    RegExp regExp = new RegExp(p);

    if (regExp.hasMatch(value) ||
        (value.contains(RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]')) &&
            value.length <= 12)) {
      // So, the email is valid
      return null;
    }
    // The pattern of the email didn't match the regex above.
    return AppLocalizations.of(context)
        .getMessageByLangAndKey(appLanguageCode, 'emlphntvld');
  }

  //Validate password
  static String validatePassword(BuildContext context, String value) {
    if (value == null) {
      // The form is empty
      return AppLocalizations.of(context)
          .getMessageByLangAndKey(appLanguageCode, 'etrpswrd');
    }
    if (value.isEmpty) {
      // The form is empty
      return AppLocalizations.of(context)
          .getMessageByLangAndKey(appLanguageCode, 'etrpswrd');
    }
    return null;
  }
}
