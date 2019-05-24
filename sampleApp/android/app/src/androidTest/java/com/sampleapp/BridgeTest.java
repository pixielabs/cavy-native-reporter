package com.sampleapp.bridgetest;

import org.junit.Test;
import static org.junit.Assert.*;
import com.cavynativereporter.RNCavyNativeReporterModule;

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
