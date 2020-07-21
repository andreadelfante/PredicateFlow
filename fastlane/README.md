fastlane documentation
================
# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```
xcode-select --install
```

Install _fastlane_ using
```
[sudo] gem install fastlane -NV
```
or alternatively using `brew install fastlane`

# Available Actions
## iOS
### ios prep
```
fastlane ios prep
```
Prepare and open the workspace
### ios code_lint
```
fastlane ios code_lint
```
Perform a code quality...
### ios podspec_lint
```
fastlane ios podspec_lint
```
Linting podspec
### ios auto_fixing
```
fastlane ios auto_fixing
```
Linting and fixing...
### ios pods
```
fastlane ios pods
```
Install dependencies
### ios test_debug
```
fastlane ios test_debug
```
Run tests for PredicateFlow (Debug config)
### ios test_release
```
fastlane ios test_release
```
Run tests for PredicateFlow (Release config)
### ios deploy
```
fastlane ios deploy
```
Deploy a new version
### ios doc
```
fastlane ios doc
```
Create documentation

----

This README.md is auto-generated and will be re-generated every time [fastlane](https://fastlane.tools) is run.
More information about fastlane can be found on [fastlane.tools](https://fastlane.tools).
The documentation of fastlane can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
