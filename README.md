# Cavy Native Reporter (Work in progress)
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
`CavyNativeReporter` has a method `reporter`, that takes the test report
and calls a callback function that you can define in your native tester code.
See examples of how you might do this in [Reporting to Native Tests](#reporting-to-native-tests) below.

```js
import React, { Component } from 'react';
import { AppRegistry } from 'react-native';
import App from './app';
import { Tester, TestHookStore } from 'cavy';
import IntegrationSpecs from './specs/IntegrationSpecs';

// Extra import for cavy-native-reporter:
import CavyNativeReporter from 'cavy-native-reporter';

const testHookStore = new TestHookStore();

class TestableApp extends Component {
  render() {
    return (
      <Tester specs={IntegrationSpecs}
        store={testHookStore}
        // Extra prop for cavy-native reporter:
        reporter={CavyNativeReporter.reporter}  
        <App/>
      </Tester>
    );
  }
}

AppRegistry.registerComponent('App', () => TestableApp);
```

By default, Cavy sends a test report to [cavy-cli][cli]. Using
cavy-native-reporter overrides this functionality.

## Reporting to Native Tests

### iOS XCTest (Objective C)
`CavyNativeReporter` has a method `onFinishWithBlock` that you can call from
your native tests.

`onFinishWithBlock` takes a block with a single argument, which is the report
object from Cavy. The block is called as soon as the test report is available
from Cavy and the report has the following structure:

The `report` argument passed to the block is an `NSDictionary` with the
following structure:

```objc
{
  duration = "0.2";
  errorCount = 0;
  results = (
    {
      message = "Test suite description: test number 1";
      passed = 1;
    },
    {
      message = "Test suite description: test number 2";
      passed = 0;
    }
  );
}
```

So if you need to, it's possible to iterate over the results and log more
detailed messages.


To set up your own XCTestCase using `cavy-native-reporter`:
1. Open your project's `.xcodeproj` (or `.xcworkspace`) in Xcode.
2. In the Project navigator view, navigate to the folder containing your XCTest
test cases.
3. Create a new test case (select New File -> Unit Test Case Class).
4. Import `<CavyNativeReporter/CavyNativeReporter.h>`
5. Write your expectation!

Taking the sample app as an example, we have an XCTestCase `BridgeTest` which
waits for Cavy tests to run and fails if any test returns an error:

```objc
#import <XCTest/XCTest.h>
#import <CavyNativeReporter/CavyNativeReporter.h>

@interface BridgeTest : XCTestCase

@end

@implementation BridgeTest

- (void)testBridge {
  // Make a new expectation
  XCTestExpectation *expectation = [[XCTestExpectation alloc] initWithDescription: @"Cavy tests passed"];

  [CavyNativeReporter onFinishWithBlock: ^void(NSDictionary* report) {
    long errorCount = [report[@"errorCount"] integerValue];
    if (errorCount > 0) {
      XCTFail(@"Cavy tests had one or more errors");
    }
    [expectation fulfill];
  }];


  [self waitForExpectations:@[expectation] timeout:100];
}

@end
```

### iOS XCTest (Swift)
You could achieve the same thing in Swift with the following steps:

1. Follow the steps above for creating a new test case, but choose Swift when
prompted to choose a language.
2. Make sure that a Bridging Header file has also been created (Xcode will
usually prompt you to create one if this is your first Swift file in the
project).
3. Import `<CavyNativeReporter/CavyNativeReporter.h>` in your Bridging Header.
4. Write your expectation!

The following Swift code is equivalent to the Objective-C example above (note
that the method `onFinishWithBlock` is renamed when you reference it in Swift):

```swift
@testable import sampleApp
import XCTest
import Nimble

class BridgeTest: XCTestCase {
  func testBridge() {
    waitUntil(timeout: 100) { done in
      CavyNativeReporter.onFinish { report in
        let errorCount = report["errorCount"] as! Int;
        if (errorCount > 0) {
          fail("Tests failed")
        } else {
          NSLog("Tests completed")
        }
        done()
      }
    }
  }
}
```

#### Android

TBD!

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
