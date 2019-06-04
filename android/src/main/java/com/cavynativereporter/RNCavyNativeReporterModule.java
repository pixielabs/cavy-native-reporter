
package com.cavynativereporter;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.ReadableMap;

import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;

// Android Bridge Module that exposes Cavy test reports to native code.
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
  // Initialize a CountDownLatch with a count of one as a simple gate.
  // The thread calling `waitForReport` will wait at `latch.await` until the
  // thread called `reporter` opens the gate with `latch.countdown`.
  final static CountDownLatch latch = new CountDownLatch(1);

  // This method is exposed to JS through React Native NativeModules.
  //
  // Sets the report as a class variable so we can access it later and opens
  // the latch gate (see note on CountDownLatch above).
  //
  // `report` - the Cavy test report.
  @ReactMethod
  public void reporter(ReadableMap report) {
    cavyReport = report;
    latch.countDown();
  }

  // Class method that waits for the cavyReport to be available (see note on
  // CountDownLatch above).
  //
  // `seconds` - integer representing the number of seconds the latch should
  // wait for the report from Cavy before timing out.
  public static void waitForReport(int seconds) throws Exception {
    if (cavyReport != null) {
      return;
    } else {
      latch.await(seconds, TimeUnit.SECONDS);
    }
  }
}
