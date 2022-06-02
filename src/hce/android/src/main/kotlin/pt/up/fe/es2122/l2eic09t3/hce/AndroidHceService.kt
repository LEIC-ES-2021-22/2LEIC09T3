package pt.up.fe.es2122.l2eic09t3.hce

import android.content.Context
import android.content.Intent
import android.content.pm.PackageManager
import android.nfc.NfcAdapter
import pt.up.fe.es2122.l2eic09t3.hce.pigeon.Pigeon
import java.lang.Exception

class AndroidHceService(private val context: Context): Pigeon.HceService {

    private fun getHceState(): Pigeon.HceState {
        val pm = context.packageManager
        val hasHceSupport = pm.hasSystemFeature(PackageManager.FEATURE_NFC_HOST_CARD_EMULATION)

        if (!hasHceSupport) {
            return Pigeon.HceState.unsupported
        }

        val adapter = NfcAdapter.getDefaultAdapter(context)
        try {
            adapter.isEnabled
        } catch (e: Exception) {
        } // May throw exceptions spontaneously

        val isAvailable = try {
            adapter.isEnabled
        } catch (e: Exception) {
            false
        }

        if (!isAvailable) {
            return Pigeon.HceState.unavailable
        }

        return if (AndroidApduProxy.running) Pigeon.HceState.running
        else Pigeon.HceState.stopped
    }

    override fun getState() = Pigeon.HceStateWrapper.Builder()
        .setState(getHceState())
        .build()

    override fun start() {
        val state = getHceState()
        if (state == Pigeon.HceState.running) {
            throw IllegalStateException("The requested service is already running")
        } else if (state != Pigeon.HceState.stopped) {
            throw IllegalStateException("Can't start the requested service")
        }

        val intent = Intent(context, AndroidApduProxy.javaClass)
        context.startService(intent) 
    }

    override fun stop() {
        val state = getHceState()
        if (state == Pigeon.HceState.stopped) {
            throw IllegalStateException("The requested service is already stopped")
        } else if (state != Pigeon.HceState.running) {
            throw IllegalStateException("Can't stop the requested service")
        }

        val intent = Intent(context, AndroidApduProxy.javaClass)
        context.stopService(intent)
    }

}