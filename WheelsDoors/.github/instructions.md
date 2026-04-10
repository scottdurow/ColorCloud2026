# The Great Wheels vs Doors Debate

## What Is This?

A multi-agent AI debate that settles the internet's most important question: **Are there more wheels or doors in the world?**

Three custom agents argue it out in a structured debate format, each with a distinct personality:

| Agent | Character | Personality |
|-------|-----------|-------------|
| **Debate Moderator** | The Moderator | Dry, wry, desperately trying to stay neutral. Treats this like a presidential debate while fully aware it's absurd. |
| **Team Wheels** | Professor Reginald T. Axelrod III | Self-appointed Cambridge academic. Insufferably polite. Speaks in footnotes. References his own unpublished monographs. |
| **Team Doors** | Big Dave from Swindon | Plumber. Three pints in. Has been stewing on this since a pub argument in 2019. Gets emotional about Advent calendars. |

## How to Run the Debate

1. Open GitHub Copilot Chat in VS Code
2. Switch to the **Debate Moderator** agent (click the agent picker or type `@Debate Moderator`)
3. Send this prompt:

> **Start the debate.**

That's it. The moderator handles everything — introductions, calling each side, commentary between rounds, the verdict, and writing the transcript.

## What Happens

The moderator runs a structured debate in 4 rounds:

1. **Opening Statement** — Dramatic scene-setting, introductions of both characters
2. **Round 1: Opening Arguments** — Each side presents their strongest case
3. **Round 2: Rebuttals** — Each side dismantles the other's argument
4. **The Verdict** — The moderator picks a winner (no cop-outs allowed)

The full transcript is saved to `debate-transcript.md` in the workspace root.

## Project Structure

```
.github/
  agents/
    debate-moderator.agent.md   — Orchestrates the debate, calls both sides
    team-wheels.agent.md        — Professor Axelrod's personality & voice
    team-doors.agent.md         — Big Dave's personality & voice
  skills/
    debate-research/
      SKILL.md                  — Shared research database (stats, arguments, wild cards)
  instructions.md               — You are here
debate-transcript.md            — Output: the full debate transcript
```

## How It Works

- **Agent files** define personality and voice — how each character speaks
- **The skill file** provides the factual ammunition — stats, arguments, strategies
- Both debaters read the shared skill before arguing, then deliver the content in their own voice
- The moderator calls each agent via `runSubagent` so the arguments are genuinely independent

## Tips

- Run it multiple times — you'll get different arguments, different winners, and different levels of Big Dave getting emotional
- The moderator is instructed to pick a side so the verdict is never a fence-sitting non-answer
- The contrast between Professor Axelrod's academic pomposity and Big Dave's pub energy is the whole joke
