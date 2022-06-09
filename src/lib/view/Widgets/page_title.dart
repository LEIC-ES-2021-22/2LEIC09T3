import 'package:flutter/material.dart';

class PageTitle extends StatelessWidget {
  final String name;
  final Alignment alignment;

  const PageTitle({
    Key key,
    @required this.name,
    this.alignment = Alignment.center
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
      alignment: alignment,
      child:  Text(
        name,
        style: Theme.of(context).textTheme.headline6.apply(fontSizeDelta: 7),
      ),
    );
  }
}