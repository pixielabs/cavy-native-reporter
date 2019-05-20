/**
 * @format
 */

import React, { Component } from 'react';
import { AppRegistry } from 'react-native';
import App from './App';
import { name as appName } from './app.json';

import { Tester, TestHookStore } from 'cavy';
import CavyNativeReporter from 'cavy-native-reporter';
import AppSpec from './specs/AppSpec';

const testHookStore = new TestHookStore();
const reporter = (report) => {
  CavyNativeReporter.testsFinished(report);
}

class TestableApp extends Component {
  render() {
    return (
      <Tester specs={[AppSpec]} store={testHookStore} reporter={reporter}>
        <App/>
      </Tester>
    )
  }
}

AppRegistry.registerComponent(appName, () => TestableApp);
