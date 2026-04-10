# Workshop Timetable — Navigating the New Map of the Power Platform

**Duration:** 10:00 — 17:00 (7 hours)
**Format:** Presentation → Self-paced Lab → Checkpoint, repeated
**Theme:** From understanding the tools, to directing them, to knowing when to step in

---

## Block 1 — The Landscape & Getting Started (10:00 — 12:30)

### Presentation 1: "The New Developer Toolbox" (10:00 — 10:45, 45 min)

**Objectives:**
- Introduce the development spectrum: from fully managed (platform defines the system prompt, skills, and libraries) to fully self-defined (you control all of it, right through to not running on Power Platform at all)
- Separate "vibe coding" as a way of working from the spectrum — it's not a position on the scale
- Explain why Power Platform still matters: authentication, managed secrets, connectors with OAuth, solution deployment, environment-level governance — the platform handles the hard security bits
- **The agentic UI direction** — briefly cover what's coming on the platform side: model-driven apps can now expose MCP servers, so your Power App surfaces forms and views directly inside M365 Copilot chat. Users can fill out forms by uploading documents, interact with app data conversationally, and trigger actions — all without leaving Copilot. Plus the agent feed in model-driven apps (Copilot Studio agents running alongside traditional app building), form fill agents for conversational data entry, and visualization agents that generate charts and insights on demand. This is the "apps as capabilities" direction where apps show up wherever work happens, not just as destinations you navigate to
- **Contrast with Code Apps:** Code Apps don't have these agentic UI integrations yet. Model-driven apps remain a very powerful environment precisely because of native M365 Copilot integration, agent feed, form fill MCP, embedded Copilot chat. Code Apps give you full control over the UI and code, but you trade off these platform-native capabilities. Knowing when to use which is a key architectural decision
- **This workshop's focus:** We're not building agentic UIs today — we're getting comfortable using AI to *build* solutions. The tools and techniques you learn here (agents, skills, MCP, multi-agent workflows) apply regardless of which app type you're targeting
- **Where does Copilot Studio fit?** — Copilot Studio is for building agents that end-users interact with: conversational bots, business process agents, the agent feed in model-driven apps. That's a separate discipline from what we're doing today (using AI agents as developer tools). If you want to go deep on Copilot Studio agent building, check out **Agent Academy** — it's the dedicated learning path for that. Today we're on the other side: using agents to *build* the apps that those Copilot Studio agents will eventually plug into
- **Models and subscriptions** (deserves a slide — brief comparison):
  - The model landscape: Opus 4.6 for complex planning and reasoning, Sonnet for fast iteration, GPT-4.1 for general tasks, o4-mini for quick completions — different models suit different tasks. Show the model picker in VS Code
  - **Auto mode** — lets VS Code pick the best model for the task automatically, with a 10% discount on model usage. Good default for most work; switch to a specific model when you need predictable behaviour for a particular task
  - Subscription tiers: Free tier (limited completions), Copilot Pro (individual), Copilot Business/Enterprise (org-managed). What matters for this workshop: you need a plan that supports Agent Mode and premium model access
- Set the collaborative mindset: this is not fire-and-forget prompting. We work alongside agents iteratively, sometimes in parallel, using multiple specialist agents
- High-level introduction: what are agents (persona), skills (domain knowledge), and MCP (tool access)
- **The decision map** — what you can build with these tools. Walk through each option briefly:
  - **Model-driven apps** — data-centric, platform-managed UX, native M365 Copilot integration
  - **Generative Pages** — custom pages inside model-driven apps, built via GitHub Copilot + PAC CLI
  - **Vibe Apps** — fastest path from idea to working app at vibe.powerapps.com
  - **Code Apps** — full TypeScript/React on Power Platform, maximum control
  - **Power Pages** — external-facing websites with BYOC approach
  - **Canvas apps** — low-code, Power Fx, still very much alive
- **The key insight:** These aren't competing options — they're different tools for different jobs. Pick based on the requirement, not the hype
- **Today's focus:** Gen Pages and Plugins. Vibe Apps runs as a side-quest throughout
- Overview of the day — what we'll build and the progression
- Demo: open a workspace, show agent mode, show an agent file and a skill file (note the signposting pattern), show a quick agent interaction

### Lab 1: "GitHub Copilot Quick Start" (10:45 — 11:30, 45 min)

