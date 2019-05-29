package com.sampleapp.bridgetest;

import androidx.test.rule.ActivityTestRule;

import org.junit.Rule;
import org.junit.Test;
import static org.junit.Assert.*;

import com.cavynativereporter.RNCavyNativeReporterModule;
import com.sampleapp.MainActivity;

// Example test that uses the Android Cavy Native Reporter.
// Waits on Cavy to finish running tests and passes if error count is 0.
public class BridgeTest {

  @Rule
  public ActivityTestRule<MainActivity> activityRule = new ActivityTestRule(MainActivity.class);

  @Test
  public void testBridge() throws Exception {
    // Wait 60 seconds to receive a test report from Cavy.
    RNCavyNativeReporterModule.waitForReport(60);
    // Pull the error count from the report object.
    double errorCount = RNCavyNativeReporterModule.cavyReport.getDouble("errorCount");
    // Note: Third argument is the `delta` allowed between the actual and
    // expected double value.
    assertEquals(errorCount, 0.0, 0.0);
  }
}
