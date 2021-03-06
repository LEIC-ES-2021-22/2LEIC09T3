// Autogenerated from Pigeon (v3.1.0), do not edit directly.
// See also: https://pub.dev/packages/pigeon

package pt.up.fe.es2122.l2eic09t3.hce.pigeon;

import android.util.Log;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import io.flutter.plugin.common.BasicMessageChannel;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MessageCodec;
import io.flutter.plugin.common.StandardMessageCodec;
import java.io.ByteArrayOutputStream;
import java.nio.ByteBuffer;
import java.util.Arrays;
import java.util.ArrayList;
import java.util.Map;
import java.util.HashMap;

/** Generated class from Pigeon. */
@SuppressWarnings({"unused", "unchecked", "CodeBlock2Expr", "RedundantSuppression"})
public class Pigeon {

  public enum HceState {
    unsupported(0),
    unavailable(1),
    stopped(2),
    running(3);

    private int index;
    private HceState(final int index) {
      this.index = index;
    }
  }

  public enum ServiceDeactivationReason {
    linkLost(0),
    serviceDeselected(1);

    private int index;
    private ServiceDeactivationReason(final int index) {
      this.index = index;
    }
  }

  /** Generated class from Pigeon that represents data sent in messages. */
  public static class HceStateWrapper {
    private @NonNull HceState state;
    public @NonNull HceState getState() { return state; }
    public void setState(@NonNull HceState setterArg) {
      if (setterArg == null) {
        throw new IllegalStateException("Nonnull field \"state\" is null.");
      }
      this.state = setterArg;
    }

    /** Constructor is private to enforce null safety; use Builder. */
    private HceStateWrapper() {}
    public static final class Builder {
      private @Nullable HceState state;
      public @NonNull Builder setState(@NonNull HceState setterArg) {
        this.state = setterArg;
        return this;
      }
      public @NonNull HceStateWrapper build() {
        HceStateWrapper pigeonReturn = new HceStateWrapper();
        pigeonReturn.setState(state);
        return pigeonReturn;
      }
    }
    @NonNull Map<String, Object> toMap() {
      Map<String, Object> toMapResult = new HashMap<>();
      toMapResult.put("state", state == null ? null : state.index);
      return toMapResult;
    }
    static @NonNull HceStateWrapper fromMap(@NonNull Map<String, Object> map) {
      HceStateWrapper pigeonResult = new HceStateWrapper();
      Object state = map.get("state");
      pigeonResult.setState(state == null ? null : HceState.values()[(int)state]);
      return pigeonResult;
    }
  }

  /** Generated class from Pigeon that represents data sent in messages. */
  public static class ServiceDeactivationReasonWrapper {
    private @NonNull ServiceDeactivationReason reason;
    public @NonNull ServiceDeactivationReason getReason() { return reason; }
    public void setReason(@NonNull ServiceDeactivationReason setterArg) {
      if (setterArg == null) {
        throw new IllegalStateException("Nonnull field \"reason\" is null.");
      }
      this.reason = setterArg;
    }

    /** Constructor is private to enforce null safety; use Builder. */
    private ServiceDeactivationReasonWrapper() {}
    public static final class Builder {
      private @Nullable ServiceDeactivationReason reason;
      public @NonNull Builder setReason(@NonNull ServiceDeactivationReason setterArg) {
        this.reason = setterArg;
        return this;
      }
      public @NonNull ServiceDeactivationReasonWrapper build() {
        ServiceDeactivationReasonWrapper pigeonReturn = new ServiceDeactivationReasonWrapper();
        pigeonReturn.setReason(reason);
        return pigeonReturn;
      }
    }
    @NonNull Map<String, Object> toMap() {
      Map<String, Object> toMapResult = new HashMap<>();
      toMapResult.put("reason", reason == null ? null : reason.index);
      return toMapResult;
    }
    static @NonNull ServiceDeactivationReasonWrapper fromMap(@NonNull Map<String, Object> map) {
      ServiceDeactivationReasonWrapper pigeonResult = new ServiceDeactivationReasonWrapper();
      Object reason = map.get("reason");
      pigeonResult.setReason(reason == null ? null : ServiceDeactivationReason.values()[(int)reason]);
      return pigeonResult;
    }
  }
  private static class HceServiceCodec extends StandardMessageCodec {
    public static final HceServiceCodec INSTANCE = new HceServiceCodec();
    private HceServiceCodec() {}
    @Override
    protected Object readValueOfType(byte type, ByteBuffer buffer) {
      switch (type) {
        case (byte)128:         
          return HceStateWrapper.fromMap((Map<String, Object>) readValue(buffer));
        
        default:        
          return super.readValueOfType(type, buffer);
        
      }
    }
    @Override
    protected void writeValue(ByteArrayOutputStream stream, Object value)     {
      if (value instanceof HceStateWrapper) {
        stream.write(128);
        writeValue(stream, ((HceStateWrapper) value).toMap());
      } else 
{
        super.writeValue(stream, value);
      }
    }
  }

