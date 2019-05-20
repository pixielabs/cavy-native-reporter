# Cavy Native Reporter
A reporter for [Cavy], a React Native testing framework, that reports test
results to either the Android or iOS test runners.

## Installation
To get started using Cavy with native reporting, install using `yarn`:

    yarn add cavy cavy-native-reporter --dev

or `npm`:

    npm i --save-dev cavy cavy-native-reporter

Then link the package:

    react-native link cavy-native-reporter

## Usage

Check out [the sample app](https://github.com/pixielabs/cavy-native-reporter/tree/master/sampleApp)
for a full example of how you may want to integrate cavy-native-reporter into
your native testing setup.

#### 1. Set up Cavy

Follow the instructions in the [Cavy] README to set up a testing entry point
for your app and write your tests.

#### 2. Import and use cavy-native-reporter

Import the `CavyNativeReporter` from cavy-native-reporter. The module
`CavyNativeReporter` has a function `testsFinished`, that takes the test report
and calls a callback function that you can define in your native tester code.
See an example of how you might do this in Step 3 below.

```js
import React, { Component } from 'react';
import { AppRegistry } from 'react-native';
import App from './app';

import { Tester, TestHookStore } from 'cavy';
import CavyNativeReporter from 'cavy-native-reporter';
import IntegrationSpecs from './specs/IntegrationSpecs';

const testHookStore = new TestHookStore();
const reporter = (report) => {
  CavyNativeReporter.testsFinished(report);
}

class TestableApp extends Component {
  render() {
    return (
      <Tester specs={IntegrationSpecs}
        store={testHookStore}
        reporter={reporter}  
        <App/>
      </Tester>
    );
  }
}

AppRegistry.registerComponent('App', () => TestableApp);
```

By default, Cavy sends a test report to [cavy-cli][cli]. Using cavy-native-reporter overrides this functionality.

#### 3. [More steps]
Some instructions on how to allow your native tests to report Cavy tests...

## Contributing
Before contributing, please read the [code of conduct](CODE_OF_CONDUCT.md).
- Check out the latest master to make sure the feature hasn't been implemented
  or the bug hasn't been fixed yet.
- Check out the issue tracker to make sure someone already hasn't requested it
  and/or contributed it.
- Fork the project.
- Start a feature/bugfix branch.
- Commit and push until you are happy with your contribution.
- Please try not to mess with the package.json, version, or history. If you
  want to have your own version, or is otherwise necessary, that is fine, but
  please isolate to its own commit so we can cherry-pick around it.

[cavy]: https://github.com/pixielabs/cavy
[cli]: https://github.com/pixielabs/cavy-cli
