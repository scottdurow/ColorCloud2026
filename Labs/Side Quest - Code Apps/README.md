# 🎯 Side Quest: Code Apps

Time to complete: **~60 minutes** (can be done in parallel while agents are working)

This side quest walks you through planning and building a **Power Apps Code App** — a custom React/TypeScript application that runs natively inside Power Platform. You'll use the Consultant agent to plan the app, the Developer agent to build it, then deploy it. This shows the fully self-defined end of the spectrum: you control the code, the architecture, and the deployment.

> [!NOTE]
> This assumes you've completed Labs 1–2 and have PAC CLI authenticated, the Power Platform Full Stack Skills plugin installed, and Agent Mode working. If not, go back and finish those first.

---

## ✅ Task 1 : Plan the app with the Consultant

### 👉 Set up

1. Open a new VS Code window and create a workspace folder:

   ```text
   Create a folder c:\colorcloud\codeapp and open it reusing this vscode instance
   ```

1. In Copilot Chat, switch to **Agent Mode**, select **[Power Platform] Consultant**, and set the model to **Claude Opus 4.6**.

### 👉 Enter the planning prompt

1. Submit the following prompt:

   ```text
   Plan a Code App called "Event Hub" (prefix "hub") for managing conference event registrations. It needs:
   
   - Dashboard with event cards showing registration count vs capacity, upcoming events timeline
   - Event detail page with session list, room assignments, and registered attendees
   - Registration page where internal users can register/unregister contacts for events
   - Session browser with filtering by track, speaker, and time slot
   
   The Dataverse tables (Event, Session, Room, Schedule Slot) already exist in the environment from a previous lab. The app should read from those existing tables.
   ```

1. The Consultant will spawn sub-agents (Data Modeler, UX Designer, Tester, The Critic) to collaborate on the plan. This takes **10–15 minutes** — a good time to work on another lab.

1. When complete, review the generated plan file. It should cover data model usage, page designs, navigation, and implementation steps.

> [!TIP]
> The plan is non-deterministic — yours will differ from others. That's fine. The Developer agent reads whatever plan the Consultant produced.

---

## ✅ Task 2 : Build the app with the Developer

### 👉 Switch to the Developer agent

1. Start a **new chat session** (`+` icon).

1. Select **[Power Platform] Developer** from the agent picker.

1. Enable **Bypass Approvals** so the agent can work autonomously.

### 👉 Start the build

1. Submit:

   ```text
   Implement the Code App based on the plan. Use the existing Dataverse tables — don't create new ones. Start with in-memory mock data for local development.
   ```

1. The Developer agent will:
   - Read the plan file and relevant skills (`power-apps-code-apps`, `vite-react`, `ui-fluentui-react`, `ioc-development-pattern`)
   - Scaffold a Vite + React + TypeScript project
   - Install Fluent UI v9, React Router, React Query
   - Create service interfaces, in-memory implementations, and React components
   - Build and fix any TypeScript errors

1. This takes **15–25 minutes**. Let it work — check back periodically.

> [!NOTE]
> The agent will make its own decisions about component names, folder structure, and implementation details. The output varies every time. Focus on whether it builds and runs, not whether it matches a specific layout.

---

## ✅ Task 3 : Test locally

1. When the agent finishes, ask Copilot to run the app:

   ```text
   Start the dev server and give me the URL to open in my browser
   ```

1. Open the URL Copilot provides (typically `http://localhost:5173`). You should see the app running with in-memory mock data.

1. Navigate through the pages — dashboard, event detail, sessions — and verify the UI renders correctly with Fluent UI components.

1. When you're done testing, ask Copilot to stop the server:

   ```text
   Stop the dev server
   ```

---

## ✅ Task 4 : Deploy to Power Platform

1. Ask Copilot to build and deploy:

   ```text
   Build the production version and push the Code App to Power Platform. Give me the URL to play it.
   ```

1. Copilot will run the build, push the app, and provide you with the URL to open in Power Apps.

1. Open the URL to play the app. It will initially show in-memory data since the Dataverse service implementations haven't been wired up yet.

---

## ✅ Task 5 : Connect to Dataverse (stretch goal)

If you have time, connect the app to real Dataverse data.

1. Start a **new chat session** with the **Developer** agent.

1. Submit:

   ```text
   Connect the code app to Dataverse. Keep the in-memory implementations as the default for local development. Use the existing tables from the environment. Test using the dual server approach, then publish.
   ```

1. The agent will:
   - Create Dataverse service implementations using the `@microsoft/power-apps` SDK
   - Update the service registry to detect the runtime environment
   - Test with `npm run dev` + `pac code run` (dual server)
   - Build and push the updated app

1. Once deployed, play the app in Power Apps — it should now show real data from the tables you populated in earlier labs.

---

## ✅ Task 6 : Compare approaches

You've now seen three ways to build on Power Platform with AI assistance:

| Aspect | Gen Pages (Lab 3) | Vibe Apps (Side Quest) | Code Apps (this side quest) |
|---|---|---|---|
| **What you get** | A single page inside a model-driven app | A complete standalone multi-page app | A full React app running in Power Platform |
| **Control** | Medium — you iterate on one page at a time | Low — managed workflow, you describe intent | High — full codebase, architecture decisions, service layer |
| **Data model** | Existing tables, skill reads schema | Vibe generates draft tables from prompt | Existing tables or agent creates via Web API |
| **Code access** | Single `.tsx` file per page | Browser-based code editor | Full VS Code workspace with project structure |
| **Deployment** | `pac model genpage upload` | One-click publish in browser | `pac code push` via PAC CLI |
| **Agent workflow** | Single agent (gen pages skill) | No agent — fully managed AI | Multi-agent (Consultant plans, Developer builds) |
| **Best for** | Custom pages in existing model-driven apps | Fast prototyping from a single conversation | Full SDLC control, complex apps, team development |

---

## 🥳 Side Quest Complete!

You've experienced the fully self-defined end of the building spectrum — AI agents planning and building a complete Code App with service layer patterns, Fluent UI components, and Dataverse integration. The agents handled the code, but you controlled the architecture and the decisions.
