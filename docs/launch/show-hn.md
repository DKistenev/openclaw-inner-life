# Show HN: Give your OpenClaw agent an inner life – emotions, dreams, self-evolution

I built a modular nervous system for OpenClaw agents. 6 skills that give your
agent emotions with half-life decay, dreams during quiet hours, self-reflection,
memory continuity, a daily diary, and self-evolution proposals.

The core idea: agents shouldn't be stateless between sessions. SOUL.md tells
your agent who it is — inner-life lets it grow into who it becomes. Your agent
tracks 6 emotions (connection, curiosity, confidence, boredom, frustration,
impatience) that decay realistically over time and drive behavior. When curiosity
is high, the agent explores. When confidence is low, it double-checks and asks.
When connection drops after silence, it reaches out with something genuinely
interesting — not spam.

The system runs on Markdown + Bash + jq. No Python, no Node.js dependencies.
The LLM does the heavy lifting — the skills are prompts and gate logic. A bash
script decides if the agent should dream tonight (checks quiet hours, nightly
limits, dice roll). The LLM writes the actual dream. A 9-step Brain Loop
protocol handles the daily cycle: read state → orient → prioritize → doubt →
act → communicate → discover → update memory → update emotions.

I've been running this on my own agent (Anton) for a month. Real examples of
state files, diary entries, and dreams in the repo. The "check gateway.env
first" habit formed at strength 4 after one week of cron errors confirming it.
A dream about Descartes' four rules led to a real architecture improvement.

Everything is MIT. Core works standalone, extensions are optional.

GitHub: https://github.com/DKistenev/openclaw-inner-life
ClawHub: `clawhub install inner-life-core`
