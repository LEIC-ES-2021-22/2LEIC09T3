import 'package:flutter/scheduler.dart';
import 'package:logger/logger.dart';
import 'package:tuple/tuple.dart';
import 'package:uni/model/app_state.dart';
import 'package:uni/model/entities/lecture.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:uni/model/entities/university_room.dart';
import 'package:uni/redux/action_creators.dart';
import 'package:uni/view/Pages/schedule_page_view.dart';
import 'package:uni/view/Pages/secondary_page_view.dart';

import '../view/Pages/single_room_page_view.dart';

class SingleRoomPageModel extends StatefulWidget {

  final String room;
  final String roomId;

  SingleRoomPageModel(String this.room, String this.roomId, {
    Key key,
  });
  
  @override 
  _SingleRoomPageModelState createState() => _SingleRoomPageModelState();
}

class _SingleRoomPageModelState extends SecondaryPageViewState with SingleTickerProviderStateMixin {
  _SingleRoomPageModelState({
    Key key,
  });

  TabController tabController; 
  @override
  Widget getBody(BuildContext context) {
      return StoreConnector<AppState, Map<String, dynamic>>(
        converter: (store) => {
          'room': store.state.content['universityRoom'],
          'status': store.state.content['universityRoomStatus']
        },
        builder: (context, data) {
          return SingleRoomPageView(tabController: tabController, universityRoom: data['room'], status: data['status']);
        });
  }

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 2);
    // tabController.animateTo((tabController.index + offset));
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
}