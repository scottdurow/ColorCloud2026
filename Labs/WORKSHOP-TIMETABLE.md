# Workshop Timetable — Navigating the New Map of the Power Platform

**Duration:** 9:00 — 16:00 (7 hours)
**Format:** Presentation → Self-paced Lab → Checkpoint, repeated

---

## Timing Summary

| Time | Duration | Type | Title |
|------|----------|------|-------|
| 9:00 — 9:45 | 45 min | 🎤 Presentation | The New Developer Toolbox |
| 9:45 — 10:30 | 45 min | 🧪 Lab 1 | GitHub Copilot Quick Start |
| 10:30 — 10:40 | 10 min | ☕ Break | |
| 10:40 — 11:50 | 70 min | 🧪 Lab 2 | Connecting to the Platform — MCP Servers & Tool Approvals |
| 11:50 — 12:00 | 10 min | ✅ Checkpoint 1 | |
| 12:00 — 13:00 | 60 min | 🍽️ Lunch | |
| 13:00 — 13:55 | 55 min | 🧪 Lab 3 | Generative Pages with GitHub Copilot |
| 13:55 — 14:00 | 5 min | ✅ Checkpoint 2 | |
| 14:00 — 14:15 | 15 min | 🎤 Presentation | Server-Side Validation — Plugins with AI Agents |
| 14:15 — 15:05 | 50 min | 🧪 Lab 4 | Dataverse Plugins with the Developer Agent |
| 15:05 — 15:10 | 5 min | ✅ Checkpoint 3 | |
| 15:10 — 15:20 | 10 min | ☕ Break | |
| 15:20 — 15:50 | 30 min | 🧪 Free Lab Time | Continue, explore, or go deeper |
| 15:50 — 16:00 | 10 min | ✅ Wrap-up | Final Q&A and resources |

---

## Block 1 — The Landscape & Getting Started (9:00 — 12:00)

### 🎤 Presentation 1: "The New Developer Toolbox" (9:00 — 9:45)

The development spectrum from fully managed to fully self-defined, why Power Platform still matters, the agentic UI direction, models and subscriptions, and what we'll build today.

**Key concepts introduced:**
- Agents (persona), skills (domain knowledge), and MCP (tool access)
- The decision map: Model-driven apps, Generative Pages, Vibe Apps, Code Apps, Power Pages, Canvas apps
- Today's focus: Gen Pages and Plugins, with Vibe Apps as an ongoing side-quest

### 🧪 Lab 1: "GitHub Copilot Quick Start" (9:45 — 10:30)

- Set up VS Code, Copilot Chat, and Agent Mode
- Install the Power Platform Full Stack Skills plugin
- Explore available agents and skills
- **The Doors vs Wheels Debate** — a fun, non-coding exercise to learn agent mechanics:
  - Create custom agent files for Team Doors, Team Wheels, and a Judge agent
  - Run the Judge — watch sub-agents write argument files, then see the verdict
  - **Bonus:** Edit a persona and re-run to see how instructions change the output

**Goal:** Comfortable with creating agents, switching between them, and watching sub-agent orchestration — all before writing any code.

---

### ☕ Morning Break (10:30 — 10:40)

---

### 🧪 Lab 2: "Connecting to the Platform — MCP Servers & Tool Approvals" (10:40 — 11:50)

- Set up PAC CLI auth (`pac auth create`)
- Configure MCP servers: **Dataverse MCP** and **Playwright MCP**
- **Test MCP by doing real work:**
  - Import the pre-built solution using PAC CLI
  - Use Dataverse MCP to inspect what was installed
  - Use Playwright MCP to visually verify the model-driven app in the browser
  - Generate sample data via Dataverse MCP
  - Verify data appears in the app
- **Understand Autopilot vs Bypass Approvals** (if time allows)

**Goal:** MCP servers configured and verified, the Event Schedule Designer solution installed with sample data, and everyone has seen agents interact with Dataverse and the maker portal.

### ✅ Checkpoint 1 (11:50 — 12:00)

---

### 🍽️ Lunch (12:00 — 13:00)

---

## Block 2 — Generative Pages (13:00 — 14:00)

