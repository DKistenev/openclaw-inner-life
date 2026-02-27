# Cron Templates

Recommended schedules for inner-life components.

## Minimal (Brain Loop only)

```
Brain Loop — 3x/day — runs 9-step BRAIN protocol
```

Your agent reads state, works on tasks, updates emotions. Core experience.

## Standard (recommended)

```
Brain Loop      — 3x/day (e.g., 11:00, 15:00, 19:00)
Evening Session — 1x/day (e.g., 21:00)
Night Dream     — quiet hours (e.g., 04:00)
Evolver         — 2x/week (e.g., Wed + Sun 20:00)
```

Evening Session runs: reflection (inner-life-reflect) + diary (inner-life-chronicle) + dream topic selection.

## Full

```
Reflex Loop     — every 3h    — quick state check + emails
Brain Loop ×3   — 11, 15, 19  — full protocol
Evening Session — 21:00       — reflection + diary + dreams
Night Dream     — 04:00       — creative exploration
Evolver         — Wed+Sun 20:00 — self-evolution
Watchdog        — every 6h    — health check
Backup          — 03:00       — state backup
```

## OpenClaw CLI Examples

```bash
openclaw cron add --name "Brain Loop Morning" --cron "0 8 * * *" --tz "America/New_York" --prompt "Run Brain Loop per BRAIN.md"
openclaw cron add --name "Evening Session" --cron "0 21 * * *" --tz "America/New_York" --prompt "Run Evening Session: reflect + chronicle + dream topic"
openclaw cron add --name "Night Dream" --cron "0 4 * * *" --tz "America/New_York" --prompt "Run dreaming skill"
openclaw cron add --name "Evolver" --cron "0 20 * * 3,0" --tz "America/New_York" --prompt "Run inner-life-evolve"
```

Adjust timezone and times to your preference.
