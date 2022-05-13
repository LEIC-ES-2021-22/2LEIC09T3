import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:uni/view/Pages/exams_page_view.dart';

class SlidableWidget<T> extends StatelessWidget {
  final Widget child;
  final void Function(BuildContext) onDelete;
  final SlidableAction changeState;
  //final void Function(BuildContext) changeState;

  const SlidableWidget({
    @required this.child,
    @required this.onDelete,
    @required this.changeState,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Slidable(
        child: child,
        startActionPane: ActionPane(
          motion: BehindMotion(),
          children: [
            changeState,
          ],
        ),
        endActionPane: ActionPane(
          motion: BehindMotion(),
          extentRatio: 0.25,
          children: [
            SlidableAction(
              backgroundColor: Color.fromARGB(255, 0x75, 0x17, 0x1e),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              onPressed: onDelete,
            ),
          ],
        ),
      );
}
