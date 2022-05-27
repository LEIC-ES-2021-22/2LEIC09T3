package pt.up.fe.es2122.l2eic09t3.hce

import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import android.util.Log
import pt.up.fe.es2122.l2eic09t3.hce.pigeon.Pigeon

/** HcePlugin */
class HcePlugin: FlutterPlugin {

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    Log.e("POG", "attached")
    val messenger = flutterPluginBinding.binaryMessenger
    val context = flutterPluginBinding.applicationContext

    AndroidApduProxy.api = Pigeon.ApduService(messenger)
    Pigeon.HceService.setup(messenger, AndroidHceService(context))
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    Pigeon.HceService.setup(binding.binaryMessenger, null)
  }
}
