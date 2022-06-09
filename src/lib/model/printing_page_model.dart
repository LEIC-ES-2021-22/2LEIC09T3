import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:logger/logger.dart';
import 'package:uni/model/app_state.dart';
import 'package:uni/model/entities/printing.dart';
import 'package:uni/model/entities/printing_job.dart';
import 'package:uni/redux/action_creators.dart';
import 'package:uni/view/Pages/general_page_view.dart';
import 'package:uni/view/Pages/printing_page_view.dart';
import 'package:uni/view/Pages/secondary_page_view.dart';

class PrintingPage extends StatefulWidget {
  @override
  _PrintingPageState createState() => _PrintingPageState();
  
}

class _PrintingPageState extends SecondaryPageViewState {
  
  @override
  Widget getBody(BuildContext context) {
    return StoreConnector<AppState, List<Printing>>(
      converter: (store) => store.state.content['printings'],
      builder: (context, printings) => PrintingPageView(
        printings: printings,
        onNewPrinting: (context, job) {
          final store = StoreProvider.of<AppState>(context);
          final printing = Printing(0, job['filename'], job['filepath'], job['size'] ? 'A4' : 'A3', job['color'], job['copies'], 23);
          store.dispatch(createNewPrinting(printing));
        }
      ));
  }
}