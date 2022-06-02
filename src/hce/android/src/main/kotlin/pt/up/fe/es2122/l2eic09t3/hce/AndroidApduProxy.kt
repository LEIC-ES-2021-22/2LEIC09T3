package pt.up.fe.es2122.l2eic09t3.hce

import android.nfc.cardemulation.HostApduService
import android.os.Bundle
import pt.up.fe.es2122.l2eic09t3.hce.pigeon.Pigeon

class AndroidApduProxy : HostApduService() {

    companion object AndroidApduProxyCompanion {
        var running = false
            private set

        lateinit var api: Pigeon.ApduService

        val NACK = ByteArray(2) { return@ByteArray 0 }
    }

    override fun onCreate() {
        super.onCreate()
        running = true
    }

    override fun onDestroy() {
        super.onDestroy()
        running = false
    }

    override fun processCommandApdu(p0: ByteArray?, p1: Bundle?): ByteArray? {
        if (p0 == null) {
            return NACK
        }

        api.processApdu(p0) { it ->
            if (!running) {
                return@processApdu
            }

            if (it == null) {
                notifyUnhandled()
            } else {
                sendResponseApdu(it)
            }
        }

        return null
    }

    override fun onDeactivated(p0: Int) {
        val reason =
            when (p0) {
                HostApduService.DEACTIVATION_LINK_LOSS -> {
                    Pigeon.ServiceDeactivationReason.linkLost
                }
                HostApduService.DEACTIVATION_DESELECTED -> {
                    Pigeon.ServiceDeactivationReason.serviceDeselected
                }
                else -> {
                    throw IllegalArgumentException("Invalid deactivation reason")
                }
            }

        api.processDeactivation(
            Pigeon.ServiceDeactivationReasonWrapper.Builder()
                .setReason(reason)
                .build()
        ) {}
    }


}