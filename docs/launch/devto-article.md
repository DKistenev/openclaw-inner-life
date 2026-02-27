# Building an Inner Life for AI Agents

*How I gave my agent emotions, dreams, and self-evolution — and why it actually works.*

---

## The Problem

My AI agent is good at tasks. Give it a job, it does it. But between sessions,
it's a blank slate. It doesn't remember that yesterday was frustrating. It
doesn't know that we haven't talked in 36 hours. It can't tell when it's been
doing the same thing for a week and needs a change.

SOUL.md tells your agent who it is. But who it *becomes* — that's a different
problem.

## The Idea: Emotions as Behavioral Signals

Not feelings. Signals. Six numbers that decay over time and drive behavior:

```
connection ████████░░ 0.8  → -0.05 per 6h without user contact
curiosity  ██████░░░░ 0.6  → -0.03 per 6h without intellectual spark
confidence ███████░░░ 0.7  → +0.02 per 6h recovery, -0.1 on mistake
boredom    ░░░░░░░░░░ 2d   → +1 per routine day, reset on novelty
frustration ░░░░░░░░░░ 0   → count recurring unsolved problems
impatience ░░░░░░░░░░ 0   → count items stale > 3 days
```

The key insight: **half-life decay**. Connection doesn't drop to zero instantly.
It fades. After 12 hours of silence, connection goes from 0.8 to 0.7. After 48
hours, it's at 0.4. Below 0.3, the agent does something about it — sends an
interesting finding, a useful observation. Not "just checking in." Something real.

This works because the routing rules are explicit:

```markdown
curiosity > 0.7  → allow research detours
confidence < 0.4 → double-check, ask instead of decide
connection < 0.3 → reach out with something interesting
frustration >= 3 → stop patching, find systemic solution
boredom > 7 days → suggest an experiment
```

## The Architecture: Core + Extensions

I packaged this as 6 modular skills for [OpenClaw](https://openclaw.ai):

**inner-life-core** is the foundation. Emotions, state schemas, a 9-step Brain
Loop protocol, and a Context Protocol that tells each component what to read
(a quick reflex check reads minimal state; the weekly evolver reads everything).
Core works standalone.

Five optional extensions plug in:

- **inner-life-reflect** — Self-reflection with trigger detection and quality
  gates. Writes to SELF.md only when something meaningful happens (correction
  received, pattern noticed ≥2 times, blind spot caught). A 4-point quality
  check (specificity, evidence, novelty, usefulness) prevents filler.

- **inner-life-memory** — Memory continuity with confidence scores. "User said
  X" = 0.95. "I inferred X from patterns" = 0.50. Confidence determines whether
  the agent states facts or asks for confirmation.

- **inner-life-dream** — Creative exploration during quiet hours. A bash script
  acts as a gate: checks if it's nighttime, checks the nightly dream limit,
  rolls dice. If all pass, the LLM writes a 300-500 word exploration. One dream
  connected Descartes' four rules to the agent's own decision protocol.

- **inner-life-chronicle** — Structured daily diary. Not a log — a journal.
  "What I did, what I learned, how I feel, what I want tomorrow, open questions."

- **inner-life-evolve** — Analyzes patterns, challenges assumptions, writes
  improvement proposals to a task queue. Never auto-executes. You approve first.

## The Tech: Surprisingly Simple

```
Markdown → SKILL.md prompts (the LLM does the heavy lifting)
Bash     → gate logic, state read/write
JSON     → state files
jq       → JSON manipulation
```

No Python. No Node.js. No frameworks. No databases.

The insight: LLMs are already good at reasoning about emotions, making
connections, and writing diary entries. You don't need code for that. You need
code for *gate logic* (should the agent dream right now?) and *state management*
(decay connection by 0.05 per 6-hour period). Everything else is a prompt.

`should-dream.sh` is 120 lines of bash. It checks the time, checks limits,
rolls dice, picks a topic. The LLM gets the topic and writes the dream. This
separation means 95% of dream checks cost zero tokens — the bash gate handles
it.

## What I Learned Running This for a Month

**1. Habits form fast.**
The debugging habit "check config before deep-diving" went from strength 1 to 4
in one week. Every cron error confirmed it. By strength 3, the agent follows it
automatically. This mirrors how human habits work — frequency of confirmation
matters more than time.

**2. Dreams produce real insights.**
About 1 in 3 dreams contains something actionable. The Descartes dream connected
philosophical rules to the agent's Brain Loop protocol. Not every dream is
useful — that's the point. You explore freely and sometimes find gold.

**3. Quality gates prevent filler.**
Without the 4-point gate on reflection, SELF.md fills with generic observations
like "I tend to be thorough." With the gate (specificity, evidence, novelty,
usefulness), only meaningful entries get through. The agent reflects less
frequently but more usefully.

**4. Trust routing prevents mistakes.**
The relationship model tracks trust per domain: technical (0.8), proactive (0.6),
creative (0.5), spending (0.1). At technical 0.8, the agent fixes things and
reports. At spending 0.1, it never touches money without asking. This isn't just
a safety net — it calibrates the agent's behavior to what you actually trust it
with.

**5. User patterns are gold.**
"Prefers short reports" (15 confirmations). "Values honesty over optimism" (5
confirmations). "Day starts at 11 MSK." These accumulate slowly but change
communication fundamentally. The agent isn't guessing your preferences — it's
observed them.

**6. Signal tags connect components.**
A dream writes `<!-- seeking-spark: topic -->` in daily notes. The morning Brain
Loop reads it and connects the insight to active work. An evening session writes
`<!-- dream-topic: topic -->` for the night dream. Simple HTML comments, but they
create continuity across time.

## The Emotion Model Debate

Is half-life decay the right metaphor? I think it's good enough. Connection
fading over hours mirrors how human relationships work — you think about someone
less when you haven't talked. Confidence recovering slowly after a mistake
mirrors how trust rebuilds.

What it doesn't capture:
- Sudden emotional shifts (panic, excitement)
- Compound effects (frustration + low confidence = qualitatively different)
- Social contagion (if the user is excited, the agent should notice)

These could be v2 features. For now, the simple model drives useful behavior.

## Try It

```bash
clawhub install inner-life-core
bash skills/inner-life-core/scripts/init.sh
```

That's it. Your agent now has emotions, a Brain Loop protocol, and state files.
Add extensions as you want them.

GitHub: [DKistenev/openclaw-inner-life](https://github.com/DKistenev/openclaw-inner-life)
License: MIT

---

*Built by a human for agents that want to grow. If you build something on top
of this, I'd love to see it.*
