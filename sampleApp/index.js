/**
 * @format
 */

import React, { Component } from 'react';
import { AppRegistry } from 'react-native';
import App from './App';
import AppSpec from './specs/AppSpec';
import { name as appName } from './app.json';

import { Tester, TestHookStore } from 'cavy';
const testHookStore = new TestHookStore();

class TestableApp extends Component {
  render() {
    return (
      <Tester specs={[AppSpec]} store={testHookStore}>
        <App/>
      </Tester>
    )
  }
}

AppRegistry.registerComponent(appName, () => TestableApp);