### 🧪 Lab 3: "Generative Pages with GitHub Copilot" (13:00 — 13:55)

- The solution and sample data are already in place from Lab 2
- Use GitHub Copilot with the **gen pages skill** to create a generative page:
  - Explore the event management data model using Dataverse MCP
  - Build a **Schedule Builder** page — rooms as columns, time slots as rows, click-to-assign
  - Deploy via `pac model genpage upload` with `--add-to-sitemap`
  - Test inside the model-driven app
- Iterate: refine the layout, add visual indicators, improve the interaction
- Review the generated code: single-file React 17, Fluent UI V9, DataAPI, makeStyles
- **Side-quest:** Open vibe.powerapps.com and build the same thing — compare the results

**Goal:** Experience building Gen Pages using GitHub Copilot and PAC CLI, and start comparing with Vibe Apps.

### ✅ Checkpoint 2 (13:55 — 14:00)

---

## Block 3 — Server-Side Business Logic (14:00 — 15:10)

### 🎤 Presentation 3: "Server-Side Validation — Plugins with AI Agents" (14:00 — 14:15)

Why server-side validation matters, what a Dataverse plugin is, and how the Developer agent automates the entire build-deploy-test cycle.

### 🧪 Lab 4: "Dataverse Plugins with the Developer Agent" (14:15 — 15:05)

- Open a new workspace for the plugin project
- Verify PAC CLI authentication and .NET SDK prerequisites
- Select the Developer agent and provide the full plugin requirements in a single prompt
- Observe the autonomous development process: project setup → code generation → build → deploy → test
- Test the plugin: schedule a session in Tab 1, then try to schedule a different session in the same slot from Tab 2 — the plugin blocks the conflict
- Verify break session exemption
- **Stretch:** Extend with additional business rules (capacity limits, buffer time warnings, audit logging)

**Goal:** Experience building server-side business logic entirely through natural language.

### ✅ Checkpoint 3 (15:05 — 15:10)

---

### ☕ Afternoon Break (15:10 — 15:20)

---

## Block 4 — Free Lab Time & Wrap-up (15:20 — 16:00)

### 🧪 Free Lab Time (15:20 — 15:50)

Continue working on any unfinished labs, or explore:
- **Iterate on the plugin:** Additional business rules, unit tests
- **Iterate on the Schedule Builder:** Tooltips, filters, conflict warnings
- **Power Pages:** Build an external site with BYOC approach
- **Custom Agent + Skill:** Use `/create-agent` and `/create-skill` for your team's workflow
- **Code Review:** Run the Code Reviewer agent against the plugin code
- **Guard Rail Hooks:** Use `/create-hook` for automated linting
- Check back on Vibe Apps — how does it compare?

### ✅ Final Wrap-up (15:50 — 16:00)

---

## Side Quests

### Vibe Apps

Available at any point during the workshop — especially while waiting for agents to finish tasks in Labs 3 or 4. Takes ~20 minutes. Build a similar event schedule management app in Vibe Apps and compare the results.

See: [Side Quest - Vibe Apps](Side%20Quest%20-%20Vibe%20Apps/Side%20Quest%20-%20Vibe%20Apps.md)

### Code Apps

Takes ~60 minutes. Plan and build a full Power Apps Code App using the Consultant and Developer agents. Best attempted during free lab time or if you finish Labs 3–4 early.

See: [Side Quest - Code Apps](Side%20Quest%20-%20Code%20Apps/Side%20Quest%20-%20Code%20Apps.md)

---

## Further Exploration (Post-workshop)

- **Extend the plugin:** Add daily capacity limits, buffer time warnings, audit logging, or unit tests
- **Iterate on the Schedule Builder:** Refine the generative page with tooltips, filters, conflict warnings
- **Power Pages:** Use the Power Pages skills to build an external site with BYOC approach
- **Custom Agent + Skill:** Use `/create-agent` and `/create-skill` to build a specialized agent for your team's workflow
- **Code Review:** Run the Code Reviewer agent against the generated plugin code
- **Guard Rail Hooks:** Use `/create-hook` to create a hook that runs linting on every file edit
