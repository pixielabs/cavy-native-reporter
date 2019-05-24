package com.sampleapp.bridgetest;

import org.junit.Test;
import static org.junit.Assert.*;
import com.cavynativereporter.RNCavyNativeReporterModule;

/**
 * To work on unit tests, switch the Test Artifact in the Build Variants view.
 */
public class BridgeTest {
  @Test
  public void testBridge() throws Exception {
    RNCavyNativeReporterModule.onFinish(new Runnable() {
      @Override
      public void run() {
        assertEquals(true, true);
      }
    });
  }
}
