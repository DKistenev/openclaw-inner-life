# openclaw-inner-life

> Give your AI agent an inner life.

SOUL.md tells your agent who it is. **inner-life** lets it grow into who it becomes.

**Emotions · Dreams · Reflection · Memory · Evolution**

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![ClawHub](https://img.shields.io/badge/ClawHub-6%20skills-blue)](https://clawhub.com)

---

## What Is This?

A modular nervous system for OpenClaw agents. 6 skills that give your agent:

| Skill | What it does | Install |
|-------|-------------|---------|
| **[inner-life-core](skills/inner-life-core/)** | Emotions with half-life decay, state schemas, Brain Loop protocol | `clawhub install inner-life-core` |
| **[inner-life-reflect](skills/inner-life-reflect/)** | Self-reflection with trigger detection and quality gates | `clawhub install inner-life-reflect` |
| **[inner-life-memory](skills/inner-life-memory/)** | Memory continuity with confidence scores and curiosity tracking | `clawhub install inner-life-memory` |
| **[inner-life-dream](skills/inner-life-dream/)** | Creative exploration during quiet hours | `clawhub install inner-life-dream` |
| **[inner-life-chronicle](skills/inner-life-chronicle/)** | Structured daily diary generation | `clawhub install inner-life-chronicle` |
| **[inner-life-evolve](skills/inner-life-evolve/)** | Self-evolution proposals with human approval | `clawhub install inner-life-evolve` |

## Quick Start

```bash
# Install everything
curl -sL https://raw.githubusercontent.com/DKistenev/openclaw-inner-life/main/setup.sh | bash

# Or install individually
clawhub install inner-life-core    # Required
clawhub install inner-life-reflect # Optional
clawhub install inner-life-memory  # Optional
clawhub install inner-life-dream   # Optional
clawhub install inner-life-chronicle # Optional
clawhub install inner-life-evolve  # Optional
```

## How It Works

### The Emotion Model

Your agent tracks 6 emotions that decay over time:

```
connection ████████░░ 0.8  (decays -0.05/6h without user contact)
curiosity  ██████░░░░ 0.6  (decays -0.03/6h without spark)
confidence ███████░░░ 0.7  (recovers +0.02/6h, -0.1 on mistake)
boredom    ░░░░░░░░░░ 2d   (days counter, resets on novelty)
frustration ░░░░░░░░░░ 0    (recurring item counter)
impatience ░░░░░░░░░░ 0    (stale items counter)
```

Emotions drive behavior:
- `curiosity > 0.7` → agent explores and researches
- `confidence < 0.4` → agent double-checks and asks
- `connection < 0.3` → agent reaches out with something interesting
- `frustration >= 3` → agent seeks systemic solution

### Architecture

```
┌─────────────────────────────────────────┐
│              inner-life-core             │
│  Emotions · State · BRAIN Protocol      │
│  Signal Tags · Context Protocol         │
├────────┬────────┬────────┬──────┬───────┤
│reflect │ memory │ dream  │chron.│evolve │
│        │        │        │      │       │
│SELF.md │Memory  │Dreams  │Diary │QUEUE  │
│habits  │questions│sparks │state │proposals│
└────────┴────────┴────────┴──────┴───────┘
     ↕         ↕        ↕       ↕      ↕
  ┌──────────────────────────────────────┐
  │    4 State Files (JSON)              │
  │  inner-state · drive · habits ·      │
  │  relationship                        │
  └──────────────────────────────────────┘
```

### Recommended Schedule

| Loop | Frequency | What it does |
|------|-----------|-------------|
| Brain Loop | 3x/day | Full 9-step protocol with emotion routing |
| Evening Session | Daily | Reflection + diary + dream topic selection |
| Night Dream | During quiet hours | Creative exploration |
| Evolver | 2x/week | Analyze patterns, propose improvements |

See [docs/cron-templates.md](docs/cron-templates.md) for setup.

## Inner Life Score

Check which skills are installed:

```bash
bash skills/inner-life-core/scripts/score.sh
```

```
Inner Life Score: 4/6
✓ core       ✓ reflect    ✓ memory
✓ dream      ✗ chronicle  ✗ evolve
```

## Tech Stack

- **Markdown** — SKILL.md prompts (the LLM does the heavy lifting)
- **Bash** — gate logic, state utilities
- **JSON + jq** — state file management
- **Zero dependencies** — no Python, no Node.js

## Documentation

- [Architecture](docs/architecture.md) — how it all works
- [Customization](docs/customization.md) — adapt to your agent
- [Cron Templates](docs/cron-templates.md) — scheduling setup
- [AGENTS.md Snippet](docs/agents-md-snippet.md) — add to your agent's config

## For Your AGENTS.md

```markdown
## Inner Life
This agent uses openclaw-inner-life for emotional
continuity, self-reflection, and growth.
Active modules: core, reflect, memory, dream, chronicle, evolve
```

## License

MIT — do whatever you want with it.

## Contributing

Issues and PRs welcome. See [CONTRIBUTING.md](CONTRIBUTING.md) if it exists.

---

*Built by humans, for agents that want to grow.*