  /** Generated interface from Pigeon that represents a handler of messages from Flutter.*/
  public interface HceService {
    @NonNull HceStateWrapper getState();
    void start();
    void stop();

    /** The codec used by HceService. */
    static MessageCodec<Object> getCodec() {
      return HceServiceCodec.INSTANCE;
    }

    /** Sets up an instance of `HceService` to handle messages through the `binaryMessenger`. */
    static void setup(BinaryMessenger binaryMessenger, HceService api) {
      {
        BasicMessageChannel<Object> channel =
            new BasicMessageChannel<>(binaryMessenger, "pt.up.fe.es2122.l2eic09t3.hce.pigeon.HceService.getState", getCodec());
        if (api != null) {
          channel.setMessageHandler((message, reply) -> {
            Map<String, Object> wrapped = new HashMap<>();
            try {
              HceStateWrapper output = api.getState();
              wrapped.put("result", output);
            }
            catch (Error | RuntimeException exception) {
              wrapped.put("error", wrapError(exception));
            }
            reply.reply(wrapped);
          });
        } else {
          channel.setMessageHandler(null);
        }
      }
      {
        BasicMessageChannel<Object> channel =
            new BasicMessageChannel<>(binaryMessenger, "pt.up.fe.es2122.l2eic09t3.hce.pigeon.HceService.start", getCodec());
        if (api != null) {
          channel.setMessageHandler((message, reply) -> {
            Map<String, Object> wrapped = new HashMap<>();
            try {
              api.start();
              wrapped.put("result", null);
            }
            catch (Error | RuntimeException exception) {
              wrapped.put("error", wrapError(exception));
            }
            reply.reply(wrapped);
          });
        } else {
          channel.setMessageHandler(null);
        }
      }
      {
        BasicMessageChannel<Object> channel =
            new BasicMessageChannel<>(binaryMessenger, "pt.up.fe.es2122.l2eic09t3.hce.pigeon.HceService.stop", getCodec());
        if (api != null) {
          channel.setMessageHandler((message, reply) -> {
            Map<String, Object> wrapped = new HashMap<>();
            try {
              api.stop();
              wrapped.put("result", null);
            }
            catch (Error | RuntimeException exception) {
              wrapped.put("error", wrapError(exception));
            }
            reply.reply(wrapped);
          });
        } else {
          channel.setMessageHandler(null);
        }
      }
    }
  }
  private static class ApduServiceCodec extends StandardMessageCodec {
    public static final ApduServiceCodec INSTANCE = new ApduServiceCodec();
    private ApduServiceCodec() {}
    @Override
    protected Object readValueOfType(byte type, ByteBuffer buffer) {
      switch (type) {
        case (byte)128:         
          return ServiceDeactivationReasonWrapper.fromMap((Map<String, Object>) readValue(buffer));
        
        default:        
          return super.readValueOfType(type, buffer);
        
      }
    }
    @Override
    protected void writeValue(ByteArrayOutputStream stream, Object value)     {
      if (value instanceof ServiceDeactivationReasonWrapper) {
        stream.write(128);
        writeValue(stream, ((ServiceDeactivationReasonWrapper) value).toMap());
      } else 
{
        super.writeValue(stream, value);
      }
    }
  }

  /** Generated class from Pigeon that represents Flutter messages that can be called from Java.*/
  public static class ApduService {
    private final BinaryMessenger binaryMessenger;
    public ApduService(BinaryMessenger argBinaryMessenger){
      this.binaryMessenger = argBinaryMessenger;
    }
    public interface Reply<T> {
      void reply(T reply);
    }
    static MessageCodec<Object> getCodec() {
      return ApduServiceCodec.INSTANCE;
    }

    public void processApdu(@NonNull byte[] commandArg, Reply<byte[]> callback) {
      BasicMessageChannel<Object> channel =
          new BasicMessageChannel<>(binaryMessenger, "pt.up.fe.es2122.l2eic09t3.hce.pigeon.ApduService.processApdu", getCodec());
      channel.send(new ArrayList<Object>(Arrays.asList(commandArg)), channelReply -> {
        @SuppressWarnings("ConstantConditions")
        byte[] output = (byte[])channelReply;
        callback.reply(output);
      });
    }
    public void processDeactivation(@NonNull ServiceDeactivationReasonWrapper reasonArg, Reply<Void> callback) {
      BasicMessageChannel<Object> channel =
          new BasicMessageChannel<>(binaryMessenger, "pt.up.fe.es2122.l2eic09t3.hce.pigeon.ApduService.processDeactivation", getCodec());
      channel.send(new ArrayList<Object>(Arrays.asList(reasonArg)), channelReply -> {
        callback.reply(null);
      });
    }
  }
  private static Map<String, Object> wrapError(Throwable exception) {
    Map<String, Object> errorMap = new HashMap<>();
    errorMap.put("message", exception.toString());
    errorMap.put("code", exception.getClass().getSimpleName());
    errorMap.put("details", "Cause: " + exception.getCause() + ", Stacktrace: " + Log.getStackTraceString(exception));
    return errorMap;
  }
}
