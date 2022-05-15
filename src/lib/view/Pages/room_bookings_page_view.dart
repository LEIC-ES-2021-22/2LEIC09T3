import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:uni/model/entities/room_booking.dart';
import 'package:uni/model/entities/uni_notification.dart';
import 'package:uni/model/single_notification_page_model.dart';
import 'package:uni/utils/constants.dart';
import 'package:uni/view/Widgets/page_title.dart';
import 'package:uni/view/Widgets/slidable_widget.dart';

class RoomBookingsPageView extends StatefulWidget {
  final List<RoomBooking> bookings;
  final bool Function(BuildContext, int) cancelBooking;
  final bool Function(BuildContext, int) changeBookingStatus;

  RoomBookingsPageView({
    Key key,
    @required this.bookings,
    @required this.cancelBooking,
    @required this.changeBookingStatus,
  });

  @override
  State<RoomBookingsPageView> createState() => _RoomBookingsPageViewState();
}

class _RoomBookingsPageViewState extends State<RoomBookingsPageView> {
  List<bool> _isExpanded;

  @override
  void initState() {
    super.initState();
    _isExpanded = List.filled(widget.bookings.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(children: <Widget>[
      ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: <Widget>[
          PageTitle(name: 'Reservas'),
        ],
      ),
      Expanded(
          child: widget.bookings.isEmpty
              ? Text(
                  "Não há reservas para mostrar.",
                  style: Theme.of(context).textTheme.bodyMedium,
                )
              : ListView.builder(
                  itemCount: widget.bookings.length,
                  itemBuilder: (context, index) {
                    final item = widget.bookings[index];

                    return ExpansionPanelList(
                      expansionCallback: (int index, bool isExpanded) {
                        setState(() => _isExpanded[index] = !isExpanded);
                      },
                      children: [
                        ExpansionPanel(
                          headerBuilder:
                              (BuildContext context, bool isExpanded) {
                            return ListTile(
                              title: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(text: "Pedido: ${widget.bookings[index].bookingId.toString()}"),
                                      WidgetSpan(child: Icon(Icons.calendar_month_outlined))
                                    ]
                                  )
                            ));
                          },
                          body: ListTile(
                            title: Text('TODO'),
                            subtitle: Text('TODO'),
                          ),
                          isExpanded: _isExpanded[index],
                        ),
                      ],
                    );
                  },
                ))
    ]));
  }
}
