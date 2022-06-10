import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:uni/model/entities/printing.dart';
import 'package:uni/model/entities/printing_job.dart';
import 'package:uni/view/Pages/new_printing_job_page_view.dart';
import 'package:uni/view/Widgets/generic_card.dart';
import 'package:uni/view/Widgets/page_title.dart';
import 'package:uni/view/Widgets/printing_card.dart';
import 'package:uni/view/Widgets/printing_job_card.dart';

class PrintingPageView extends StatelessWidget {
  final List<Printing> printings;
  final List<PrintingJob> printingJobs;
  final void Function(BuildContext, Map<String, dynamic>) onNewPrinting;

  PrintingPageView({
    Key key,
    @required this.printings,
    @required this.printingJobs,
    @required this.onNewPrinting
  });

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
                child: printings.isEmpty && printingJobs.isEmpty
                    ? Text('Não há impressões para mostrar',
                        style: Theme.of(context).textTheme.bodyMedium,
                        textAlign: TextAlign.center)
                    : ListView.builder(
                        padding: EdgeInsets.only(bottom: 75),
                        itemCount: printings.length + printingJobs.length,
                        itemBuilder: (context, index) => index < printings.length
                          ? PrintingCard(printings[index])
                          : PrintingJobCard(printingJobs[index - printings.length])
                      ),
              )
            ]),
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () async {
                final file = await Printing.selectFile();
                if (file == null || file['path'] == null) {
                  const snackbar = SnackBar(content: Text('Houve um erro ao ler o ficheiro. Por favor, tenta novamente...'));
                  ScaffoldMessenger.of(context).showSnackBar(snackbar);
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
