
package com.cavynativereporter;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.ReadableMap;

import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;

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

  public static ReadableMap cavyReport = null;
  final static CountDownLatch latch = new CountDownLatch(1);

  @ReactMethod
  public void reporter(ReadableMap report) {
    cavyReport = report;
    latch.countDown();
  }

  public static void waitForReport(int seconds) throws Exception {
    if (cavyReport != null) {
      return;
    } else {
      latch.await(seconds, TimeUnit.SECONDS);
    }
  }
}
