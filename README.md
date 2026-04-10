# ColorCloud Workshop

**Navigating the New Map of Power Platform Development**

Welcome! This is a hands-on, full-day workshop exploring how AI agents, GitHub Copilot, and MCP servers are changing the way we build solutions on Microsoft Power Platform.

There is no longer a single path to building applications. Modern development lets you start from prompts, generated experiences, developer tools, or traditional code — and still arrive at well-structured, governed solutions. The skill is not choosing one path. The skill is knowing how to navigate between them.

## What You'll Learn

- How to create, customize, and orchestrate **AI agents** in VS Code
- How **MCP servers** give agents real-world tool access (Dataverse, browser, APIs)
- How to build **Generative Pages** inside model-driven apps using GitHub Copilot and PAC CLI
- How to create **Dataverse Plugins** (server-side business logic) entirely through natural language
- How **Vibe Apps** and **Code Apps** compare to the Copilot-driven approach

## Who This Is For

Power Platform developers, low-code makers, professional developers exploring Power Platform, solution architects, and technical leads. Basic familiarity with Power Platform concepts is helpful but not required.

## Before You Arrive

Complete the **[Prerequisites](Labs/Lab%20Prerequisites.md)** before the workshop. You'll set up your GitHub account, Copilot subscription, Microsoft 365 tenant, VS Code, and PAC CLI — everything you need to hit the ground running.

## Schedule

| Time | Duration | What |
|------|----------|------|
| 10:00 – 10:45 | 45 min | Presentation: The New Developer Toolbox |
| 10:45 – 11:30 | 45 min | **Lab 1:** GitHub Copilot Quick Start |
| 11:30 – 11:40 | 10 min | Break |
| 11:40 – 12:25 | 45 min | **Lab 2:** Connecting to the Platform |
| 12:25 – 12:30 | 5 min | Checkpoint |
| 12:30 – 13:15 | 45 min | Lunch |
| 13:15 – 14:15 | 60 min | **Lab 3:** Generative Pages |
| 14:15 – 14:20 | 5 min | Checkpoint |
| 14:20 – 14:35 | 15 min | Presentation: Server-Side Validation |
| 14:35 – 15:35 | 60 min | **Lab 4:** Dataverse Plugins |
| 15:35 – 15:40 | 5 min | Checkpoint |
| 15:40 – 15:55 | 15 min | Break |
| 15:55 – 16:50 | 55 min | Free Lab Time |
| 16:50 – 17:00 | 10 min | Wrap-up |

See the **[Full Workshop Timetable](Labs/WORKSHOP-TIMETABLE.md)** for detailed presentation outlines and checkpoint questions.

## Labs

### Core Labs

| # | Lab | Duration | Description |
|---|-----|----------|-------------|
| 1 | [GitHub Copilot Quick Start](Labs/Lab%201%20-%20GitHub%20Copilot%20Quick%20Start/Lab%201%20-%20GitHub%20Copilot%20Quick%20Start.md) | 45 min | Set up VS Code and Copilot. Create custom agents, run the Wheels vs Doors debate, and learn sub-agent orchestration — all before writing any code. |
| 2 | [Connecting to the Platform](Labs/Lab%202%20-%20Connecting%20to%20Dataverse/Lab%202%20-%20Connecting%20to%20Dataverse.md) | 45 min | Configure PAC CLI auth and MCP servers (Dataverse + Playwright). Import the Event Schedule Designer solution and generate sample data — using agents to do real setup work. |
| 3 | [Generative Pages](Labs/Lab%203%20-%20Generative%20Pages/Lab%203%20-%20Generative%20Pages.md) | 60 min | Build a Schedule Builder page using GitHub Copilot and the Gen Pages skill. Deploy to a model-driven app via PAC CLI. Iterate on the layout and interaction design. |
| 4 | [Dataverse Plugins](Labs/Lab%204%20-%20Dataverse%20Plugins/Lab%204%20-%20Dataverse%20Plugins.md) | 60 min | Use the Developer agent to create a Dataverse plugin that enforces scheduling conflict rules server-side. Describe the business rule in plain English; the agent handles the C#, deployment, and testing. |

### Side Quests

These are optional labs you can work on during free lab time or whenever you're waiting for an agent to finish a task.

| Lab | Duration | Description |
|-----|----------|-------------|
| [Vibe Apps](Labs/Side%20Quest%20-%20Vibe%20Apps/Side%20Quest%20-%20Vibe%20Apps.md) | ~20 min | Build a similar app at vibe.powerapps.com and compare the managed experience with the full-control Copilot approach. |
| [Code Apps](Labs/Side%20Quest%20-%20Code%20Apps/Side%20Quest%20-%20Code%20Apps.md) | ~60 min | Plan and build a full React Code App using multi-agent workflows (Consultant + Developer agents), Fluent UI, and Dataverse integration. |
