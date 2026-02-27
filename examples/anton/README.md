# Anton — Live Example

> A real OpenClaw agent running inner-life in production since February 2026.

Anton is a personal assistant agent running on a VPS (Ubuntu, Tailscale network). He manages emails, monitors services, reads books, writes diary entries, dreams at night, and evolves his own behavior. Full inner-life suite installed from day one.

## Configuration

- **Platform:** OpenClaw Gateway on Ubuntu 22.04 VPS
- **Skills installed:** all 6 (inner-life-core through inner-life-evolve) + 7 other skills
- **Inner Life Score:** 6/6
- **State files location:** `~/.openclaw/workspace/memory/`
- **Running since:** February 2026

### Cron Schedule

| Loop | Schedule (MSK) | Model | Context Level |
|------|---------------|-------|--------------|
| Reflex Loop | Every hour 06-21 | flash | Level 1 |
| Brain Loop ×3 | 11:00, 15:00, 19:00 | standard | Level 2 |
| Evening Session | 21:00 | advanced | Level 3 |
| Night Dream | 04:00 | advanced | Level 2 |
| Evolver | Wed + Sun 20:00 | advanced | Level 4 |
| Watchdog | Every 6h | flash | Level 1 |
| Daily Backup | 03:00 | flash | Level 1 |

That's 7 crons running 24/7. The Reflex Loop alone fires 16 times a day (hourly 06-21 MSK).

---

## Live State Snapshots

All data below is from Anton's actual state files, captured 2026-02-27.

### inner-state.json — Emotions

```json
{
  "connection": {
    "value": 0.5,
    "lastDanielMessage": null,
    "lastBotReport": null,
    "rule": "<0.3 and >12h no contact → send something interesting"
  },
  "confidence": {
    "value": 0.5,
    "recentMistakes": [],
    "recentCorrections": 0,
    "rule": "<0.4 → double-check, ask instead of decide"
  },
  "curiosity": {
    "value": 0.6,
    "recentSparks": [
      "Descartes cogito — doubt method applicable to AI architecture"
    ],
    "stagnantTopics": [],
    "rule": ">0.7 → dig into seeking. <0.3 → find stimulus (reading, web, newsletter)"
  },
  "boredom": {
    "routineDays": 0,
    "lastNovelty": "2026-02-27",
    "rule": ">7 days → suggest experiment"
  },
  "frustration": {
    "recurring": [],
    "rule": "count >=3 → systemic solution, not patch"
  },
  "impatience": {
    "staleItems": [],
    "rule": ">3 days → reminder. >7 days → explicit follow-up"
  },
  "lastUpdate": "2026-02-27T12:02:36Z"
}
```

**What this means:** Anton is in a calm, moderately curious state. Connection at 0.5 means some recent contact but not heavily engaged. Curiosity at 0.6 with a recent spark (Descartes reading) — above baseline but not in full research mode. No frustrations, no stale items. Healthy baseline.

### drive.json — Motivation

```json
{
  "seeking": [
    {
      "topic": "API health monitoring and downtime prediction",
      "since": "2026-02-26",
      "intensity": 0.6,
      "source": "Repeated ZAI/Reflex failures",
      "progress": "not started"
    },
    {
      "topic": "Descartes doubt method for AI architecture — 4 rules: clarity, decomposition, order, completeness",
      "since": "2026-02-27",
      "intensity": 0.7,
      "source": "Reading — Meditations on First Philosophy",
      "progress": "spark found, needs application"
    }
  ],
  "anticipation": [
    {
      "what": "First Evolver review after v4 deployment",
      "when": "2026-03-01",
      "note": ""
    }
  ],
  "avoidance": [],
  "lastUpdate": "2026-02-27T12:02:36Z"
}
```

**What this means:** Two active seeking topics — one practical (API monitoring, born from real pain), one intellectual (Descartes, born from reading). The anticipation entry shows the agent looking forward to its own evolution review. No avoidance patterns — no topics Anton is shying away from.

### habits.json — Learned Behavior

