import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:uni/model/app_state.dart';
import 'package:uni/model/entities/uni_notification.dart';
import 'package:redux/redux.dart';
import 'package:uni/redux/reducers.dart';
import 'package:uni/redux/actions.dart';
import 'package:uni/utils/constants.dart';
import 'package:uni/controller/middleware.dart';
import 'package:uni/view/Pages/notifications_page_view.dart';

import '../../../testable_widget.dart';

void main() {
  group('NotificationsPage', () {
    final firstNotificationSigarraId = 123;
    final firstNotificationTitle = 'título1';
    final firstNotificationContent = 'conteudo1';
    final firstNotificationDate = DateTime(2017, 9, 7, 17, 30);

    final Store<AppState> store = Store<AppState>(appReducers,
      initialState: AppState(null),
      middleware: [generalMiddleware]);

    bool removeNotification(BuildContext, int){ return true; };
    bool changeNotificationState(BuildContext, int){ return true; };

    testWidgets('When given an empty notification list', (WidgetTester tester) async {
      final widget = makeTestableWidget(
        child: StoreProvider(
          store: store,
          child: NotificationsPageView(
          notifications: <UniNotification> [], 
          removeNotification: removeNotification, 
          changeNotificationState: changeNotificationState)));
      await tester.pumpWidget(widget);

      expect(find.byType(Slidable), findsNothing);
      expect(find.text('Não há notificações para mostrar.'), findsOneWidget);
    });

    testWidgets('When given a single notification', (WidgetTester tester) async {
      final firstNotification = UniNotification(
        firstNotificationSigarraId,
        firstNotificationTitle, 
        firstNotificationContent, 
        false, 
        firstNotificationDate);

        final List<UniNotification> notifications = [firstNotification];

        final widget = makeTestableWidget(
          child: NotificationsPageView(
            notifications: notifications, 
            removeNotification: removeNotification, 
            changeNotificationState: changeNotificationState)
        );

        await tester.pumpWidget(widget);

        expect(find.byType(Slidable), findsOneWidget);
      });
  });
}