import Flutter
import UIKit

public class SwiftHcePlugin: NSObject, FlutterPlugin, HceService {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let messenger : FlutterBinaryMessenger = registrar.messenger()
    let api : HceService & NSObjectProtocol = SwiftHcePlugin.init()

    HceServiceSetup(messenger, api)
  }

  public func getStateWithError(_ error: AutoreleasingUnsafeMutablePointer<FlutterError?>) -> HceStateWrapper {
    let result = HceStateWrapper.init()
    result.state = HceState.HceStateUnsupported
    return result
  }

  public func startWithError(_ error: AutoreleasingUnsafeMutablePointer<FlutterError?>) {

  }

  public func stopWithError(_ error: AutoreleasingUnsafeMutablePointer<FlutterError?>) {
    
  }
}
