import 'package:flutter/material.dart';

class ConfezzAppBar extends StatelessWidget {
  final title;
  final searchIconVisibility;
  const ConfezzAppBar(this.title,this.searchIconVisibility, {Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 1,
      actions: <Widget>[
        Visibility(
          visible: searchIconVisibility,
          child: IconButton(
            icon: Icon(
              Icons.search,
              size: 35,
            ),
            onPressed: () {
              // showSearch(context: context, delegate: DataSearch());

              // TODO: need to imaplement logic
            },
          ),
        )
      ],
      flexibleSpace: Center(
        child: Text(
          title,
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
      ),
    ); // Size(double.infinity, 45),
  }
}
