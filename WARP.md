# WARP.md

This file provides guidance to WARP (warp.dev) when working with code in this repository.

## Overview
JUANIA is a Flutter (Dart) app for university students. The project follows a simplified Clean Architecture with feature-based modules.

## Common Commands

Setup

```bash
# Install dependencies
flutter pub get

# Copy environment file and edit your local values
cp .env.example .env
```

Run

```bash
# Run on the default device (debug)
flutter run

# List available devices and run on a specific one
flutter devices
flutter run -d <device_id>
```

Code quality

```bash
# Static analysis
flutter analyze

# Format code
flutter format .
```

Tests

```bash
# Run all tests
flutter test

# Run a single test file
flutter test test/path/to/file_test.dart

# Run tests matching a name substring
flutter test --plain-name "substring of test name"

# Coverage
flutter test --coverage
# Generate and open HTML report (requires lcov)
genhtml coverage/lcov.info -o coverage/html
open coverage/html/index.html
```

Builds

```bash
# Android
flutter build apk --release
flutter build appbundle --release

# iOS (requires Xcode setup)
flutter build ios --release

# Web
flutter build web --release
```

## Environment
- Copy `.env.example` to `.env`. Typical keys:
  - API_BASE_URL, API_TIMEOUT, APP_NAME, APP_ENV, DEBUG_MODE
- The app uses `flutter_dotenv` to load runtime configuration.

## Architecture and Structure
High-level structure (see README for a fuller tree):

- Entry point: `lib/main.dart`
- Core module: `lib/core/`
  - `config/` global configuration
  - `constants/` app-wide constants
  - `theme/` colors and theming
  - `utils/` helpers
  - `widgets/` reusable UI components
- Features: `lib/features/<feature>/`
  - Example modules: `home/`, `chat/`, `schedule/`
  - Presentation layer under `presentation/` (pages, widgets)
- Tests: `test/`

Key technology choices (from README):
- State management: Provider
- Navigation: go_router
- Storage: Hive, SharedPreferences
- Networking: Dio (and http)
- Utilities: intl, logger, equatable, flutter_dotenv

## Conventions
- Commits follow Conventional Commits (feat, fix, docs, style, refactor, test, chore).

## Pointers for Warp
- Prefer running analysis and formatting before proposing changes (`flutter analyze`, `flutter format .`).
- When suggesting or running a single test, use either the file path or `--plain-name` to narrow scope.
- If adding a new feature, place code under `lib/features/<feature>/presentation/...` and reuse components from `lib/core/` when possible.
