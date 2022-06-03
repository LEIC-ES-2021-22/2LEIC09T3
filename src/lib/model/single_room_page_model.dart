import 'package:flutter/material.dart';
import 'package:uni/model/entities/room_booking.dart';
import 'package:uni/model/entities/uni_notification.dart';
import 'package:uni/model/entities/university_room.dart';
import 'package:uni/view/Pages/secondary_page_view.dart';
import 'package:uni/view/Pages/single_notification_page_view.dart';
import 'package:uni/view/Pages/single_room_page_view.dart';

class SingleRoomPage extends StatefulWidget {
  final UniversityRoom universityRoom;
  

  const SingleRoomPage({
    Key key,
    @required this.universityRoom,
  });

  @override
  _SingleRoomPageState createState() => _SingleRoomPageState();
}

// class _SingleNotificationPageState extends SecondaryPageViewState {
class _SingleRoomPageState extends State<SingleRoomPage> {
  _SingleRoomPageState({
    Key key,
  });

  TabController tabController;
  ScrollController scrollViewController;

  @override
  Widget build(BuildContext context) {
    return SingleRoomPageView(
      tabController: tabController,
      scrollViewController: scrollViewController,
      // universityRoom: (widget as SingleRoomPage).universityRoom,
    );
  }
}