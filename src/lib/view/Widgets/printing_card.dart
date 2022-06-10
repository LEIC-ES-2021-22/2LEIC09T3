import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:uni/model/app_state.dart';
import 'package:uni/model/entities/printing.dart';
import 'package:uni/redux/action_creators.dart';
import 'package:uni/view/Widgets/generic_card.dart';

class PrintingCard extends GenericCard {
  
  PrintingCard(this.printing, {Key key});

  final Printing printing;

  @override
  bool get editingMode => true;

  @override
  Function(dynamic) get onDelete => (context) {
    final store = StoreProvider.of<AppState>(context);
    store.dispatch(deletePrinting(printing));
  };

  @override
  Widget buildCardContent(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      child: Row(children: [
        Flexible(
          flex: 3,
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(
                  'Cor:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16
                  ),
                ),
                Text(printing.color == PrintingColor.color ? 'Cor' : 'P&B',
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 16
                    ))
              ]),
              SizedBox(height: 10),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(
                  'Cópias:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                      fontSize: 16
                  ),
                ),
                Text(printing.numCopies.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 16
                    ))
              ]),
              SizedBox(height: 10),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(
                  'Tamanho:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16
                  ),
                ),
                Text(printing.pageSize.name.toUpperCase(),
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 16
                    ))
              ]),
            ],
          )),
        Flexible(flex: 1, child: Container())
    ]));
  }

  @override
  String getTitle() {
    return printing.name;
  }

  @override
  onClick(BuildContext context) {}

  @override
  State<StatefulWidget> createState() => PrintingCardState();
}

class PrintingCardState extends GenericCardState {
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