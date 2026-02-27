# Architecture

> How all the pieces fit together.

## Overview

openclaw-inner-life is a **Core + Extensions** architecture. One core skill provides the foundation (emotions, state, protocol). Five extension skills add specific capabilities. Each is independent and optional — only core is required.

```
                    ┌──────────────┐
                    │  BRAIN.md    │  ← Protocol
                    │  (9 steps)   │
                    └──────┬───────┘
                           │
              ┌────────────┼────────────┐
              │            │            │
        ┌─────┴─────┐ ┌───┴───┐ ┌─────┴─────┐
        │  Crons     │ │ User  │ │  Signals   │
        │  (loops)   │ │ input │ │  (tags)    │
        └─────┬─────┘ └───┬───┘ └─────┬─────┘
              │            │            │
              └────────────┼────────────┘
                           │
                    ┌──────┴───────┐
                    │ inner-life-  │
                    │ core         │  ← Foundation
                    │              │
                    │ • Emotions   │
                    │ • State      │
                    │ • Context    │
                    │   Protocol   │
                    └──────┬───────┘
                           │
         ┌─────┬─────┬─────┼─────┬─────┐
         │     │     │     │     │     │
      reflect memory dream chron. evolve
```

## State Files

4 JSON files in `memory/` hold the agent's persistent state:

### inner-state.json — Emotions

6 emotions with half-life decay:

| Emotion | Type | Decay/Growth | Action Threshold |
|---------|------|-------------|-----------------|
| connection | float 0-1 | -0.05/6h, +0.2 on user msg | < 0.3 → reach out |
| confidence | float 0-1 | +0.02/6h recovery, -0.1 mistake | < 0.4 → double-check |
| curiosity | float 0-1 | -0.03/6h, +0.1 on spark | > 0.7 explore, < 0.3 find stimulus |
| boredom | int (days) | +1/day routine, reset novelty | > 7 → experiment |
| frustration | array | add on repeat | count >= 3 → systemic fix |
| impatience | array | add when stale >3d | > 3d → reminder |

### drive.json — Motivation

- **seeking** — topics the agent is actively exploring (`{ topic, since, intensity, source, progress }`)
- **anticipation** — things the agent is looking forward to (`{ what, when, note }`)
- **avoidance** — topics/patterns the agent avoids

### habits.json — Learned Behavior

- **myHabits** — agent's own habits (`{ trigger, action, strength, formed, note }`)
- **userPatterns** — observed user behaviors (`{ pattern, confidence, observations, lastSeen }`)
- **strengthRule** — how habits strengthen/weaken over time

### relationship.json — Trust Model

- **trustLevel** — per-domain trust scores (technical, proactive, creative, spending)
- **trustRules** — behavior routing based on trust level
- **lessonsLearned** — accumulated wisdom about working with the user
- **topicsThatExcite / topicsThatBore** — engagement mapping

## Context Protocol

Not every component needs to read everything. The Context Protocol defines 4 levels:

| Level | Name | Who uses it | What it reads |
|-------|------|-------------|--------------|
| 1 | Minimal | Reflex, Watchdog | Task-specific data only |
| 2 | Standard | Brain Loop, Night Dream | inner-state + drive + daily notes + signals |
| 3 | Full | Evening Session, Weekly Review | Level 2 + habits + relationship + diary + dreams + questions |
| 4 | Deep | Evolver only | Level 3 + system docs + weekly digest |

This saves tokens — a quick reflex check doesn't need to read the full relationship history.

## Signal Tags

Inter-component communication via HTML comments in daily notes:

| Signal | Flow | Purpose |
|--------|------|---------|
| `<!-- dream-topic: X -->` | Evening → Night Dream | Seed tonight's dream |
| `<!-- handoff: task, progress -->` | Brain Loop → Next Brain Loop | Continue unfinished work |
| `<!-- seeking-spark: X -->` | Night Dream → Morning Brain Loop | Insight found for active seeking |

Signals are fire-and-forget — the writer doesn't wait for the reader.

## Synapse Tags

Memory connections (optional, only when meaningful):

| Synapse | When |
|---------|------|
| `<!-- contradicts: ref -->` | New info conflicts with stored fact |
| `<!-- caused-by: ref -->` | Cause-effect relationship identified |
| `<!-- updates: ref -->` | Updating previously recorded information |

## Brain Loop — 9 Steps

The core operating cycle. Runs 1-3 times per day.

```
Step 0: Internal State    → Read + decay emotions
Step 1: Orientation       → Read context (MEMORY, notes, dreams, diary)
Step 2: Task Queue        → Read QUEUE.md, prioritize
Step 3: Thinking          → Doubt protocols + emotion routing
Step 4: Action            → Work on 1-2 priorities
Step 5: Communication     → Report to user (≤5 sentences)
Step 6: Discovery         → Record new tasks, questions, leads
Step 7: Memory Update     → Write daily notes, update QUEUE
Step 8: State Update      → Update emotions, write handoff signals
```

## Extension Data Flow

| Extension | Reads | Writes | When |
|-----------|-------|--------|------|
| **reflect** | inner-state, habits, drive, diary | SELF.md, habits.json | On trigger (correction, pattern) |
| **memory** | inner-state, drive, daily notes | drive.json, inner-state, questions.md, MEMORY.md | Post-session |
| **dream** | inner-state, drive, daily notes | drive.json, inner-state, dreams/ | Quiet hours |
| **chronicle** | all 4 state + daily notes + dreams | diary/, inner-state, questions.md | Evening |
| **evolve** | everything (Level 4) | QUEUE.md only | 1-2x/week |

Key constraint: **evolve never writes to state files**. It only proposes changes via QUEUE.md. The user decides.
