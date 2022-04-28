fastlane documentation
----

# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```sh
xcode-select --install
```

For _fastlane_ installation instructions, see [Installing _fastlane_](https://docs.fastlane.tools/#installing-fastlane)

# Available Actions

## iOS

### ios prep

```sh
[bundle exec] fastlane ios prep
```

Prepare and open the workspace

### ios code_lint

```sh
[bundle exec] fastlane ios code_lint
```

Perform a code quality...

### ios podspec_lint

```sh
[bundle exec] fastlane ios podspec_lint
```

Linting podspec

### ios auto_fixing

```sh
[bundle exec] fastlane ios auto_fixing
```

Linting and fixing...

### ios pods

```sh
[bundle exec] fastlane ios pods
```

Install dependencies

### ios test_debug

```sh
[bundle exec] fastlane ios test_debug
```

Run tests for PredicateFlow (Debug config)

### ios test_release

```sh
[bundle exec] fastlane ios test_release
```

Run tests for PredicateFlow (Release config)

### ios deploy

```sh
[bundle exec] fastlane ios deploy
```

Deploy a new version

### ios doc

```sh
[bundle exec] fastlane ios doc
```

Create documentation

----

This README.md is auto-generated and will be re-generated every time [_fastlane_](https://fastlane.tools) is run.

More information about _fastlane_ can be found on [fastlane.tools](https://fastlane.tools).

The documentation of _fastlane_ can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
