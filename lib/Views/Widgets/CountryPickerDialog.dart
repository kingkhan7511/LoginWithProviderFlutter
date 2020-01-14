import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:iconfezz/Models/Generic/CountryModel.dart';
import 'package:iconfezz/PredefinedFiles/appConstatant.dart';
import 'package:iconfezz/PredefinedFiles/appLocalization.dart';

typedef ListItemSelect = void Function(CountryModel country);

class CountryPickerDialog extends StatefulWidget {
  final ListItemSelect onItemSelect;

  CountryPickerDialog({
    @required this.onItemSelect,
  });
  @override
  _CountryPickerDialogState createState() =>
      _CountryPickerDialogState(onItemSelect);
}

class _CountryPickerDialogState extends State<CountryPickerDialog> {
  List<CountryModel> _countries = [];
  List<CountryModel> _searchResult = [];
  ListItemSelect _onItemSelect;

  _CountryPickerDialogState(ListItemSelect onItemSelect) {
    _countries = CountryModel.fromJsonList(CountryModel.allCountries);
    _searchResult = CountryModel.fromJsonList(CountryModel.allCountries);
    _onItemSelect = onItemSelect;
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context);

    ///Country picker dialog
    return Directionality(
      textDirection: isRightToLeft ? TextDirection.rtl : TextDirection.ltr,
      child: AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Text(appLocalizations.getMessageByLangAndKey(
              appLanguageCode, 'slctcntry')),
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
                          Navigator.of(context).pop();
                          _onItemSelect(_searchResult[index]);
                        },
                        leading: Container(
                          height: 20.0,
                          width: 20.0,
                          child: CachedNetworkImage(
                            fit: BoxFit.fill,
                            imageUrl: _searchResult[index].flag,
                            placeholder: (context, url) =>
                                Icon(Icons.flag, color: Colors.purple),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error, color: Colors.red),
                          ),
                          margin: EdgeInsets.all(8.0),
                        ),
                        title: Text(
                          _searchResult[index].countryName,
                          style: TextStyle(fontSize: appfontSize),
                        ),
                      );
                    },
                  ),
                  flex: 10,
                )
              ],
            ),
          )),
    );
  }

  ///Search for a country
  void onSearchTextChanged(String text) {
    if (_countries.isEmpty) return;

    if (text.isEmpty) {
      setState(() {
        _searchResult = _countries;
      });
      return;
    } else {
      List<CountryModel> tempList = [];
      _countries.forEach((country) {
        if (country.countryName.toLowerCase().contains(text.toLowerCase())) {
          tempList.add(country);
        }
      });
      setState(() {
        _searchResult = tempList;
      });
    }
  }
}
