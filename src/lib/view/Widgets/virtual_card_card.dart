import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:http/http.dart';
import 'package:uni/model/app_state.dart';
import 'package:uni/model/entities/virtual_card.dart';
import 'package:uni/redux/actions.dart';

import 'generic_card.dart';

class InAppCardStatus {

  bool active;
  String message;
  Color color;

  InAppCardStatus({ this.active, this.message, this.color });

  factory InAppCardStatus.fromStoreData(data) {
    final status = data['status'];
    final card = data['card'];

    if (status != RequestStatus.failed) {
      if (status == RequestStatus.busy || card == null) {
        return InAppCardStatus(
          active: false,
          message: 'A obter os dados do cartão virtual...',
          color: Colors.yellow,
        );
      }

      return InAppCardStatus(
        active: true,
        message: 'Aproxima o teu telemóvel de um terminal',
        color: Colors.green
      );
    }

    return InAppCardStatus(
      active: false,
      message: 'Por favor, tenta novamente mais tarde',
      color: Colors.red,
    );
  }
}

class VirtualCardCard extends GenericCard {

  VirtualCardCard.fromEditingInformation(
      Key key, bool editingMode, Function onDelete)
      : super.fromEditingInformation(key, editingMode, onDelete);

  @override
  Widget buildCardContent(BuildContext context) {
    return StoreConnector<AppState, InAppCardStatus>(
      converter: (store) => InAppCardStatus.fromStoreData({
        'card': store.state.content['virtualCard'],
        'status': store.state.content['virtualCardStatus'],
      }),
      builder: (context, status) {           
        return Row(
          children: [
            Flexible(
              child: Container(
                child: Image.asset('assets/images/student_card.png'),
                margin: EdgeInsets.all(8),
              ),
              fit: FlexFit.tight,
              flex: 1,
            ),
            Flexible(
              child: Container(
                child:  Column(
                  children: [
                    Flexible(
                      child: Container(
                        child: Row(
                          children: [
                            Container(
                              child: Text(
                                'ESTADO',
                                style: Theme.of(context).primaryTextTheme.bodyLarge,
                              ),
                              margin: EdgeInsets.only(right: 8),
                            ),
                            Icon(
                              Icons.circle,
                              size: 8,
                              color: status.color,
                            )
                          ],
                          crossAxisAlignment: CrossAxisAlignment.center,
                        ),
                        margin: EdgeInsets.only(bottom: 8),
                      ),
                      fit: FlexFit.loose,
                      flex: 0,
                    ),
                    Flexible(
                      child: Container(
                        child: Row(
                            children: [
                              Flexible(
                                child: Container(
                                  child: Text(
                                    status.message,
                                    style: Theme.of(context).textTheme.bodySmall,
                                  ),
                                ),
                                fit: FlexFit.tight,
                                flex: 1,
                              ),
                              ...(status.active ? [
                                Flexible(
                                  child: Container(
                                    child: Text(
                                      String.fromCharCode(Icons.rss_feed.codePoint),
                                      style: TextStyle(
                                        inherit: false,
                                        color: Colors.grey,
                                        fontSize: 24.0,
                                        fontWeight: FontWeight.w100,
                                        fontFamily: Icons.rss_feed.fontFamily,
                                        package: Icons.rss_feed.fontPackage,
                                      ),
                                    ),
                                    margin: EdgeInsets.all(8),
                                  ),
                                  fit: FlexFit.loose,
                                  flex: 0,
                                ),
                              ] : [])
                            ],
                          ),
                        margin: EdgeInsets.only(top: 8),
                      ),
                      fit: FlexFit.loose,
                      flex: 0,
                    ),
                  ]
                ),
                margin: EdgeInsets.all(8),
              ),
              fit: FlexFit.tight,
              flex: 1,
            ),
          ]
        );
      }
    );
  }

  @override
  String getTitle() => 'Cartão Virtual';

  @override
  onClick(BuildContext context) {}
}
