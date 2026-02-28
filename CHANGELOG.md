# Changelog

## [1.0.6] — 2026-02-28

### Security
- **inner-life-core**: Fix shell injection vulnerability in `state.sh` — validate jq paths with allowlist regex, pass values via `--argjson` instead of string interpolation (fixes ClawHub suspicious classification)

## [1.0.5] — 2026-02-28

### Added
- **all skills**: Declare `reads`/`writes` file paths in metadata (fixes ClawHub security scan undeclared file access warnings)

## [1.0.4] — 2026-02-28

### Added
- **all skills**: Add `homepage` and `source` URLs to metadata (fixes ClawHub security scan provenance warnings)

## [1.0.3] — 2026-02-28

### Fixed
- **inner-life-dream**: Update `requires.bins` — replace `bc` with `python3` (caught by ClawHub security scan)

## [1.0.2] — 2026-02-28

### Fixed
- **inner-life-dream**: Published dice roll fix to ClawHub — uses Python `random.random()`

## [1.0.1] — 2026-02-28

### Fixed
- **inner-life-dream**: Replace broken dice roll logic (`bc`/`RANDOM`) with Python `random.random()` — fixes probability calculation and removes unlisted `bc` dependency
- **all skills**: Use `metadata.clawdbot` instead of `metadata.openclaw` in frontmatter (ClawHub compatibility)

### Added
- **inner-life-evolve**: Published to ClawHub (6/6 skills now available)

## [1.0.0] — 2026-02-27

### Added
- **inner-life-core**: Foundation skill — emotion model, 9-step Brain Loop, Context Protocol, state management scripts and templates
- **inner-life-reflect**: Self-reflection with trigger detection and quality gates for SELF.md
- **inner-life-memory**: Structured memory continuity with confidence scores and curiosity backlog
- **inner-life-dream**: Creative exploration during quiet hours with gate logic and configurable topics
- **inner-life-chronicle**: Diary generation from session history
- **inner-life-evolve**: Self-evolution with QUEUE pipeline — analyzes patterns, proposes improvements, never auto-executes
- Full pack installer (`install.sh`)
- Documentation: README, architecture guide, customization guide, cron templates, Anton example
