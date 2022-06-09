import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:uni/model/entities/printing.dart';
import 'package:uni/view/Pages/new_printing_job_page_view.dart';
import 'package:uni/view/Widgets/generic_card.dart';
import 'package:uni/view/Widgets/page_title.dart';
import 'package:uni/view/Widgets/printing_card.dart';

class PrintingPageView extends StatelessWidget {
  final List<Printing> printings;
  final void Function(BuildContext, Map<String, dynamic>) onNewPrinting;

  PrintingPageView({Key key, @required this.printings, @required this.onNewPrinting });

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
            body: Row(children: [
              Expanded(
                child: printings.isEmpty
                    ? Text('Não há impressões para mostrar',
                        style: Theme.of(context).textTheme.bodyMedium,
                        textAlign: TextAlign.center)
                    : ListView.builder(
                        itemCount: printings.length,
                        itemBuilder: (context, index) => PrintingCard(printings[index])),
              )
            ]),
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () async {
                final file = await Printing.selectFile();
                if (file == null || file['path'] == null) {
                  return;
                }

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => NewPrintingJobPageView(
                          onSubmit: (context, data) {
                            onNewPrinting(context, {
                              ...data,
                              'filename': file['name'],
                              'filepath': file['path']
                            });
                          },
                        )));
              },
            ),
      ))
    ]);
  }
}
