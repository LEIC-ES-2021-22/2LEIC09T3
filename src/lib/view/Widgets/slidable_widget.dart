import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:uni/view/Pages/exams_page_view.dart';

class SlidableWidget<T> extends StatelessWidget {
  final Widget child;

  const SlidableWidget({
    @required this.child,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Slidable(
        key: const ValueKey(0),
        child: child,
        endActionPane: ActionPane(
          motion: BehindMotion(),
          extentRatio: 0.4,
          children: [
            SlidableAction(
              backgroundColor: Color.fromARGB(255, 95, 95, 95),
              foregroundColor: Colors.white,
              icon: Icons.more_horiz,
              onPressed: (context) => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ExamsPageView())),
            ),
            SlidableAction(
              backgroundColor: Color.fromARGB(255, 0x75, 0x17, 0x1e),
              foregroundColor: Colors.white,
              icon: Icons.delete,
            ),
          ],
        ),
      );
}
