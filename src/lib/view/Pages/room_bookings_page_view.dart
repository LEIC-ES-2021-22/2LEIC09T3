import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uni/model/entities/room_booking.dart';
import 'package:uni/view/Pages/bus_stop_selection_page.dart';
import 'package:uni/view/Widgets/page_title.dart';
import 'package:uni/utils/datetime.dart';

class RoomBookingsPageView extends StatefulWidget {
  final List<RoomBooking> bookings;
  final bool Function(BuildContext, int) cancelBooking;
  final bool Function(BuildContext, int, BookingState) changeBookingState;

  RoomBookingsPageView({
    Key key,
    @required this.bookings,
    @required this.cancelBooking,
    @required this.changeBookingState,
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
    return SingleChildScrollView(
        child: Column (
          children: [
            ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: <Widget>[
                PageTitle(name: 'Reservas'),
              ],
            ),
            widget.bookings.isEmpty
              ? Text(
                  'Não há reservas para mostrar.',
                  style: Theme.of(context).textTheme.bodyMedium,
                )
              : ExpansionPanelList(
                  expansionCallback: (int index, bool isExpanded) {
                    setState(() => _isExpanded[index] = !isExpanded);
                  },
                  animationDuration: Duration(milliseconds: 250),
                  children: List.generate(
                    widget.bookings.length,
                    (index) {
                      final item = widget.bookings[index];

                      return ExpansionPanel(
                        headerBuilder:
                            (BuildContext context, bool isExpanded) {
                          return ListTile(
                            title: Wrap(
                              direction: Axis.horizontal,
                              runSpacing: 7.0,
                              spacing: 12.0,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SizedBox(width: 1.5,),
                                      item.state == BookingState.accepted ?
                                      Icon(
                                        Icons.check_circle,
                                        color: Colors.green,
                                        size: 20.0,
                                      ) : item.state == BookingState.cancelled ?
                                      Icon(
                                        Icons.error,
                                        color: Colors.red,
                                        size: 20.0,
                                      ) :
                                      Icon(
                                        Icons.radio_button_checked,
                                        color: Colors.amber,
                                        size: 20.0,
                                      ),

                                      SizedBox(width: 6.0,),

                                      Text(
                                        'Pedido: ',
                                        style: Theme.of(context).textTheme.bodyLarge
                                        .copyWith(
                                          color: Color.fromARGB(255, 0x75, 0x17, 0x1e),
                                          fontSize: 20.0),
                                      ),
                                      Text(
                                        '${item.bookingId}',
                                        style: Theme.of(context).textTheme.displayMedium
                                        .copyWith(
                                          color: Color.fromARGB(255, 0x75, 0x17, 0x1e),
                                          fontSize: 18.0),
                                      ),
                                    ],
                                  ),
                                  
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(Icons.calendar_month_outlined, size: 24.0),
                                      SizedBox(width: 6.0,),
                                      Text(
                                        DateFormat('dd-MM-yyyy').format(item.date),
                                        style: Theme.of(context).textTheme.displayMedium
                                        .copyWith(fontSize: 18.0),
                                      ),
                                    ],
                                  ),
                                ],                              
                            )
                          );
                        },
                        body: ListTile(
                          title: Column(children: [
                            Row(children: [
                              Icon(Icons.schedule_outlined,),
                              SizedBox(width: 8.0,),
                              Text(
                                item.date.readableTime + ' - ' + item.date.add(Duration(minutes: item.duration)).readableTime,
                                style: Theme.of(context).textTheme.displayMedium,
                              ),
                            ]),

                            Row(children: [
                              Icon(Icons.location_on_outlined,),
                              SizedBox(width: 8.0,),
                              Text(
                                'Sala ${item.room}',
                                style: Theme.of(context).textTheme.displayMedium,
                              ),
                            ]),

                            SizedBox(height: 10.0,),

                            item.state == BookingState.cancelled ? 
                            Row() 
                            : Row(children: [
                                Icon(
                                  Icons.delete,
                                  color: Color.fromARGB(255, 0x75, 0x17, 0x1e),
                                ),
                                SizedBox(width: 8.0,),
                                GestureDetector(
                                  onTap: ()  => widget.changeBookingState(context, index, BookingState.cancelled),
                                  child: 
                                    Text(
                                      'Cancelar reserva',
                                      style: Theme.of(context).textTheme.bodyMedium
                                      .copyWith(
                                      color: Color.fromARGB(255, 0x75, 0x17, 0x1e),
                                      fontSize: 18.0),
                                    ),
                                )
                            ],),
                            item.state == BookingState.cancelled ? 
                              SizedBox()
                              : SizedBox(height: 20.0,)
                          ],)
                        ),
                        isExpanded: _isExpanded[index],
                      );
                  }
                )
              )
          ]
        ),
      );
  }
}
