import 'package:cached_network_image/cached_network_image.dart';
import 'package:logger/logger.dart';
import 'package:uni/model/app_state.dart';
import 'package:flutter/material.dart';
import 'package:uni/view/Widgets/page_title.dart';
import 'package:uni/view/Widgets/request_dependent_widget_builder.dart';
import 'package:uni/view/Widgets/schedule_slot.dart';
import 'package:uni/model/entities/university_room.dart';

/// Manages the 'classroom map' sections of the app
class SingleRoomPageView extends StatelessWidget {
  SingleRoomPageView(
      {Key key, @required this.tabController, @required this.universityRoom, @required this.status });

  final RequestStatus status;
  final UniversityRoom universityRoom;
  final TabController tabController;

  @override
  Widget build(BuildContext context) {

    final MediaQueryData queryData = MediaQuery.of(context);

    return Column(children: <Widget>[
      ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: <Widget>[
          PageTitle(name: 'Mapa'),
          ...(status == RequestStatus.successful ? [
          TabBar(
            key: ValueKey('room-page-slidable'),
            controller: tabController,
            isScrollable: true,
            tabs: createTabs(queryData, context),
          )] : []) 
        ],
      ),
      Expanded(
        child: status == RequestStatus.successful
          ? TabBarView(
          controller: tabController,
          children: createMaps(context)) 
          : Center(child: CircularProgressIndicator()))
    ]);
  }

  // Returns a list of widgets empty with tabs for each day map
  List<Widget> createTabs(queryData, BuildContext context) {
    final List<Widget> tabs = <Widget>[];
    tabs.add(Container(
      color: Theme.of(context).backgroundColor,
      width: queryData.size.width * 1 / 2,
      child: Tab(key: Key('floor-page'), text: universityRoom.buildingName), // alterar
    ));
    tabs.add(Container(
      color: Theme.of(context).backgroundColor,
      width: queryData.size.width * 1 / 2,
      child:
          Tab(key: Key('room-page'), text: 'Sala ' + universityRoom.name),
    ));
    return tabs;
  }

  List<Widget> createMaps(context) {
    final List<Widget> tabBarViewContent = <Widget>[];
    tabBarViewContent.add(printMap(context, false));
    tabBarViewContent.add(printMap(context, true));
    return tabBarViewContent;
  }

  Widget printMap(context, bool isClassroom) {
    return isClassroom
        ? Container(
            key: ValueKey('room-map'),
            child: CachedNetworkImage(
              imageUrl: universityRoom.urlToFloorImage,
          ),)
        : Container(
            key: ValueKey('block-map'),
            child: CachedNetworkImage(
              imageUrl: universityRoom.urlToClassroomImage,
          ),);
  }
}
