import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:uni/model/app_state.dart';
import 'package:uni/model/entities/room_booking.dart';
import 'package:uni/model/entities/uni_notification.dart';
import 'package:uni/redux/actions.dart';
import 'package:uni/redux/action_creators.dart';
import 'package:uni/view/Pages/notifications_page_view.dart';
import 'package:uni/view/Pages/room_bookings_page_view.dart';
import 'package:uni/view/Pages/secondary_page_view.dart';

class RoomBookingsPage extends StatefulWidget {
  const RoomBookingsPage({Key key}) : super(key: key);

  @override
  _RoomBookingsPageState createState() => _RoomBookingsPageState();
}

class _RoomBookingsPageState extends SecondaryPageViewState {
  void cancelBooking(BuildContext context, index) {
    final store = StoreProvider.of<AppState>(context);

    store.dispatch(cancelRoomBooking(index));
  }

  void changeBookingState(BuildContext context, int index, BookingState state) {
    final store = StoreProvider.of<AppState>(context);

    store.dispatch(changeBookingStatus(index, state));
  }

  @override
  Widget getBody(BuildContext context) {
    return StoreConnector<AppState, List<RoomBooking>>(
        converter: (store) => store.state.content['bookings'],
        builder: (context, bookings) {
          return RoomBookingsPageView(
            bookings: bookings,
            cancelBooking: cancelBooking,
            changeBookingState: changeBookingState,
          );
        });
  }
}
