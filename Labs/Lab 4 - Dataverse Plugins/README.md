# 🚀 Lab 4: Dataverse Plugins with the Developer Agent

Time to complete: **~60 minutes**

In this lab you'll use the **[Power Platform] Developer** agent to build, deploy, and test a **Dataverse plugin** — entirely through natural language prompts. You won't need to write any code yourself. The plugin enforces a business rule: **no two regular sessions can overlap in the same room**. You describe the requirements in plain English, and the agent generates all the code, scripts, and configuration — then builds, deploys, and verifies everything works.

This is a different kind of task from the previous labs. Instead of building UI, you're adding **server-side business logic** — a rule that Dataverse enforces automatically whenever someone creates or changes a record, no matter how they do it (through a form, an API, or a bulk import). The Developer agent handles all the technical details — you focus on describing what the business rule should do.

> [!NOTE]
> **What is a plugin?** A plugin is a piece of code that Dataverse runs automatically when something happens — like when a record is created or updated. Think of it as a guardrail: it checks whether the change is valid and blocks it if not. Unlike a form-level validation rule, a plugin can't be bypassed — it runs on the server regardless of how the data gets in.

> [!IMPORTANT]
> **AI output is non-deterministic.** The prompts in this lab are suggestions — the agent may follow a different path, ask clarifying questions, or produce different code each time. That's normal. If a prompt doesn't produce the result described, rephrase it, give the agent more context about what you're seeing, or try a different angle. The goal is the outcome, not the exact words.

## ✅ Task 1 : Set up the workspace

You'll work in a dedicated folder for this lab to keep the plugin project separate from other lab work.

### 👉 Create and open a workspace folder

1. Open **Visual Studio Code**.

1. Open **GitHub Copilot Chat** (`Ctrl+Alt+I`) and make sure you're in **Agent** mode.

1. Start a **new Chat**.

1. Ask Copilot to create and open a workspace folder:

   ```text
   Create a folder c:\colorcloud\plugin and open it reusing this vscode instance
   ```

1. Select **Continue** to let Copilot run the commands. VS Code will reopen with the new empty folder as the workspace root.

> [!TIP]
> If VS Code asks you to trust the folder, select **Yes, I trust the authors**.

### 👉 Verify PAC CLI authentication

1. In Copilot Chat (Agent mode), set the permissions to **Bypass Approvals**, and verify you're authenticated to the correct environment:

   ```text
   Check that pac is authenticated against the environment:

   [Paste your environment details from Lab 2]
   ```

1. Copilot will run the commands to check the current auth profile, and login if needed.

### 👉 Select the Developer agent and verify prerequisites

1. In the Copilot Chat panel, select the **agent picker** dropdown at the top of the chat input area.

1. Select **[Power Platform] Developer**.

> [!TIP]
> If you don't see the Power Platform agents, make sure the **Power Platform Full Stack Skills** plugin is installed (Lab 1, Task 1).

1. Set the permissions to **Bypass Approvals**, and ask the Developer agent:

   ```text
   Check that the requirements for building and deploying dataverse plugins are installed.
   ```

1. The agent will check for the .NET SDK (the toolchain used to compile plugin code), PAC CLI, and other prerequisites. If anything is missing, let the agent install it — it knows what's needed.

> [!NOTE]
> Don't worry about the specific version numbers or framework details. The agent will configure everything correctly. You just need to confirm the prerequisites are installed.

## ✅ Task 2 : Provide the plugin requirements

This is where the real work happens. You'll give the Developer agent the full requirements for the plugin. The agent will autonomously create the project, write the code, and build it.

### 👉 Configure the model and permissions

1. Set the model to **Claude Opus 4.6** — this is a complex multi-step task that benefits from the strongest reasoning model.

1. Keep the permissions on **Bypass Approvals** — the agent will need to run many terminal commands (dotnet build, PowerShell scripts) and you don't want to approve each one individually.

> [!IMPORTANT]
> **Bypass Approvals** auto-approves tool calls but still asks you questions when the agent needs clarification. Use **Autopilot** if you want the agent to also answer its own questions — full autonomy. For this lab, Bypass Approvals is recommended so you can answer any questions the agent has about the requirements.