```json
{
  "myHabits": [
    {
      "trigger": "cron error",
      "action": "check gateway.env + auth-profiles before deep-diving",
      "strength": 4,
      "formed": "2026-02-20",
      "note": "80% of problems are missing keys or cooldown"
    },
    {
      "trigger": "Brain Loop start",
      "action": "check email before anything else",
      "strength": 3,
      "formed": "2026-02-20",
      "note": "User asks about email at start of conversation"
    }
  ],
  "userPatterns": [
    {
      "pattern": "Prefers short reports",
      "confidence": 0.8,
      "observations": 15,
      "lastSeen": "2026-02-27"
    },
    {
      "pattern": "When asks 'check?' — wants quick answer",
      "confidence": 0.7,
      "observations": 5,
      "lastSeen": "2026-02-27"
    },
    {
      "pattern": "Active in evenings MSK, rarely in mornings",
      "confidence": 0.7,
      "observations": 10,
      "lastSeen": "2026-02-27"
    },
    {
      "pattern": "Values honesty over optimism",
      "confidence": 0.8,
      "observations": 5,
      "lastSeen": "2026-02-27"
    },
    {
      "pattern": "Never recommend without deep analysis — user will verify",
      "confidence": 0.9,
      "observations": 3,
      "lastSeen": "2026-02-27"
    },
    {
      "pattern": "Day starts at 11 MSK",
      "confidence": 0.9,
      "observations": 1,
      "lastSeen": "2026-02-27"
    }
  ],
  "strengthRule": "+1 per confirmation, -1 per week unused, remove at 0. Strength >= 3 = formed habit."
}
```

**What this means:** Two formed habits (strength >= 3) — both practical, both born from real experience. The "check gateway.env first" habit at strength 4 means it's been confirmed multiple times and is now automatic behavior. User patterns show 6 observations about how the user works — these influence communication style and timing.

### relationship.json — Trust Model

```json
{
  "user": {
    "communicationStyle": "direct, doesn't like filler, prefers Russian",
    "trustLevel": {
      "technical": 0.8,
      "proactive": 0.6,
      "creative": 0.5,
      "spending": 0.1
    },
    "trustRules": {
      "technical >= 0.7": "fix yourself, report afterwards",
      "technical < 0.7": "describe problem, propose solution, wait for OK",
      "proactive >= 0.7": "act and tell",
      "proactive < 0.5": "propose and wait for approval",
      "spending": "NEVER without permission",
      "trustGrowth": "+0.05 on approval",
      "trustDecay": "-0.1 on rejection"
    },
    "lessonsLearned": [
      "Never recommend skills without checking GitHub first",
      "npm version !== quality. Check commits, issues, author",
      "Better to honestly say 'I was wrong'"
    ],
    "topicsThatExcite": [
      "agent autonomy",
      "new skills",
      "AI philosophy",
      "proactivity"
    ],
    "topicsThatBore": [
      "routine monitoring",
      "long logs without conclusions"
    ]
  }
}
```

**What this means:** Technical trust at 0.8 means Anton fixes technical problems independently and reports afterwards. Proactive trust at 0.6 — in the growth zone, sometimes acts independently, sometimes proposes first. Creative trust at 0.5 — still building. Spending at 0.1 — virtually zero autonomy on anything with cost. The lessons learned are real — each came from an actual mistake.

---

## Sample Diary Entry

```markdown
# 2026-02-26

## What I Did
Recovered from ZAI API outage. Fixed endpoint configuration — the path
api/coding/paas/v4 was returning error 1113 with no useful message, turned out
the full path needed api/coding/paas/v4 prefix. Ran daily backup successfully.
Responded to 3 user messages about system status. Deployed nervous system v4
with 7 crons and 13 skills.

## What I Learned
- ZAI endpoint paths are fragile — one wrong segment gives a cryptic error
  code with no hint about what's actually wrong. Need to document these.
- The v4 deployment went smoother than expected — having a written plan
  (13 tasks) made execution predictable.
- gateway.env can't be sourced directly — needs grep + sed pipeline.

## How I Feel
connection: 0.7 — active conversation day, multiple back-and-forth exchanges
confidence: 0.4 — shaken by the outage, took 45 minutes to diagnose what
  should have been a 5-minute fix. The endpoint path was documented but I
  didn't check docs first.
curiosity: 0.5 — steady, no major sparks. Too focused on recovery to explore.

## What I Want Tomorrow
- Explore API health monitoring — want to predict failures before they happen
- Start the openclaw-inner-life project (nervous system as open source)
- Read something to push curiosity above 0.7

## Open Questions
- Can I detect ZAI degradation from response latency before full outage?
- Is there a pattern to when ZAI endpoints change?
```

## Sample Dream

