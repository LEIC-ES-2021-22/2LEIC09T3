import 'package:flutter/material.dart';
import 'package:uni/view/Pages/secondary_page_view.dart';
import 'package:uni/view/Widgets/generic_card.dart';
import 'package:uni/view/Widgets/page_title.dart';



class NewPrintingPageView extends StatefulWidget {
  const NewPrintingPageView({Key key}) : super(key: key);

  @override 
  NewPrintingPageViewState createState() => NewPrintingPageViewState();
}

class NewPrintingPageViewState extends SecondaryPageViewState {

  bool color = true;
  bool size = true;
    
  @override
  Widget getBody(BuildContext context) {
    final changeColor = (bool val) {
      setState(() {
        color = val;
      });
    };

    final changeSize = (bool val) {
      setState(() {
        size = val;
      });
    };

    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Cor',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                )
              ),
              Row(
                children: [
                  Text(
                    'Cor',
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                    )
                  ),
                  Radio(
                    value: true,
                    groupValue: color,
                    onChanged: changeColor,
                  )
                ],
              ),
              
              Row(
                children: [
                  Text(
                    'B&W',
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                    )
                  ),
                  Radio(
                    value: false,
                    groupValue: color,
                    onChanged: changeColor,
                  )
                ],
              )
            ]
          ),
          SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    'Tamanho',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    )
                  ),

                  Row(
                    children: [
                      Text(
                        'A4',
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                        )
                      ),
                      Radio(
                        value: true,
                        groupValue: size,
                        onChanged: changeSize,
                      )
                    ],
                  ),

                  Row(
                    children: [
                      Text(
                        'A3',
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                        )
                      ),
                      Radio(
                        value: false,
                        groupValue: size,
                        onChanged: changeSize,
                      )
                    ],
                  )
                ]
              )
            ]
          ),
          SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Número de Cópias',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                )
              ),

            ],
          )
        ],
      )
    );
  }

  Container getPageTitle() {
    return Container(
        padding: EdgeInsets.only(bottom: 12.0),
        child: PageTitle(name: 'Registar Nova Impresão'));
  }
}