### 👉 Provide the requirements

1. In the chat input box, paste the following prompt. This gives the agent everything it needs to build the plugin:

   ```text
   I need a Dataverse plugin that enforces a business rule: no two regular sessions 
   can overlap in the same room.

   Context — the data model:

   We have an Event Schedule Designer app with these tables 
   (publisher prefix esd, solution EventScheduleDesigner):

   esd_event — a conference or multi-day event
   esd_room — a room/track within an event (has lookup esd_eventid → esd_event)
   esd_session — a session definition with esd_title (string), esd_duration 
   (whole number, minutes), and esd_isbreak (boolean). Has lookup esd_eventid → esd_event
   esd_scheduleslot — places a session into a room at a time. Has esd_starttime 
   (DateAndTime), plus lookups esd_sessionid → esd_session, esd_roomid → esd_room, 
   and esd_eventid → esd_event

   Business rules:

   When a schedule slot is created or updated, the system must check whether the 
   session's time range would overlap with any other session already scheduled in 
   the same room for the same event.
   A session's time range is calculated as: esd_starttime to esd_starttime + 
   esd_duration minutes.
   Two time ranges overlap when: start1 < end2 AND start2 < end1.
   Break sessions are exempt — if esd_isbreak is true on either the new session or 
   an existing session, no conflict should be raised. Breaks are intentionally placed 
   in every room at the same time.
   Only check against active schedule slots (statecode == 0).
   The validation must be server-side (a plugin, not client-side only) so the rule 
   cannot be bypassed.
   If a conflict is detected, block the operation and return a clear error message 
   that names both conflicting sessions and their time ranges.

   Deliverables:

   A Dataverse plugin project in a plugin/ folder (assembly name 
   EventScheduleDesigner.Plugins, signed for sandbox).
   The plugin class implementing the overlap check.
   A deployment script at scripts/deploy-plugin.ps1 that registers the assembly, 
   plugin type, and processing steps in Dataverse (idempotent — safe to re-run). 
   It should detect the environment URL from pac env who and use 
   az account get-access-token for authentication.
   A test script at scripts/test-plugin.ps1 that uses the Dataverse Web API to 
   create overlapping slots and confirm the plugin rejects them.
   Build, deploy, and verify everything works.
   ```

1. Press **Enter** and watch the agent work.

> [!NOTE]
> This is a large, multi-step prompt. The Developer agent will break it down into tasks and work through them autonomously. Expect it to:
> - Create the C# plugin project with the correct assembly name and signing
> - Write the overlap validation logic
> - Build the project to verify it compiles
> - Create the deployment PowerShell script
> - Create the test script
> - Run the deployment
> - Run the tests to verify

## ✅ Task 3 : Watch the agent work

This task is about observing and learning. The agent will go through several phases — watch how it approaches each one.

### 👉 Phase 1 — Project setup

Watch for the agent to create the project structure. It will:

- Create a `plugin/` folder with a project file (`.csproj`) — this is like a recipe that tells the build system what to compile and what libraries to use
- Add the Dataverse SDK library so the plugin code can talk to Dataverse
- Generate a signing key — Dataverse requires plugins to be digitally signed before it will run them (a security measure)
- Configure the project with the correct settings

### 👉 Phase 2 — Plugin code

Watch for the agent to write the actual business logic. Even if you don't read C#, you should be able to follow the overall structure:

- It hooks into the `Create` and `Update` events on the `esd_scheduleslot` table — so it runs every time someone adds or moves a schedule slot
- It looks up the session to find out how long it is and whether it's a break
- It queries Dataverse for other slots already in the same room
- It checks whether any of those slots overlap with the new one
- If there's a conflict (and neither session is a break), it blocks the operation and returns an error message naming both conflicting sessions

> [!TIP]
> You don't need to understand the code the agent writes. But if you see it getting stuck or going in the wrong direction, you can intervene with a plain English clarification — for example: "Remember that when updating a slot, it shouldn't conflict with itself."

### 👉 Phase 3 — Build

