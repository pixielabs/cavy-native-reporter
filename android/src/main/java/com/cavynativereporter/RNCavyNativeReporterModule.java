
package com.cavynativereporter;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.ReadableMap;

public class RNCavyNativeReporterModule extends ReactContextBaseJavaModule {

  private final ReactApplicationContext reactContext;

  public RNCavyNativeReporterModule(ReactApplicationContext reactContext) {
    super(reactContext);
    this.reactContext = reactContext;
  }

  @Override
  public String getName() {
    return "CavyNativeReporter";
  }

  public static Runnable callback = null;
  public static ReadableMap cavyReport = null;

  @ReactMethod
  public void reporter(ReadableMap report) {
    if (callback != null) {
      callback.run();
    } else {
      cavyReport = report;
    }
  }

  public static void onFinish(Runnable block) {
    if (cavyReport != null) {
      block.run();
    } else {
      callback = block;
    }
  }
}