**Objectives:**
- Set up the working environment: VS Code, Copilot Chat, Agent Mode
- Install the Power Platform Full Stack Skills plugin:
  - Open the **GitHub Copilot Extensions marketplace** in VS Code (Copilot Chat → Extensions icon) — browse what's available. This is the ecosystem of community and Microsoft-published agent/skill packages
  - Find and install the **Power Platform Full Stack Skills** plugin from [Awesome Copilot](https://github.com/anthropics/awesome-copilot) — the community directory for discovering Copilot extensions
  - Show how to **add custom repos** as skill sources — any GitHub repo containing `.agent.md`, `SKILL.md`, or `.instructions.md` files can be added as a Copilot extension. This is how teams share their own agents and skills internally
- Explore available agents and skills — read an agent file, read a skill file to see the structure
- **The Doors vs Wheels Debate** — a fun, non-coding exercise to learn agent mechanics:
  1. Create two custom agent files in the workspace: `team-doors.agent.md` (passionate advocate for doors — counts every cupboard, fridge, oven, and car door) and `team-wheels.agent.md` (passionate advocate for wheels — counts every shopping cart, office chair, suitcase, and toy car). Each agent must be instructed to **write its argument to a file** (e.g. `arguments/team-doors-argument.md`, `arguments/team-wheels-argument.md`) — this is how we see the IDE in action: files appearing, diffs showing, the workspace changing in real time
  2. Give each agent a distinct persona: one is a meticulous researcher who cites evidence, the other is an impassioned debater who uses rhetoric and analogies
  3. Instruct the debater agents to **ask the user a question** before writing their argument — e.g. "What room are you sitting in right now? I'll count the doors/wheels in it to prove my point." This demonstrates agent-to-human questioning
  4. Create a third agent: `judge.agent.md` — the orchestrator. The Judge is instructed to: (a) call Team Doors as a sub-agent and wait for its argument file, (b) call Team Wheels as a sub-agent and wait for its argument file, (c) read both argument files, (d) write a structured verdict to `arguments/verdict.md` with reasoning, scoring, and a winner
  5. Run the Judge agent — watch it invoke the two child agents in sequence, see the argument files appear in the IDE as each sub-agent writes, then see the Judge read both files and write the final verdict
  6. Open the three files side by side: Team Doors argument, Team Wheels argument, and the Judge's verdict
  7. **Bonus:** Edit one of the agent personas (e.g. make Team Wheels more aggressive) and re-run the Judge — see how the changed instructions produce a different argument and potentially a different verdict
- **What this demonstrates:** Agent creation, sub-agent handoffs (parent calling children), persona-driven output, agents writing to the file system, agent-to-human questioning, reading diffs in the IDE, and the orchestrator pattern
- **Goal:** Comfortable with creating agents, switching between them, watching sub-agent orchestration, and seeing files appear and change in the IDE — all before writing any code

---

## ☕ Morning Break (11:30 — 11:40)

---

### Lab 2: "Connecting to the Platform — MCP Servers & Tool Approvals" (11:40 — 12:25, 45 min)

**Objectives:**
- Set up PAC CLI auth to the Gen Pages dev environment (`pac auth create`)
- Set up MCP servers:
  - **Dataverse MCP server** — configure in `.vscode/mcp.json` with the environment URL from PAC CLI auth. Agents can now query and manipulate Dataverse data directly
  - **Playwright MCP server** — agents can open browsers, navigate to URLs, click elements, and read page content on your behalf
  - Verify both are connected and showing in the MCP server list
- **Test MCP by doing real work — install the Gen Pages solution:**
  - The twist: we're not testing MCP with throwaway queries. The "test" IS the setup for Block 2. By the time we've verified both MCP servers work, we'll have the model-driven app installed and populated with sample data
  - Switch to **Bypass Approvals** mode. Ask the agent to import the pre-built solution from the Dist folder using PAC CLI, then use Dataverse MCP to inspect what was installed — list the tables, custom columns, and the model-driven app name. Watch the MCP tool calls stream through auto-approved
  - **Playwright MCP — visually verify the install:** Ask the agent to open make.powerapps.com, find the model-driven app, open it, and confirm the site map is correct. The agent launches a browser, navigates, clicks, reads the page — and reports back. The audience sees the empty app, waiting for data
  - **Generate sample data via Dataverse MCP:** Ask the agent to create realistic sample data (events, rooms, sessions, schedule slots) across the tables. Watch rapid-fire MCP tool calls creating interconnected records. The agent builds 50+ records in about 30 seconds — try that by hand in the maker portal
  - **Verify with Playwright:** Ask the agent to re-open the model-driven app and confirm data appears in the grids. Navigate through views, open a record, check related data. Visual proof that everything is ready
  - Key takeaway: MCP servers give agents real-world tool access. The testing IS productive work — by verifying the tools, we set up the entire Gen Pages lab environment
- **Understand Autopilot vs Bypass Approvals** (if time allows):
  - Ask the agent (in Autopilot mode) to add 3 more sessions and decide which rooms they should be scheduled in based on their topics. No questions asked — full autonomy
  - Compare: in Bypass Approvals mode, the agent would ask "Which room should this session be scheduled in?" Same tools, different trust level
  - Key takeaway: Bypass Approvals = tools run without clicking approve, but questions still come to you. Autopilot = the agent decides everything
- **Goal:** MCP servers configured and verified, the Event Schedule Designer solution is installed with realistic sample data, Autopilot vs Bypass Approvals is clear, and everyone has seen agents interact with Dataverse and the maker portal — the foundation for everything that follows

### Checkpoint 1 (12:25 — 12:30, 5 min)

**Question to the room:** "Who won — doors or wheels?"
- Quick responses from 2–3 people, hard timebox

**Quick-fire round** (hands up, no discussion):
1. "What's the difference between an agent and a skill?" → Agent = persona (how it approaches problems), Skill = domain knowledge (what it knows how to do)
2. "What's the difference between Autopilot and Bypass Approvals?" → Bypass Approvals = tools run without clicking approve, but agent still asks you questions. Autopilot = agent answers its own questions too — full autonomy
3. "What does an MCP server give an agent that it doesn't have by default?" → Real-world tool access — Dataverse data, browser control, external APIs. Without MCP, the agent can only read/write files and run terminal commands

- Key point: The agent's output is shaped by its instructions *and* by who's answering the questions. That's true for debates, and it's true for building apps.

---

## 🍽️ Lunch (12:30 — 13:15)

---

## Block 2 — Generative Pages (13:15 — 14:20)

### Lab 3: "Generative Pages with GitHub Copilot" (13:15 — 14:15, 60 min)

**Environment:** Gen Pages dev environment

**Objectives:**
- The solution and sample data are already in place from Lab 2 — no setup needed, straight into building
- Use GitHub Copilot in VS Code with the **gen pages skill** to create a generative page:
  - Open a new workspace for the gen page project
  - Explore the event management data model (Event, Session, Room, Schedule Slot) using the Dataverse MCP
  - Prompt the agent to build a **Schedule Builder** page — a grid layout with rooms as columns and time slots as rows, unscheduled sessions in a sidebar, click-to-assign interaction
  - Watch the skill generate `RuntimeTypes.ts` from Dataverse metadata, then generate the `.tsx` code using verified column names
  - Deploy the page via `pac model genpage upload` with `--add-to-sitemap`
  - Test the deployed page inside the model-driven app
- Iterate: refine the layout, add visual indicators, improve the scheduling interaction — each iteration is describe → generate → deploy → verify
- Review the generated code: single-file React 17, Fluent UI V9, DataAPI, makeStyles with tokens
- **Side-quest (ongoing throughout the workshop):** Open vibe.powerapps.com in a separate browser tab. Enter a similar prompt ("build a conference schedule builder"). Compare what the managed environment produces vs what you built with full control
- **Goal:** Experience building Gen Pages using GitHub Copilot and PAC CLI — the external-tooling approach (GA worldwide) — and start the running comparison with Vibe Apps

### Checkpoint 2 (14:15 — 14:20, 5 min)

**Question to the room:** "How did the Copilot-built Gen Page compare to what Vibe Apps produced from the same prompt?"
- Quick responses from 2-3 people

**Quick-fire round** (hands up, no discussion):
1. "Where do Gen Pages sit on the spectrum — managed or self-defined?" → Trick question. Via Plan Designer they're managed. Via GitHub Copilot + PAC CLI they're self-defined. Same output, different level of control
2. "Why did we use the Dataverse MCP to set up the entire lab environment in Lab 2 instead of importing and entering data manually?" → Because the agent can install solutions, verify them visually, and create realistic bulk data in minutes — and you learned how MCP works by doing productive work, not throwaway exercises
3. "If you wanted to change how the Gen Page handles errors, which approach gives you that control — Plan Designer or Copilot?" → Copilot. You own the code. Plan Designer gives you what the platform decides

- Key point: More control means more power but more effort. The managed side gives you speed; external tools give you precision. Knowing when to use which is the skill

---

## Block 3 — Server-Side Business Logic (14:20 — 15:40)

### Presentation 3: "Server-Side Validation — Plugins with AI Agents" (14:20 — 14:35, 15 min)

**Objectives:**
- Why server-side validation matters: client-side rules can be bypassed by APIs, integrations, and bulk imports
- What a Dataverse plugin is: code that Dataverse runs automatically when records are created, updated, or deleted — a guardrail that can't be bypassed
- The Developer agent: how it reads skills, scaffolds projects, writes C#, creates deployment scripts, and fixes its own build errors
- Plugin deployment flow: assembly → plugin type → processing steps, all automated via scripts
- The "two browser tabs" test: proving that server-side validation catches conflicts that no client-side check could
- Demo: show the Developer agent creating a plugin project, building it, and deploying it

### Lab 4: "Dataverse Plugins with the Developer Agent" (14:35 — 15:35, 60 min)

**Environment:** Same environment as Labs 2–3

**Objectives:**
- Open a new workspace for the plugin project
- Verify PAC CLI authentication and .NET SDK prerequisites
- Select the Developer agent and provide the full plugin requirements in a single prompt
- Observe the autonomous development process: project setup → code generation → build → deployment script → test script → deploy → test
- Review the generated code, deployment script, and test script — understand the structure without needing to read C#
- Test the plugin manually using two browser tabs of the Schedule Builder (Lab 3): schedule a session in Tab 1, then try to schedule a different session in the same slot from Tab 2 — the plugin blocks the conflict
- Verify break session exemption
- **Stretch:** Extend the plugin with additional business rules (daily capacity limits, buffer time warnings, audit logging)
- **Goal:** Experience building server-side business logic entirely through natural language, and see that the plugin catches conflicts that no UI validation could prevent

### Checkpoint 3 (15:35 — 15:40, 5 min)

**Question to the room:** "What happened when you tried to schedule two sessions in the same slot from different browser tabs?"
- Quick responses from 2-3 people

**Quick-fire round** (hands up, no discussion):
1. "Why couldn't a form-level validation rule prevent this conflict?" → Because Tab 2 didn't know Tab 1 had already filled that slot. Only the server sees the current state at the moment of save
2. "The agent wrote C# code, deployment scripts, and test scripts. Did you need to understand C# to get this done?" → No. You described the business rule in plain English. You could review the structure without reading every line
3. "The agent's build failed once and it fixed itself. Is that a problem?" → No. That's normal — it's how the agent works. It reads errors, diagnoses, fixes, and retries. Same as a developer would, but faster

- Key point: Server-side validation is essential for rules that must always be enforced. The agent handles the technical implementation — you focus on describing what the rule should do

---

## ☕ Afternoon Break (15:40 — 15:55)

---

## Block 4 — Free Lab Time & Wrap-up (15:55 — 17:00)

### Free Lab Time (15:55 — 16:50, 55 min)

**Objectives:**
- Continue working on any unfinished labs
- Or explore any of the further exploration projects:
  - **Iterate on the plugin:** Extend the plugin with additional business rules (daily capacity limits, buffer time warnings, audit logging, unit tests)
  - **Iterate on the Schedule Builder:** Refine the generative page with additional features (tooltips, filters, conflict warnings)
  - **Power Pages:** Use the Power Pages skills to build an external site with BYOC approach
  - **Custom Agent + Skill:** Use `/create-agent` and `/create-skill` to build a specialized agent for your team's workflow
  - **Code Review:** Run the Code Reviewer agent against the generated plugin code
  - **Guard Rail Hooks:** Use `/create-hook` to create a hook that runs linting on every file edit
- Check back on Vibe Apps — how does it compare to what you built today?
- **Goal:** Use this time however it's most valuable to you — catch up, go deeper, or explore something new

### Final Wrap-up (16:50 — 17:00, 10 min)

**Objectives:**
- Key takeaway: The tools are powerful, but *you* decide what to build and why
- Share resources: repo link, skill plugin link, community links
- Point to the Further Exploration appendix: curated projects they can try in their own time (Power Pages with BYOC skills, building custom agents/skills, running usability studies, Copilot CLI comparison)
- Final question to the room: "What surprised you today?"

---

## Timing Summary

| Time | Duration | Type | Title |
|------|----------|------|-------|
| 10:00 — 10:45 | 45 min | 🎤 Presentation | The New Developer Toolbox |
| 10:45 — 11:30 | 45 min | 🧪 Lab 1 | GitHub Copilot Quick Start |
| 11:30 — 11:40 | 10 min | ☕ Break | |
| 11:40 — 12:25 | 45 min | 🧪 Lab 2 | Connecting to the Platform — MCP Servers & Tool Approvals |
| 12:25 — 12:30 | 5 min | ✅ Checkpoint | |
| 12:30 — 13:15 | 45 min | 🍽️ Lunch | |
| 13:15 — 14:15 | 60 min | 🧪 Lab 3 | Generative Pages with GitHub Copilot |
| 14:15 — 14:20 | 5 min | ✅ Checkpoint | |
| 14:20 — 14:35 | 15 min | 🎤 Presentation | Server-Side Validation — Plugins with AI Agents |
| 14:35 — 15:35 | 60 min | 🧪 Lab 4 | Dataverse Plugins with the Developer Agent |
| 15:35 — 15:40 | 5 min | ✅ Checkpoint | |
| 15:40 — 15:55 | 15 min | ☕ Break | |
| 15:55 — 16:50 | 55 min | 🧪 Free Lab Time | Continue, explore, or go deeper |
| 16:50 — 17:00 | 10 min | ✅ Wrap-up | Final Q&A and resources |

**Totals:**
- Presentations: 60 min (2 sessions)
- Labs: 265 min (4 labs + free lab time)
- Checkpoints: 25 min (3 checkpoints + wrap-up)
- Breaks: 70 min (1 coffee + lunch + 1 coffee)

## Environment Map

| Environment | Used in | Auth method |
|---|---|---|
| Default developer environment | Labs 2–4 (Connecting, Gen Pages, Plugins) | PAC CLI |
| Dev 2 | Vibe Apps side quest | Browser (vibe.powerapps.com) |
| Dev 3 (optional) | Code Apps side quest | PAC CLI |

## Side Quest: Vibe Apps

The **Side Quest: Vibe Apps** lab is available at any point during the workshop — especially while waiting for agents to finish tasks in Labs 3 or 4. It takes ~20 minutes and gives you a direct comparison between building with GitHub Copilot (full control) and building with Vibe Apps (managed, conversational). You'll build a similar event schedule management app in Vibe Apps and compare the results.

See: [Side Quest - Vibe Apps](Side%20Quest%20-%20Vibe%20Apps/Side%20Quest%20-%20Vibe%20Apps.md)

## Side Quest: Code Apps

The **Side Quest: Code Apps** lab takes ~60 minutes and walks through planning and building a full Power Apps Code App using the Consultant and Developer agents. This is the fully self-defined end of the spectrum — multi-agent planning, scaffolded React project, Fluent UI, service layer, and Dataverse integration. Best attempted during free lab time or if you finish Labs 3–4 early.

See: [Side Quest - Code Apps](Side%20Quest%20-%20Code%20Apps/Side%20Quest%20-%20Code%20Apps.md)

---

## Further Exploration (Reference list for free lab time and post-workshop)

Curated projects using the skills and techniques from the workshop:
- **Extend the plugin:** Add daily capacity limits, buffer time warnings, audit logging, or unit tests
- **Iterate on the Schedule Builder:** Refine the generative page with tooltips, filters, conflict warnings
- **Power Pages:** Use the Power Pages skills to build an external site with BYOC approach
- **Custom Agent + Skill:** Use `/create-agent` and `/create-skill` to build a specialized agent for your team's workflow
- **Code Review:** Run the Code Reviewer agent against the generated plugin code
- **Guard Rail Hooks:** Use `/create-hook` to create a hook that runs linting on every file edit