The agent will compile the code — turning the human-readable C# into a file that Dataverse can run. Watch for a "Build succeeded" message.

If the build fails, don't worry — the agent will read the error messages, fix the code, and try again. This self-correcting loop is a normal part of how the agent works. You might see it go through 2–3 attempts before it gets a clean build.

### 👉 Phase 4 — Deployment script

Watch for the agent to create a PowerShell script (`scripts/deploy-plugin.ps1`) that automates the entire deployment. Deploying a plugin to Dataverse normally involves several manual steps — uploading the compiled code, telling Dataverse which class to run, and configuring when it should run. The script handles all of this automatically.

Key things to notice:

- It figures out your environment URL automatically (no hardcoding)
- It authenticates using your existing Azure CLI session
- It's **idempotent** — you can run it multiple times safely (it won't create duplicates)

> [!NOTE]
> Without this script, you'd need to use the Plugin Registration Tool — a separate desktop application — to manually register each piece. The agent-generated script replaces that entire manual process.

### 👉 Phase 5 — Test script

Watch for the agent to create `scripts/test-plugin.ps1` that:

- Creates test data (an event, a room, sessions)
- Creates a schedule slot that should succeed (no conflict)
- Attempts to create an overlapping slot and verifies the plugin rejects it
- Tests that break sessions don't trigger conflicts
- Cleans up test data after the tests

### 👉 Phase 6 — Deploy and test

The agent will run the deployment script and then the test script. Watch for:

- The plugin assembly being uploaded successfully
- The processing steps being registered
- Test slots being created and overlap detection working correctly
- Clear error messages when conflicts are detected

> [!IMPORTANT]
> If the deployment or tests fail, the agent will diagnose the issue and fix it. This might take a few iterations — that's normal. Common issues include:
> - Authentication — the agent may need to refresh the Azure CLI token
> - Plugin assembly conflicts — if a previous version exists with a different signing key
> - Column name mismatches — if the actual column names in your environment differ from what was specified

## ✅ Task 4 : Review what the agent built

Once the agent has successfully deployed and tested the plugin, take a few minutes to look at what it built. You don't need to understand the code — the goal is to see the *structure* so you know what's there if you ever need to modify it.

### 👉 Review the plugin code

1. Open the plugin class file (a `.cs` file) in the `plugin/` folder.

1. You don't need to read C# to understand the overall flow. Look for these sections:

   | What to look for | What it means |
   |---------|-------------|
   | A method called `Execute` | This is the entry point — Dataverse calls this every time a schedule slot is created or updated |
   | A query section (probably with `QueryExpression` or `FetchXML`) | This is where the plugin asks Dataverse "what else is already scheduled in this room?" |
   | An overlap check (comparing start and end times) | This is the core business logic — the formula that detects conflicts |
   | A section that throws an error | This is what blocks the operation and shows the error message to the user |

> [!TIP]
> Every Dataverse plugin follows the same basic pattern: look at what's being changed → check it against existing data → block it if the change breaks a rule. Once you've seen one plugin, you can recognise the pattern in any other.

### 👉 Review the deployment script

1. Open `scripts/deploy-plugin.ps1`.

1. Don't worry about understanding every line. The key things to notice:
   - It automatically detects your environment — no hardcoded URLs to update
   - It uses your existing login — no passwords stored in the script
   - It's safe to re-run — it won't create duplicates

> [!NOTE]
> The script configures the plugin to run **before** the record is saved (called "Pre-Operation"). This means if the plugin detects a conflict, the save is cancelled entirely — the conflicting record never gets created. The user sees the error immediately.

### 👉 Review the test script

1. Open `scripts/test-plugin.ps1`.

1. Notice how the test script:
   - Creates isolated test data so it doesn't interfere with existing records
   - Tests both the happy path (no conflict) and the conflict path (overlap detected)
   - Tests the break session exemption
   - Cleans up after itself

## ✅ Task 5 : Test the plugin manually

Now verify the plugin works through the app UI, not just through scripts. If you built the Schedule Builder generative page in Lab 3, this is a great way to see the plugin in action — and to prove that server-side validation catches conflicts that no client-side check could.

