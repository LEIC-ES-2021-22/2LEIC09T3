import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:intl/intl.dart';
import 'package:uni/model/app_state.dart';
import 'package:uni/model/entities/room_booking.dart';
import 'package:uni/redux/actions.dart';
import 'package:uni/utils/datetime.dart';
import 'package:uni/view/Widgets/row_container.dart';

import '../../utils/constants.dart' as Constants;
import 'generic_card.dart';

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
                    if (booking.state == BookingState.accepted) {
                      nextBooking = booking;
                    }
                  }
                }
                return nextBooking;
              },
              builder: (context, booking) => (
                booking == null ? 
                Container(
                  padding: EdgeInsets.all(8.0),
                  child: 
                    Text(
                      'Clica para adicionares uma reserva',
                      style: Theme.of(context).textTheme.titleMedium
                      .apply(color: Theme.of(context).accentColor),
                  )) 
                : Container( 
                  padding: EdgeInsets.only(left: 10.0),
                  child:
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 10.0),
                        child: 
                          Row(children: [
                            Icon(Icons.calendar_month_outlined),
                            SizedBox(width: 3.0,),
                            Text(
                              DateFormat('dd-MM-yyyy').format(booking.date),
                              style: Theme.of(context).textTheme.displayMedium
                              .copyWith(fontSize: 16.0),)
                          ],),
                      ),

                    Container(
                      margin: EdgeInsets.only(bottom: 10.0),
                      child:
                        Row(children: [
                          Icon(Icons.schedule_outlined),
                          SizedBox(width: 3.0,),
                          Text(
                            booking.date.readableTime + ' - ' + booking.date.add(Duration(minutes: booking.duration)).readableTime,
                            style: Theme.of(context).textTheme.displayMedium
                            .copyWith(fontSize: 16.0),
                          )
                        ],),
                    ),

                    Row(children: [
                      Icon(Icons.location_on_outlined),
                      SizedBox(width: 3.0,),
                      Text(
                        'Sala ${booking.room}',
                        style: Theme.of(context).textTheme.displayMedium
                        .copyWith(fontSize: 16.0),
                      )
                    ],)
                  ],)
                ))
      //   Table(
      //     columnWidths: {1: FractionColumnWidth(.4)},
      //     defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      //     children:getBookingInfo(context, booking))
      // )),
      // StoreConnector<AppState, String>(
      //     converter: (store) => store.state.content['bookingsRefreshTime'],
      //     builder: (context, bookingsRefreshTime) =>
      //         this.showLastRefreshedTime(bookingsRefreshTime, context))
    )]);
  }

  @override
  String getTitle() => 'Próxima reserva';

  @override
  onClick(BuildContext context) =>
    Navigator.pushNamed(context, '/' + Constants.navBookings);
}