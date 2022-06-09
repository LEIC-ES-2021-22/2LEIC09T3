import 'package:logger/logger.dart';
import 'package:tuple/tuple.dart';
import 'package:uni/model/app_state.dart';
import 'package:uni/model/entities/lecture.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:uni/model/entities/university_room.dart';
import 'package:uni/view/Pages/schedule_page_view.dart';
import 'package:uni/view/Pages/secondary_page_view.dart';

import '../view/Pages/single_room_page_view.dart';

class SingleRoomPageModel extends StatefulWidget {
  final UniversityRoom universityRoom;

  const SingleRoomPageModel({
    Key key,
    @required this.universityRoom,
  });
  
  @override 
  _SingleRoomPageModelState createState() => _SingleRoomPageModelState(universityRoom);
}

class _SingleRoomPageModelState extends SecondaryPageViewState with SingleTickerProviderStateMixin {
  _SingleRoomPageModelState(UniversityRoom universityRoom, {
    Key key,
  });

  UniversityRoom universityRoom = UniversityRoom(123, 'B001', 'https://sigarra.up.pt/feup/pt/instal_geral2.get_mapa?pv_id=76365', 'https://sigarra.up.pt/feup/pt/instal_geral2.get_mapa?pv_id=76365');
  TabController tabController; 
  @override
  Widget getBody(BuildContext context) {
      return SingleRoomPageView(
      universityRoom: universityRoom,
      tabController: tabController,
    );
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