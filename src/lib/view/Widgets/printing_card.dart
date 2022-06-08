import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:uni/model/entities/printing.dart';
import 'package:uni/view/Widgets/generic_card.dart';

class PrintingCard extends GenericCard {
  Printing printing;
  PrintingCard(this.printing);

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
                Text(printing.color ? 'Cor' : 'P&B',
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
                Text(printing.pageSize,
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
                Text(printing.price.toString() + '€',
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
}
