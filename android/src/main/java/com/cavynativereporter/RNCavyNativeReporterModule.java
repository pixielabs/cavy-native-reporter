
package com.cavynativereporter;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.ReadableMap;
import android.util.Log;

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

  @ReactMethod
  public void reporter(ReadableMap report) {
    Log.d("CavyNativeReporter", "Is this thing on?");
  }
}
