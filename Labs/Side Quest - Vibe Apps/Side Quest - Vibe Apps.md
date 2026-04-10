# 🎯 Side Quest: Vibe Apps

Time to complete: **~20 minutes** (can be done in parallel while agents are working)

This is an **optional side quest** you can run at any point during the workshop — especially while waiting for an agent to finish a task in Labs 3 or 4. It gives you a direct comparison between building with **GitHub Copilot** (full control, external tooling) and building with **Vibe Apps** (managed, conversational). You'll build an event schedule management app in Vibe Apps using a similar prompt to the one you used in Lab 3, then compare the results.

---

## ✅ Task 1 : Open Vibe Apps and select your environment

1. Open a **new browser tab** (keep your existing tabs open — you'll come back to them).

1. Navigate to [vibe.powerapps.com](https://vibe.powerapps.com).

1. If prompted to sign in, use the same account you've been using throughout the workshop.

1. You should see the Vibe Apps home page with the heading **Let's build your ideas together**, a prompt text box, and suggestion cards at the bottom.

1. Take a moment to explore the left navigation panel. You should see three items:
   - **Home** — the landing page you are on now
   - **Plans** — a list of your previous plans
   - **Apps** — a list of your published apps

1. In the **bottom left** of the page, select your profile icon to open the profile panel. You should see your name, email, and the currently selected **Environment**.

1. Select the environment picker and choose **Dev 2** — a separate environment from the one you've been using in Labs 2–4. This keeps the Vibe-generated tables separate from the pre-built solution tables and avoids any naming conflicts.


---

## ✅ Task 2 : Create an event schedule management app

In this task you'll enter a prompt to generate a complete event management application — the same domain as the Schedule Builder you built (or are building) in Lab 3, but as a full standalone app.

### 👉 Attach an image for design inspiration (optional)

1. If you've already deployed the Schedule Builder page from Lab 3 and have a screenshot of it, you can attach it for design inspiration. Select the **Add images** button (the **+** icon to the left of the prompt text box) and choose your screenshot.

> [!TIP]
> Don't have a screenshot? Skip this step — the prompt alone is enough. Attaching an image just gives Vibe Apps extra visual context about the layout and style you want.

### 👉 Enter the event management prompt

1. Select the prompt text box and enter the following:

   ```text
   Build a full event schedule management app. Include these pages:

   1. Dashboard — summary metrics (total events, total sessions, scheduled vs unscheduled sessions, rooms available) with charts for sessions by track/category and scheduling progress.
   2. Events — a list of all events with columns for name, start date, end date, venue, and status. Allow creating and editing events.
   3. Sessions — a table of all sessions showing title, track/category, speaker, duration, and scheduling status. Include filtering by event and track.
   4. Schedule Builder — a visual grid with rooms as columns and time slots as rows. Show scheduled sessions in the grid, color-coded by track. Include an unscheduled sessions sidebar.
   5. Rooms — a page listing all rooms with capacity, location, and equipment details.

   Use a professional conference management style with clean, modern UI.
   ```

1. Select the **Submit** button (the arrow icon) to send the prompt.

### 👉 Wait for generation to complete

1. The view will change to the app workspace. You should see a left panel with a chat area and a right panel with **Plan**, **Data**, and **App** tabs.

1. Observe the status message — it should show **Generating a plan for building**.

1. After a few moments, a task list will appear in the chat panel showing the build progress. You will see tasks such as:
   - Set up data models and mock data
   - Create Dashboard page
   - Build Events page
   - Build Sessions page
   - Build Schedule Builder page
   - Create Rooms page and configure routing

1. Wait for all tasks to complete. This typically takes **5–10 minutes** — a perfect time to switch back to your other lab and check on agent progress.

> [!TIP]
> This is exactly the workflow the timetable suggests: kick off a Vibe Apps generation, switch back to your Copilot lab work, and check back when it's done.

1. When generation is complete, you will see a summary from Copilot describing each page that was created. The app preview will show the **Dashboard** page with metric cards and charts.

---

## ✅ Task 3 : Explore the plan and data model

### 👉 Review the plan

1. Select the **Plan** tab in the right panel.

1. Review the plan contents. You should see a **User Roles** section listing personas such as **Event Organizer** and **Session Coordinator**, each with user stories describing their needs.

> [!NOTE]
> The plan is generated from your prompt and describes the application from a user perspective. Compare this with Lab 3 — there you described business requirements directly to Copilot. Here, Vibe Apps creates the user stories for you.

### 👉 Review the data model

1. Select the **Data** tab in the right panel.

1. Review the entity relationship diagram (ERD). You should see tables such as **Event**, **Session**, **Room**, and **Schedule Slot** with their columns and relationships displayed visually.

1. Compare this data model with the one you used in Lab 3. Notice:
   - Vibe Apps generated its **own** data model from your prompt
   - The column names and structure may differ from the pre-built solution in the Gen Pages lab
   - This is a **draft** — tables are not created in Dataverse until you publish

---

## ✅ Task 4 : Explore the app and editing modes

### 👉 Preview the app

1. Select the **App** tab in the right panel to return to the app preview.

1. Select the **hamburger menu** (☰) at the top left of the app.

1. You should see the navigation menu with links to all five pages:
   - **Dashboard**
   - **Events**
   - **Sessions**
   - **Schedule Builder**
   - **Rooms**

1. Select each page in the navigation to preview them. Pay special attention to the **Schedule Builder** page — compare the grid layout with what you built (or are building) in Lab 3.

### 👉 Switch to Code view

1. Above the app preview, locate the view mode buttons: **Preview**, **Code**, and **Split**.

1. Select **Code**.

1. The right panel now shows a file explorer and code editor. You should see the project structure under `src/`:
   - `components/` — reusable React components
   - `generated/` — auto-generated data types
   - `hooks/` — React hooks for data access
   - `lib/` — utility functions
   - `pages/` — one file per application page

1. Select `power.config.json` to view the app configuration. Note this is the same technology as Lab 3 — a **Vite/React/TypeScript** project using **Fluent UI**.

> [!NOTE]
> Both Lab 3 (Gen Pages) and Vibe Apps generate React/TypeScript applications. The difference is in how you direct the process: Lab 3 gives you full control via GitHub Copilot in VS Code. Vibe Apps manages the entire workflow for you from a single conversation.

### 👉 Try inline edits

1. Select **Preview** to return to the preview-only view.

1. Select the **Inline edits** toggle in the toolbar above the preview.

1. You should see a **Select an element** overlay appear on the app preview, and a bottom toolbar with an **Ask for changes...** text box and **Typography** and **Color** buttons.

1. Try selecting a heading or card element in the preview. Notice how the element becomes highlighted and the toolbar options update.

> [!TIP]
> Inline edits let you make targeted changes to individual UI elements — adjusting fonts, colors, or requesting specific changes — without affecting the rest of the app. This is something you can't do as easily in the external tooling approach.

1. Select the **Inline edits** toggle again to exit inline edit mode.

---

## ✅ Task 5 : Iterate using chat

Try a quick iteration to see how fast Vibe Apps applies changes.

1. In the chat panel on the left, enter the following prompt:

   ```text
   Add a color legend below the Schedule Builder grid showing which color maps to which track/category. Also add a "X of Y sessions scheduled" progress indicator at the top of the schedule builder page.
   ```

1. Select **Send**.

1. Observe that the changes are applied **almost instantly** — Vibe Apps only regenerates the affected page, not the entire application.

> [!NOTE]
> Compare this iteration speed with Lab 3. In the Gen Pages approach, each iteration requires code generation → PAC CLI deploy → browser refresh. In Vibe Apps, changes apply in the preview immediately. The trade-off: Vibe Apps is faster to iterate, but you have less control over the generated code and deployment.

---

## ✅ Task 6 : Publish (optional)

If you want to see the app running against real Dataverse tables:

1. Select the **Save** button in the top toolbar.

1. Select the **Publish** button in the top toolbar.

1. A **Publish your draft tables and app** dialog will appear. Select **Publish**.

1. Wait for publishing to complete (typically **1–2 minutes**). Vibe Apps creates the Dataverse tables and deploys the application.

1. When publishing is complete, select the **Play** button (▶) to open the published app in a new browser tab.

> [!NOTE]
> Since you selected Dev 2 — a separate environment from Labs 2–4 — the Vibe-generated tables won't conflict with the pre-built Event Schedule Designer tables.

---

## ✅ Task 7 : Compare with the Gen Pages approach

This is the whole point of the side quest. Take a moment to compare what Vibe Apps produced with what you built (or are building) in Lab 3.

| Aspect | Generative Pages (Lab 3) | Vibe Apps (this side quest) |
|---|---|---|
| **Starting point** | Existing model-driven app with pre-built data model and sample data | Nothing — Vibe Apps creates everything from the prompt |
| **What it generates** | A single custom page inside a model-driven app | A complete standalone multi-page React application |
| **Data model** | You use the existing tables — the skill reads actual column names from Dataverse | Vibe Apps generates its own draft data model and publishes it |
| **Control over code** | Full — you edit files in VS Code, review diffs, choose what to keep | Limited — you can view and edit code in the browser, but the workflow is managed |
| **Iteration speed** | Code → deploy → refresh (1–2 min per iteration) | Near-instant preview updates |
| **Deployment** | PAC CLI to your chosen environment | One-click publish to a Vibe-managed environment |
| **Best for** | Adding AI-generated pages to an existing model-driven app with precise control | Building a complete new application from scratch as fast as possible |
| **Agent involvement** | GitHub Copilot follows your instructions, asks questions, you approve each step | Fully managed — you describe, Vibe Apps decides and builds |

> [!NOTE]
> Neither approach is "better" — they're different tools for different situations. Vibe Apps is the fastest path from idea to working app. Gen Pages with GitHub Copilot give you full control over every line of code and integrate into an existing model-driven app. Knowing when to use which is a key architectural decision.

---

## 🥳 Side Quest Complete!

You've now experienced both sides of the AI-assisted app building spectrum:
- **Vibe Apps** — describe once, get a full app, iterate through chat
- **GitHub Copilot + Gen Pages** — full control, step-by-step iteration, integrated into your existing app

Head back to your main lab work. If you finished early, try iterating further on the Vibe App — add more pages, change the styling, or explore the code to see how it compares to the Gen Pages code you reviewed in Lab 3.
