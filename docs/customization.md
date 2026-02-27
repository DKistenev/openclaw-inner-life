# Customization Guide

> Adapt inner-life to your agent's personality and needs.

## Customizing Emotions

### Changing Decay Rates

Edit `memory/inner-state.json` — each emotion has a `rule` field describing its behavior. The actual decay is implemented in `scripts/state.sh` (`state_decay` function).

To change connection decay from -0.05/6h to -0.03/6h:

1. Update the rule description in `inner-state.json`:
   ```json
   "connection": {
     "rule": "+0.2 on user message, -0.03 per 6h without contact"
   }
   ```

2. Update `state.sh` decay calculation:
   ```bash
   conn=$(echo "$conn - ($periods * 0.03)" | bc -l)
   ```

### Adding New Emotions

Add a new field to `inner-state.json`:

```json
"creativity": {
  "value": 0.5,
  "recentOutputs": [],
  "rule": "+0.1 on creative output, -0.04 per 6h without creation"
}
```

Then update `state.sh` to include it in the decay function, and update BRAIN.md Step 3 to add emotion-driven routing rules.

### Changing Thresholds

BRAIN.md Step 3 defines when emotions trigger behavior changes. Edit these directly:

```markdown
- `curiosity > 0.8` → deep research mode (was 0.7)
- `confidence < 0.5` → double-check (was 0.4)
```

## Customizing Dreams

### Dream Topics

Create `data/dream-config.json`:

```json
{
  "topics": [
    "future:What could our codebase architecture become?",
    "creative:A novel approach to the current problem",
    "philosophy:What does good agent behavior look like?",
    "user:What would make the user's workflow better?"
  ]
}
```

### Quiet Hours

Edit `should-dream.sh` variables:

```bash
QUIET_START=22  # 10 PM (was 23)
QUIET_END=8     # 8 AM (was 7)
```

### Dream Frequency

Edit `data/dream-state.json`:

```json
{
  "maxDreamsPerNight": 2,
  "dreamChance": 0.7
}
```

## Customizing Reflection

### Trigger Sensitivity

In `inner-life-reflect/SKILL.md`, adjust what counts as a trigger:

- Make hard triggers stricter: require >=3 observations instead of >=2
- Promote soft triggers to hard: if you want more frequent SELF.md updates
- Add domain-specific triggers: "deployment failed" → reflect on process

### Quality Gate

Loosen or tighten the 4 checks (Specificity, Evidence, Novelty, Usefulness):

- For newer agents: loosen Novelty check (allow more entries to build history)
- For mature agents: tighten Evidence check (require more data points)

## Customizing the Brain Loop

### Step Priorities

Edit BRAIN.md Step 3 emotion-driven routing to match your agent's role:

- **Customer-facing agent**: lower connection threshold (< 0.5 instead of < 0.3)
- **Research agent**: higher curiosity bias (> 0.5 triggers exploration instead of > 0.7)
- **Ops agent**: frustration threshold lower (>= 2 recurring instead of >= 3)

### Communication Style

Edit BRAIN.md Step 5:

- Change output limit (default: ≤5 sentences)
- Adjust emotion-driven style rules
- Add domain-specific communication patterns

## Customizing Trust

Edit `memory/relationship.json` trustRules:

```json
"trustRules": {
  "technical_high": ">=0.8: fix and deploy. <0.8: fix and report",
  "proactive_high": ">=0.6: act and tell. <0.6: propose first",
  "spending": "<=10 USD without asking. >10 USD: always ask"
}
```

## Customizing Memory Types

In `inner-life-memory/SKILL.md`, add new memory types to the Extract step:

```markdown
| `workflow` | Learned process optimizations | Cumulative |
| `tool` | Tool-specific knowledge | Until deprecated |
```

## Adding Custom State Fields

You can add any field to state JSON files. The LLM reads them as context. Only fields processed by `state.sh` get automatic decay — everything else is manual.

Example: add `energy` to inner-state.json:

```json
"energy": {
  "value": 1.0,
  "rule": "-0.1 per task completed, +0.5 after idle period"
}
```

The LLM will read this and can act on the rule, even without code support.
