import 'package:pigeon/pigeon.dart';

enum HceState {
  unsupported,
  unavailable,
  stopped,
  running
}

class HceStateWrapper {
  HceStateWrapper({ required this.state });
  HceState state;
}

enum ServiceDeactivationReason {
  linkLost,
  serviceDeselected
}

class ServiceDeactivationReasonWrapper {
  ServiceDeactivationReasonWrapper({ required this.reason });
  ServiceDeactivationReason reason;
}

@HostApi()
abstract class HceService {
  HceStateWrapper getState();
  void start();
  void stop();
}

@FlutterApi()
abstract class ApduService {

  @async
  Uint8List? processApdu(Uint8List command);

  @async
  void processDeactivation(ServiceDeactivationReasonWrapper reason);
}
