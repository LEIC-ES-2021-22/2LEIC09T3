import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:uni/model/app_state.dart';
import 'package:uni/model/entities/printing.dart';
import 'package:uni/model/entities/printing_job.dart';
import 'package:uni/redux/action_creators.dart';
import 'package:uni/view/Pages/secondary_page_view.dart';
import 'package:uni/view/Widgets/generic_card.dart';
import 'package:uni/view/Widgets/page_title.dart';

class NewPrintingJobPageView extends StatefulWidget {

  final String filename;
  final String filepath;

  NewPrintingJobPageView(Map<String, String> file, {Key key}) :
    filename = file['name'],
    filepath = file['path'],
    super(key: key);

  @override 
  NewPrintingJobPageViewState createState() => NewPrintingJobPageViewState();
}

class NewPrintingJobPageViewState extends SecondaryPageViewState {

  @override
  Widget getBody(BuildContext context) {
    return NewPrintingJobForm(
      title: getPageTitle(),
      onSubmit: (data) {
        final widget  = this.widget as NewPrintingJobPageView;

        final file = File(widget.filepath);
        
        
        Navigator.pop(context);
      });
  }

  Widget getPageTitle() {
    return Container(
        padding: EdgeInsets.only(bottom: 12.0),
        child: PageTitle(name: 'Registar Nova Impresão'));
  }
}

class NewPrintingJobForm extends StatefulWidget {

  final Function(Map<String, dynamic>) onSubmit; 
  final Widget title;

  NewPrintingJobForm({ 
    Key key,
    @required this.title,
    @required this.onSubmit
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => NewPrintingJobFormState();
}

class NewPrintingJobFormState extends State<NewPrintingJobForm> {

  bool color = true;
  bool size = true;
  var copies = 1;

  @override
  Widget build(BuildContext context) {
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

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.upload),
        onPressed: () {
          widget.onSubmit({
            'copies': copies,
            'color': color,
            'size': size,
          });
        }
      ),
      body: Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
        widget.title,
        GridView.count(
          primary: false,
          shrinkWrap: true,
          crossAxisCount: 3,
          childAspectRatio: 3,
          
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                'Cor',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Cor',
                    style: TextStyle( 
                      fontSize: 16.0,
                    ),
                  ),
                  Radio(
                    value: true,
                    groupValue: color,
                    onChanged: changeColor,
                  )
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'P&B',
                    style: TextStyle( 
                      fontSize: 16.0,
                    )
                  ),
                  Radio(
                    value: false,
                    groupValue: color, 
                    onChanged: changeColor,
                  )
              ]),
            ),

            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                'Tamanho',
                style: TextStyle( 
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0
                )
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'A4',
                    style: TextStyle( 
                      fontSize: 16.0,
                    ),
                  ),
                  Radio(
                    value: true,
                    groupValue: size,
                    onChanged: changeSize,
                  )
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'A3',
                    style: TextStyle( 
                      fontSize: 16.0,
                    ),
                  ),
                  Radio(
                    value: false,
                    groupValue: size,
                    onChanged: changeSize,
                  )
                ],
              ),
            ),
          ],
        ),

        Container(
          margin: EdgeInsets.only(top: 10),
          child: Row(
            children: [
              Text(
                'Número de Cópias',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
        
              Expanded(child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        if (copies > 1) {
                          setState(() {
                            copies--;
                          });
                        }
                      },
                      icon: Icon(Icons.remove),
                    ),
                    
                    Text(
                      copies.toString(),
                      style: TextStyle(
                        fontSize: 16.0,
                    )),

                    IconButton(
                      onPressed: () {
                        setState(() {
                          copies++;
                        });
                      },
                      icon: Icon(Icons.add)
                    )
                ])
            )
          ]),
        ),
        ]
      )
    ));
  }

}