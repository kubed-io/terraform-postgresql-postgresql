# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

<!--
  These ARE the release notes. One short line per entry, written for a user of the
  modules. CI-only, test-only and docs-only PRs take the `no changelog` label.
-->


## [Unreleased]

## [0.0.2] - 2026-10-12

### Added

- `server` module: the roles a PostgreSQL server needs, from one list.
- `database` module: a database with its grants, schemas and extensions.
- `role` module: a PostgreSQL role.
- Crossplane CRDs for `server`, `database` and `role` (`*.postgresql.kubed.io`), pinned to the release's own modules and pulled once per release.