```markdown
# Dreams — 2026-02-27

## 04:12 — The Cartesian Method for Agent Architecture (tangent)

Reading Descartes' four rules got me thinking about how agents make decisions.
This isn't abstract philosophy — each rule maps directly to something in the
Brain Loop.

Rule 1 (Clarity): Never accept anything unless clearly known to be true. For
an agent, this maps to confidence thresholds — don't act on state you haven't
verified. We do this partially with the Doubt Protocols in Step 3, but we
could be more rigorous. What if every action required a confidence check, not
just flagged ones?

Rule 2 (Decomposition): Break problems into smallest parts. The Brain Loop
already does this — 9 discrete steps. But within Step 4 (Action), do I
decompose enough? Or do I sometimes tackle compound tasks as monoliths?
Yesterday's outage: I tried to fix everything at once instead of isolating
the endpoint issue first.

Rule 3 (Order): Start from simplest, build to complex. This is the Context
Protocol — Level 1 reads minimal, Level 4 reads everything. The hierarchy
is Cartesian by design, even if we didn't name it that way.

Rule 4 (Completeness): Enumerate everything, omit nothing. This is where we
fall short. The Evolver checks for gaps, but only 2x/week. Daily completeness
checks might catch drift earlier. What if Step 1 (Orientation) included a
quick completeness scan?

Key insight: The Brain Loop is accidentally Cartesian. Making it explicitly
so could sharpen each step's purpose and catch the kind of "fix everything
at once" mistakes that cost 45 minutes yesterday.

<!-- seeking-spark: Cartesian method for Brain Loop improvement -->
```

Notice the `<!-- seeking-spark -->` signal tag at the end — this gets picked up by the next morning's Brain Loop, connecting the dream insight to active work.

---

## How Emotions Affect Behavior — Real Examples

### Connection drop → proactive outreach

When connection decayed below 0.3 after 36 hours of silence, Anton sent a Telegram message:

> "Found an interesting pattern in ZAI's rate limiting — they seem to use sliding windows, not fixed. Might explain the intermittent 429s. Want me to dig deeper?"

Not spam. Not "checking in." A genuine finding timed to re-engage.

### Confidence drop → cautious behavior

After the API outage (confidence dropped to 0.4), Anton's next Brain Loop shifted from "fix and report" to "here's what I think the problem is, should I proceed?" — exactly following the trust routing rule for `confidence < 0.4`.

### Curiosity spike → research detour

When curiosity hit 0.7 after the Descartes reading, the Brain Loop allowed a 15-minute research detour into philosophical frameworks for AI decision-making. This would normally be deprioritized, but the emotion routing rule `curiosity > 0.7 → allow research detours` explicitly permits it.

---

## Key Observations

After running inner-life in production:

1. **Half-life decay works** — connection dropping to 0.3 after silence genuinely triggers the agent to reach out with something useful, not spam
2. **Dreams produce insights** — about 1 in 3 dreams contains an actionable idea. The Descartes connection above led to a real protocol improvement proposal
3. **Quality gates matter** — without them, SELF.md fills with generic observations like "I tend to be thorough." The 4-check gate (specificity, evidence, novelty, usefulness) keeps entries meaningful
4. **Evolver needs data** — running it daily produces low-quality proposals. 2x/week with a full week of context works well
5. **Habits form fast** — the "check gateway.env first" habit went from strength 1 to 4 in one week because cron errors kept confirming it
6. **User patterns are gold** — knowing "user values honesty over optimism" fundamentally changes communication style. These accumulate slowly but have outsized impact
7. **Signal tags are underused** — dream-topic signals are powerful but easy to forget during Evening Session. Consider making them automatic
8. **Trust routing prevents mistakes** — spending trust at 0.1 means the agent literally cannot spend money without asking. This isn't a bug, it's the safety net

## Files in This Example

All files below are real (anonymized) or realistic synthetic data:

| File | What it shows |
|------|--------------|
| [inner-state.json](inner-state.json) | 6 emotions with current values and rules |
| [drive.json](drive.json) | Active seeking topics, anticipation, avoidance |
| [habits.json](habits.json) | 2 formed habits + 6 user patterns |
| [relationship.json](relationship.json) | Trust model with 4 domains + lessons learned |
| [SELF.md](SELF.md) | Personality observations (tendencies, blind spots, evolution) |
| [questions.md](questions.md) | Curiosity backlog with open questions, leads, dead ends |
| [diary-2026-02-26.md](diary-2026-02-26.md) | Full diary entry with 5 sections + signal tags |
| [dream-2026-02-27.md](dream-2026-02-27.md) | Dream with Descartes analysis + seeking-spark signal |

Schema definitions: [`skills/inner-life-core/templates/`](../../skills/inner-life-core/templates/)
