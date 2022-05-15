import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:intl/intl.dart';
import 'package:uni/model/app_state.dart';
import 'package:uni/model/entities/room_booking.dart';
import 'package:uni/redux/actions.dart';
import 'package:uni/view/Widgets/row_container.dart';

import 'generic_card.dart';

/// Manages the 'Current account' section inside the user's page (accessible
/// through the top-right widget with the user picture)
class RoomBookingCard extends GenericCard {
  RoomBookingCard({Key key}) : super(key: key);

  RoomBookingCard.fromEditingInformation(
      Key key, bool editingMode, Function onDelete)
      : super.fromEditingInformation(key, editingMode, onDelete);

  @override
  Widget buildCardContent(BuildContext context) {
    return Column(children: [
      StoreConnector<AppState, RoomBooking>(
              converter: (store) { 
                final List<RoomBooking> bookings = store.state.content['bookings'];
                RoomBooking nextBooking = null;
                for (final booking in bookings) {
                  if (nextBooking == null || booking.date.isBefore(nextBooking.date)) {
                    nextBooking = booking;
                  }
                }
                return nextBooking;
              },
              builder: (context, booking) => (
        Table(
     //       columnWidths: {1: FractionColumnWidth(.4)},
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children:getBookingInfo(context, booking))
      )),
      StoreConnector<AppState, String>(
          converter: (store) => store.state.content['bookingsRefreshTime'],
          builder: (context, bookingsRefreshTime) =>
              this.showLastRefreshedTime(bookingsRefreshTime, context))
    ]);
  }

  List<TableRow> getBookingInfo(BuildContext context, RoomBooking booking) {
    final List<TableRow> rows = <TableRow>[];

    rows.add(
      TableRow(children: [
        Icon(Icons.calendar_month_outlined),
        Text(DateFormat('dd-MM-yyyy').format(booking.date),
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  .apply(fontSizeDelta: -4)),
        /*
        Container(
          margin:
              const EdgeInsets.only(top: 8.0, bottom: 20.0, left: 20.0),
          child: Text(DateFormat('dd-MM-yyyy').format(booking.date),
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  .apply(fontSizeDelta: -4)),
        ),*/
      ]));

    var endDate = new DateTime(booking.date.year, booking.date.month, 
      booking.date.day, booking.date.hour, booking.date.minute + booking.duration);


    rows.add(
      TableRow(children: [
        Icon(Icons.access_time),
        Container(
          margin:
              const EdgeInsets.only(top: 8.0, bottom: 20.0, left: 20.0),
          child: Text("${DateFormat('HH').format(booking.date)}H${DateFormat('mm').format(booking.date)} - ${DateFormat('HH').format(endDate)}H${DateFormat('mm').format(endDate)}",
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  .apply(fontSizeDelta: -4)),
        ),
    ]));


    rows.add(
      TableRow(children: [
        Icon(Icons.location_on_outlined),
        Container(
          margin:
              const EdgeInsets.only(top: 8.0, bottom: 20.0, left: 20.0),
          child: Text("Sala ${booking.room}",
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  .apply(fontSizeDelta: -4)),
        ),
    ]));

    return rows;
  }

  @override
  String getTitle() => 'Próxima reserva';

  @override
  onClick(BuildContext context) {}
}