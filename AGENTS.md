# AGENTS.md

This file provides guidance to LLMs when working with code in this repository.

## Project Overview

A Dart/Flutter package for consuming Atlassian's Status Page API. Provides typed access to pages, components, incidents, and summary data.

## Commands

```bash
# Get dependencies
flutter pub get

# Run code generation (after modifying models or API)
flutter pub run build_runner build --delete-conflicting-outputs

# Run tests (requires environment variables: API_KEY, PAGE_ID, COMPONENT_ID)
flutter test

# Analyze code
flutter analyze

# Publish (dry-run then publish)
make publish
```

## Architecture

The library uses a single-file architecture with `part` directives. All public types are exposed through `lib/status_page.dart`.

**Key components:**
- `StatusPage` class (`lib/status_page.dart`): Main entry point. Takes an API key, provides async methods for pages, components, and incidents
- `StatusPageApi` (`lib/network/status_page_api.dart`): Retrofit-annotated abstract class that generates HTTP client code
- Models (`lib/models/`): Page, Component, Incident, Summary - all use json_annotation for serialization
- Generated code: `lib/status_page.g.dart` contains Retrofit client and JSON serialization (do not edit manually)

**Data flow:**
1. `StatusPage` wraps `StatusPageApi` (Retrofit client)
2. API responses are deserialized into model classes
3. Errors are caught and converted to typed exceptions (`AuthException`, `ConnectionException`, etc.)

**Two API access patterns:**
1. Authenticated API (`StatusPage` instance methods): Requires API key, uses `api.statuspage.io/v1`
2. Public summary API (`StatusPage.summary` static method): No auth needed, uses `{domain}/api/v2/summary.json`
