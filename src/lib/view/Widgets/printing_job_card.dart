import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:uni/model/app_state.dart';
import 'package:uni/model/entities/printing_job.dart';
import 'package:uni/redux/action_creators.dart';
import 'package:uni/view/Widgets/generic_card.dart';
import 'package:uni/utils/datetime.dart';

class PrintingJobCard extends GenericCard {
  
  PrintingJobCard(this.printingJob, {Key key});

  final PrintingJob printingJob;

  @override
  bool get editingMode => true;

  @override
  Function(dynamic) get onDelete => (context) {
    final store = StoreProvider.of<AppState>(context);
    store.dispatch(deletePrintingJob(printingJob));
  };

  @override
  Widget buildCardContent(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      child: Row(children: [
        Flexible(
          flex: 1,
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(
                  'Data:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16
                  ),
                ),
                Text(
                  printingJob.date.readableDate,
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 16
                  ),
                )
              ]),
              SizedBox(height: 10),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(
                  'Impressora:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                      fontSize: 16
                  ),
                ),
                Text(printingJob.printerName,
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 16
                    ))
              ]),
              SizedBox(height: 10),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(
                  'Páginas:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16
                  ),
                ),
                Text(printingJob.numPages.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 16
                    ))
              ]),
              SizedBox(height: 10),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(
                  'Preço total:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16
                  ),
                ),
                Text(printingJob.price.toStringAsFixed(2) + '€',
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 16
                    ))
              ]),
            ],
          )),
    ]));
  }

  @override
  String getTitle() {
    return printingJob.documentName;
  }

  @override
  onClick(BuildContext context) {}

  @override
  State<StatefulWidget> createState() => PrintingJobCardState();
}

class PrintingJobCardState extends GenericCardState {
  @override
  Widget getMoveIcon(dynamic context) => null;

  @override
  Widget getDeleteIconWrapper(context) {
    return Flexible(
      flex: 0,
      child: Container(
        child: this.getDeleteIcon(context),
        alignment: Alignment.centerRight,
        height: 32,
      ));
  }
}