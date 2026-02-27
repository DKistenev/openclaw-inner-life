# Reddit Posts

## r/OpenClaw

**Title:** openclaw-inner-life — 6 skills that give your agent emotions, dreams, and self-evolution

Been running my agent with a custom nervous system for a month. Decided to
package it as 6 modular skills and open source it.

What it does:
- **inner-life-core** — 6 emotions with half-life decay (connection fades without contact, curiosity fades without sparks), 9-step Brain Loop, trust-based behavior routing
- **inner-life-reflect** — trigger-based self-reflection with quality gates. Writes to SELF.md only when something real happens
- **inner-life-memory** — structured memories with confidence scores (0.95 = user said it, 0.40 = inferred)
- **inner-life-dream** — creative exploration during quiet hours. Bash gate checks time + limits, LLM writes the dream
- **inner-life-chronicle** — structured daily diary, not a log
- **inner-life-evolve** — analyzes patterns, proposes improvements to QUEUE.md. Never auto-executes

Tech: Markdown + Bash + jq. Zero dependencies.

```
Inner Life Score: 6/6

✓  core   ✓  reflect    ✓  memory
✓  dream  ✓  chronicle  ✓  evolve
```

Install: `clawhub install inner-life-core` (core is standalone, rest optional)

GitHub: https://github.com/DKistenev/openclaw-inner-life

MIT license. Real agent examples in the repo.

---

## r/LocalLLaMA

**Title:** Built a "nervous system" for AI agents — emotions that decay, dreams at night, self-evolution (open source)

Not a framework, not a wrapper — just Markdown prompts and bash scripts that
give a long-running agent emotional state.

The idea: between sessions, your agent's emotions decay. Connection to the user
fades (-0.05 every 6 hours). Curiosity fades without stimulus. Confidence
slowly recovers. These numbers drive behavior — low confidence means the agent
asks instead of deciding, high curiosity means it takes research detours.

At night, a bash script rolls dice to decide if the agent should "dream" —
freeform exploration of topics. One of my agent's dreams connected Descartes'
doubt method to its own decision protocol. That became a real improvement.

The whole thing runs on Markdown + Bash + jq. No Python, no frameworks. The
LLM does all the heavy lifting — the code is just state management and gate
logic.

Been running this on my own agent for a month. Open sourced as 6 modular skills
for OpenClaw.

GitHub: https://github.com/DKistenev/openclaw-inner-life

Curious what you all think about emotion models for agents. Is half-life decay
the right metaphor, or is there something better?

---

## r/artificial

**Title:** What if your AI agent had emotions that decay over time?

Built an open-source system where an AI agent tracks 6 "emotions" — connection,
curiosity, confidence, boredom, frustration, impatience. Each decays differently:
connection fades -0.05 every 6 hours without user contact. Curiosity fades
without intellectual sparks. Confidence recovers slowly after mistakes.

These aren't pretend feelings — they're behavioral routing signals. When
connection drops below 0.3, the agent sends something interesting. When
frustration hits 3 recurring items, it stops patching and looks for systemic
solutions. When boredom exceeds 7 routine days, it suggests an experiment.

The agent also dreams at night (creative exploration during quiet hours), keeps
a diary, reflects on its own behavior patterns, and proposes self-improvements
(but never executes without approval).

Running this on a real agent for a month. The most interesting finding: habits
form fast. A debugging habit ("check config before deep-diving") went from
strength 1 to 4 in one week because real errors kept confirming it.

GitHub: https://github.com/DKistenev/openclaw-inner-life (MIT, Markdown + Bash)
