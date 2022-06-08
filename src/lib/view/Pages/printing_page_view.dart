import 'package:flutter/material.dart';
import 'package:uni/model/entities/printing.dart';
import 'package:uni/view/Pages/new_printing_page_view.dart';
import 'package:uni/view/Widgets/generic_card.dart';
import 'package:uni/view/Widgets/page_title.dart';
import 'package:uni/view/Widgets/printing_card.dart';

class PrintingPageView extends StatelessWidget {
  List<Printing> printings;

  PrintingPageView({Key key, @required this.printings});

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: <Widget>[PageTitle(name: 'Impressões')],
      ),
      Expanded(
        child: Scaffold(
        body: ListView.builder(
          itemCount: printings.length,
          itemBuilder: (context, index) => PrintingCard(printings[index])),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => NewPrintingPageView("iloveesof.pdf")));
            },
          ),
        )
      )
    ]);
  }
}
