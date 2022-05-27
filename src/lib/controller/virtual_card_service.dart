import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:hce/hce.dart';
import 'package:logger/logger.dart';
import 'package:redux/redux.dart';
import 'package:uni/model/app_state.dart';
import 'package:uni/model/entities/session.dart';
import 'package:uni/model/entities/virtual_card.dart';
import 'package:uni/redux/actions.dart';

class VirtualCardService extends ApduService {

  final Store<AppState> _store;
  StreamSubscription<AppState> _subscription = null;
  
  VirtualCardService(this._store);

  Future<void> init() async {
    if (_subscription != null) {
      return;
    }

    ApduService.setup(this);
    final appState = _store.state;

    final currVirtualCard = appState?.content['virtualCard'];
    final currSession = appState?.content['session'];

    if (currSession != null && currVirtualCard != null) {
      try {
        _store.dispatch(SetVirtualCardStatus(RequestStatus.busy));

        final hceService = HceService();
        final hceState = (await hceService.getState()).state;
        if (hceState == HceState.running) {
          await hceService.stop();
        }
        
        final username = currSession?.studentNumber;
        final privateKey = currVirtualCard?.privateKey;

        if (username == null || username == '' || privateKey == null || privateKey == '' || hceState == HceState.unsupported || hceState == HceState.unavailable) {
          return _store.dispatch(SetVirtualCardStatus(RequestStatus.failed));
        }

        await hceService.start();
        _store.dispatch(SetVirtualCardStatus(RequestStatus.successful));
      } catch(e) {
        Logger().e('Exception thrown while starting virtual card service', e);
        _store.dispatch(SetVirtualCardStatus(RequestStatus.failed));
      }
    }
  }

  Future<void> teardown() async {
    if (_subscription != null) {
      await _subscription.cancel();
      _subscription = null;
    }

    ApduService.setup(null);
  }

  @override
  Future<Uint8List> processApdu(Uint8List command) async {
    if (command == Uint8List.fromList([0x0, 0xA4, 0x04, 0x0, 5, 0xFE, 0xE7, 0x1A, 0xD0, 0x9E])) {
      Logger().d("SELECT AID");
      return Uint8List.fromList([0x90, 0x00]);
    } else if (command == Uint8List.fromList([0x0, 0xCA, 0x0, 0x0, 0x0F, 0xFF])) {
      Logger().d("GET DATA");

      final username = _store.state.content['session'].studentNumber;
      final privateKey = _store.state.content['virtualCard'].privateKey;

      final length = username.length + privateKey.length + 2;
      if (length > 255) {
        return Uint8List.fromList([0x0, 0x0]);
      }

      return Uint8List.fromList([
        length,
        ...utf8.encode(username),
        0x0,
        ...utf8.encode(privateKey),
        0,
        0x90, 0x0]);
    }

    return null;
  }

  @override
  Future<void> processDeactivation(ServiceDeactivationReasonWrapper reason) async {
    return;
  }
}