 
import 'package:flutter/material.dart';
import 'package:iconfezz/Models/Generic/languageModel.dart';
import 'package:iconfezz/PredefinedFiles/appConstatant.dart';
import 'package:iconfezz/PredefinedFiles/appLocalization.dart';

typedef ListItemSelect = void Function(LanguagesModel language);

class LanguagePickerDialog extends StatefulWidget { 
  final ListItemSelect onItemSelect;

  LanguagePickerDialog({ 
    @required this.onItemSelect,
  });
  @override
  _LanguagePickerDialogState createState() =>
      _LanguagePickerDialogState(  onItemSelect);
}

class _LanguagePickerDialogState extends State<LanguagePickerDialog> {
  List<LanguagesModel> _languages = [];
  List<LanguagesModel> _searchResult = [];
  ListItemSelect _onItemSelect;

  _LanguagePickerDialogState(  ListItemSelect onItemSelect) { 
    _onItemSelect = onItemSelect;
  }
  @override
  void initState() {
    
    _languages = LanguagesModel.fromJsonList(allLanguages);
    _searchResult = _languages;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context);

    ///Language picker dialog
    return Directionality(
      child: AlertDialog(
        shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
          title: Text(appLocalizations.getMessageByLangAndKey(
              appLanguageCode, 'slctlng')),
          content: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: <Widget>[
                TextField(
                  onChanged: onSearchTextChanged,
                  keyboardType: TextInputType.text,
                  autofocus: false,
                  decoration: InputDecoration(
                      hintText: appLocalizations.getMessageByLangAndKey(
                          appLanguageCode, 'srch'),
                      hintStyle: TextStyle(fontSize: appfontSize),
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(style: BorderStyle.solid))),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: _searchResult.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () {
                          Navigator.of(context).pop(
                            _onItemSelect(_searchResult[index]),
                          );
                        },
                        title: Text(
                          '${_searchResult[index].name} - ${_searchResult[index].nativeName}',
                        ),
                      );
                    },
                  ),
                  flex: 10,
                )
              ],
            ),
          )),
      textDirection: isRightToLeft ? TextDirection.rtl : TextDirection.ltr,
    );
  }

  ///Search for a Language
  void onSearchTextChanged(String text) {
    if (_languages.isEmpty) return; 
    if (text.isEmpty) {
      setState(() {
        _searchResult = _languages;
      });
      return;
    } else {
      List<LanguagesModel> tempList =[];
      _languages.forEach((language) {
        if (language.name.toLowerCase().contains(text.toLowerCase()) ||
            (language.nativeName.toLowerCase().contains(text.toLowerCase()))) {
          tempList.add(language);
        }
      });
      setState(() {
        _searchResult = tempList;
      });
    }
  }
}