### 👉 Open the Schedule Builder in two browser tabs

1. Open your workshop browser profile and navigate to [make.powerapps.com](https://make.powerapps.com).

1. Find and play the **Event Schedule Admin** model-driven app.

1. Navigate to the **Schedule Builder** page (the generative page you built in Lab 3). If you didn't build it, use the **Schedule Slots** view instead and follow the alternative steps below.

1. **Open a second browser tab** with the same Schedule Builder page — so you have two tabs showing the same schedule grid side by side.

### 👉 Create a conflict using two tabs

1. In **Tab 1**, pick an unscheduled session from the sidebar and assign it to an empty time slot in a room (e.g. "Room A, 10:00"). The session should appear in the grid and save successfully.

1. Now switch to **Tab 2**. It still shows the old view — the slot you just filled in Tab 1 appears empty here because Tab 2 hasn't refreshed.

1. In **Tab 2**, pick a **different** session and try to assign it to the **same slot** (same room, same time).

1. You should see an **error message** from the plugin — it will name both conflicting sessions and their time ranges, and the second session will **not** be saved.

> [!NOTE]
> This is exactly the scenario that server-side validation is designed for. Tab 2 had no way of knowing that Tab 1 had already filled that slot — but the plugin on the server checked at the moment of save and caught the conflict. No client-side JavaScript could have prevented this.

### 👉 Alternative: test via the Schedule Slots view

If you didn't build the Schedule Builder page in Lab 3, you can test using the standard model-driven app forms:

1. Navigate to **Schedule Slots** in the app.

1. Create a schedule slot — assign a session to a room at a specific time.

1. Create a **second schedule slot** in the **same room** with an overlapping time range.

1. You should see the same error message from the plugin.

### 👉 Verify break exemption

1. Find a session where **Is Break** is set to `Yes` (or create one).

1. Schedule it in a room at a time that overlaps with an existing regular session.

1. The plugin should **allow** this — breaks are exempt from the overlap check.

## ✅ Task 6 : Iterate on the plugin (if time allows)

If you have time, try extending the plugin with additional business rules. Go back to Copilot Chat with the Developer agent and try:

| What to ask | What it adds |
|-------------|---------------------|
| *"Add a check that prevents scheduling more than 8 hours of sessions in a single room per day"* | A daily capacity limit per room |
| *"Add a warning (not a block) when a session is scheduled with less than 15 minutes gap after the previous session"* | A buffer time recommendation |
| *"Log all conflict detection attempts to a custom table for auditing"* | An audit trail for debugging scheduling issues |
| *"Add a unit test project that tests the overlap logic without connecting to Dataverse"* | Offline unit tests using faked SDK contexts |

> [!TIP]
> Each iteration follows the same cycle: describe the change → agent updates the code → rebuild → redeploy → test. The agent handles the mechanical work — you focus on the business rules.

## 🏁 What you learned

In this lab you built and deployed a Dataverse plugin using the Developer agent — without writing any code yourself:

| Concept | What you did |
|---------|-------------|
| **Server-side business rules** | Created a plugin that enforces "no overlapping sessions" — a rule that can't be bypassed regardless of how data enters the system |
| **Plain English → working code** | Described the business rule in natural language and the agent wrote all the C# code, deployment scripts, and test scripts |
| **Automated deployment** | The agent created scripts that handle the entire deployment process — uploading the plugin, registering it, and configuring when it runs |
| **Automated testing** | The agent created test scripts that verify the plugin catches conflicts and allows breaks — proving the rule works before you rely on it |
| **Self-correcting agent** | Watched the agent build, hit errors, diagnose the problem, fix it, and retry — the same way a developer would, but faster |
| **Inspectable output** | Looked at the generated code and scripts — they're real, readable files you can version-control and maintain |

You now have a working Dataverse plugin that prevents schedule conflicts — built entirely through GitHub Copilot and the Developer agent. The same approach works for any server-side business rule: duplicate detection, required field enforcement, cascading calculations, or integration triggers. You describe what the rule should do; the agent handles how.
