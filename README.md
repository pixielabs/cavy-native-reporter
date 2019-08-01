<p align="center">
  <img src='https://cloud.githubusercontent.com/assets/126989/22546798/6cf18938-e936-11e6-933f-da756b9ee7b8.png' alt='Cavy logo' />
</p>

# Cavy Native Reporter

[![npm version](https://badge.fury.io/js/cavy-native-reporter.svg)](https://badge.fury.io/js/cavy-native-reporter)

A reporter for [Cavy], a React Native testing framework, that reports test
results to native Android or iOS test runners.

By default Cavy reports a completed test run to [cavy-cli][cli].
Cavy Native Reporter provides an alternative reporter for Cavy which fires
a Native Module callback when tests are finished. You can then wire this
in to a native test runner such as XCTest.

You may want to do this if you already have some application tests that are
native, e.g. if you already use XCTest to test parts of your app. This could
be because not all of your app is React Native, or if you app makes heavy
use of native code. You may also want to use it if you have an existing
CI pipeline set up for running a native test framework, and don't want to
adapt it for Cavy & cavy-cli.

You probably don't need this if your app is purely a React Native app
and you have no existing native tests. You can probably just use cavy-cli
instead.

## Getting started
Follow the [Cavy Native Reporter guide](https://cavy.app/docs/guides/cavy-native-reporter/installing-and-usage) to integrate Cavy into your native testing setup.

Full API documentation can be found on the [Cavy website](https://cavy.app/docs/api/cavy-native-reporter).

You can also check out the [sample app](https://github.com/pixielabs/cavy-native-reporter/tree/master/sampleApp)
for more inspiration!

## Thank you!
Cavy Native Reporter was inspired by work done by [Nozbe](https://nozbe.com) on
[WatermelonDB](https://github.com/Nozbe/WatermelonDB), a high-performance
database framework for React that uses Cavy for running native integration
tests.

Thank you to [Radek](https://github.com/radex) in particular who really helped
get it off the ground :heart:.

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
