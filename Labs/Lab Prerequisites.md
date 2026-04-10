# Workshop Prerequisites

These instructions guide you through setting up your workstation before the workshop. Please complete **all** of the steps below **before arriving** so that you are ready to go on the day.

> [!TIP]
> **We recommend using your personal laptop with a trial account** rather than your work machine. Corporate policies, firewalls, and restricted admin rights can cause issues during workshops. A personal machine with a fresh Microsoft 365 trial gives you full control and avoids IT blockers on the day.

The workshop assumes:

1. You are using a Microsoft Windows 11 workstation (or macOS with equivalent tools however the instructions maybe slightly different).
1. You are able to access a Microsoft 365 tenant with Power Platform - either existing or a new trial - see below.
1. You can access GitHub using an existing or with a new account - see below.
1. There are no enterprise policies that block you from installing the required tools.

## ✅ Create a GitHub account

If you already have a GitHub account, you can skip this task.

1. Open [github.com](https://github.com).

1. Select **Sign up** on the top right corner.

1. Enter your email address and then select **Continue**.

1. Create a password and then select **Continue**.

1. Enter a username and then select **Continue**.

1. Select whether you want to receive product updates or not and then select **Continue**.

1. Solve the puzzle to verify your account and then select **Create account**.

1. Enter the verification code that was sent to your email address.

1. When you've navigated to the welcome screen, select **Skip personalization**.

You now have a GitHub account.

## ✅ Set up GitHub Copilot

This workshop uses **GitHub Copilot** in VS Code. Every GitHub account includes **GitHub Copilot Free**, which provides a limited number of completions and chat messages per month. This is enough to follow along with the workshop.

However, for the best experience we recommend upgrading to **GitHub Copilot Pro** (or starting a free trial) which provides unlimited completions and chat, including Agent Mode.

1. Navigate to [github.com/settings/copilot](https://github.com/settings/copilot).

1. Review your current plan. You will see one of the following:
   - **Copilot Free** — included with every GitHub account. Limited completions and chat per month. Sufficient to participate but you may hit rate limits.
   - **Copilot Pro** — unlimited completions and chat, including Agent Mode. Recommended for this workshop.
   - **Copilot through your organization** — if your org provides a GitHub Copilot license (not to be confused with Microsoft 365 Copilot, which is a different product), you're all set.

1. If you are on the **Free** plan and want to upgrade, select **Start free trial** or **Upgrade to Pro** on the Copilot settings page. The trial gives you full Pro access for 30 days at no cost.

   > [!TIP]
   > If you only want to use Pro for this workshop, you can cancel the trial after the event and keep the free tier.

## ✅ Get a Microsoft 365 account

You need a Microsoft 365 account to access Power Platform. If you already have one through your organization, you can skip this section. Otherwise, follow these steps to create a trial account.

1. Navigate to the [Microsoft 365 Business Plans and Pricing page](https://www.microsoft.com/microsoft-365/business/microsoft-365-plans-and-pricing).

1. The cheapest option to get started is the **Microsoft 365 Business Basic** plan. Select **Try for free**.

1. Walk through the guided form to fill in your subscription details, account details, and payment information.

   > [!NOTE]
   > A credit card is required to start the free trial, but you will not be charged during the trial period. You can cancel before the trial ends if you do not wish to continue.

1. Once you have your new account, sign in.

   You now have a Microsoft 365 tenant. Make a note of the username and password — you will use these throughout the workshop.

## ✅ Create a new browser profile (Microsoft Edge)

It's always good to have a separate browser profile for workshops like this. This way you can keep all of your credentials separate and not have to worry about logging out of your personal or work accounts.

1. Open **Microsoft Edge**.

1. Select the **profile icon** (this may be on the top left or top right corner).

1. At the bottom of the profile list, hover over **Other profiles** and then select **Set up new work profile**.

   > [!IMPORTANT]
   > Select **Set up new work profile** not **Set up new personal profile**.

1. Select **Add**.

   This will open a new browser window on your taskbar.

1. In the new browser window, select **Start without your data**.

1. Select either **Allow** or **Don't allow**, and then select **Confirm and start browsing**.

   Edge may prompt you to configure your new browser theme. If it does, select your preferred theme and select **Next**.

1. Select **Finish**.

> [!IMPORTANT]
> Re-open these lab instructions inside the new browser profile window so that any links will open in the correct profile.

## ✅ Log in to Power Apps

Using the new browser profile, log in to Power Apps.

1. In the new browser profile, navigate to [make.powerapps.com](https://make.powerapps.com).

   > [!IMPORTANT]
   > Make sure you use the new browser profile, instead of an existing profile.

1. Sign in with the **Microsoft 365 account** you created earlier.

1. If you're prompted to stay signed in, check **Don't show this again**, and select **Yes**.

1. If asked to choose your region, select your region and select **Get started**.

   You should now be logged in and on the Power Apps Home Page.

## ✅ Create developer environments

For this workshop, you will need **two** Power Platform developer environments with Dataverse, and optionally a third if you plan to do the Code Apps side quest. You can create up to 3 developer environments for free. Developer environments will be deleted after a period of inactivity.

| Environment | How to create | Used in |
| --- | --- | --- |
| Default developer environment (your name) | Created automatically when you subscribe to the developer plan | Labs 2–4 (core labs) |
| Dev 2 | Created manually in the admin center | Vibe Apps side quest |
| Dev 3 (optional) | Created manually in the admin center | Code Apps side quest |

### 👉 Subscribe to the developer plan

You need to subscribe to the Power Apps Developer Plan to create developer environments that give you access to all of the Power Platform resources for development purposes.

1. Go to the [Power Apps Developer Plan](https://aka.ms/pp/devplan) page (use the Edge profile you created for this workshop).

1. Select **Try for Free**.

1. Enter your username and check the **Agree** checkbox -> Select **Start free**.

1. Leave the country as **United States** (or your country) and select the **Accept** button.

1. After selecting **Accept**, a Power Platform developer environment will be created for you. You will then be redirected to the maker portal. This is your **default developer environment**.

### 👉 Create two additional developer environments

You need at least one additional environment for the side quests. Create **at least one**; the second is optional (only needed for the Code Apps side quest).

1. Open the Power Platform admin center at [aka.ms/ppac](https://aka.ms/ppac).

1. Select **Environments** in the left hand menu.

1. Select **+ New**, and enter a name:
   - For the first additional environment, use `Dev 2`.
   - (Optional) For the second additional environment, use `Dev 3`.

1. Set the **Region** to **United States**.

1. Toggle **Get new features early** to **Yes**.

1. Select **Developer** as the **Type**.

1. Leave the **Managed Environment** toggle **off**. Do not enable Managed Environment at this point.

1. Select **Next**.

1. Set the **Currency** to **USD ($)**.

1. Select **Save**.

1. Wait for the environment to show as **Ready**.

> [!IMPORTANT]
> Make sure your environments are in the **Ready** state before proceeding. You can verify this in the **Environments** list in the admin center.

## ✅ Install Node.js

Node.js is required for Code Apps and Power Pages development.

1. Navigate to [nodejs.org/en/download](https://nodejs.org/en/download/package-manager) and select the **Prebuilt installer** for your environment.

1. Run the downloaded installer.

1. Select **Next**.

1. Accept the agreement -> **Next**.

1. Accept the default file path -> **Next**.

1. Accept the defaults -> **Next**.

1. Check **Automatically install the necessary tools**.

1. Select **Next** -> **Install**.

1. Select **Finish**.

1. If the **Install Additional Tools** dialog pops up, **press any key to continue** and let the packages install.

## ✅ Install .NET SDK

The .NET SDK is required for Lab 4 (Dataverse Plugins). If you skip this step, the Developer agent in Lab 4 can install it for you — but pre-installing avoids delays during the lab.

1. Navigate to [dotnet.microsoft.com/download](https://dotnet.microsoft.com/en-us/download) and download the latest **.NET SDK** (not the Runtime).

1. Run the downloaded installer and follow the prompts to complete the installation.

1. Open a terminal and verify the installation:

   ```powershell
   dotnet --version
   ```

   You should see a version number such as `8.x.x` or later.

## ✅ Install VS Code

1. Navigate to [Download Visual Studio Code](https://code.visualstudio.com/Download) and select the installer for your operating system.

1. Run the downloaded installer.

1. Accept the license agreement -> **Next**.

1. Accept the default location -> **Next**.

1. Accept the default Start Menu name -> **Next**.

1. Select both of the **Add "Open with Code"** checkboxes -> **Next** -> **Install**.

1. Select **Finish** once completed.

1. Open **VS Code** from the start menu.

1. Select your theme. **Dark Modern** is recommended for these labs.

1. Open a terminal in VS Code using `` Ctrl+` `` (back tick) and verify Node.js is installed by running:

   ```powershell
   node --version
   ```

   You should see a version number such as `v20.x.x` or later.

## ✅ Install GitHub Copilot extension

1. Open **VS Code**.

1. Select the **Extensions** icon from the **Activity bar** (`Ctrl+Shift+X`).

1. Search for **GitHub Copilot** and select **Install**.

1. After installation, select the **Signed out** indicator in the blue status bar at the bottom right of VS Code. Sign in with your **GitHub account** and follow the authentication flow in your browser.

1. Once signed in, the **user profile icon** in the **Activity bar** will show that you are logged in, confirming GitHub Copilot is active.

## ✅ Install Power Platform Tools VS Code extension

The Power Platform Tools extension provides the PAC CLI and other tools for interacting with Power Platform from VS Code.

1. Open **VS Code**.

1. Select the **Extensions** icon from the **Activity bar** (`Ctrl+Shift+X`).

1. Search for **Power Platform Tools**.

1. Select **Power Platform Tools** -> **Install**.

1. Wait for the install to complete. After a short wait, you will see the message `The pac CLI is ready for use in your VS Code terminal`.

1. Close and reopen **VS Code** to ensure the extension is fully activated. If prompted to sign in, select **Cancel** — you will sign in during the next step.

### 👉 Authorize the PAC CLI

1. Open a **PowerShell** terminal in VS Code. If you do not see one, use `` Ctrl+` `` (back tick) to show the terminal panel, then select **PowerShell** from the terminal dropdown.

1. Run the following command:

   ```powershell
   pac auth create --deviceCode
   ```

   > [!NOTE]
   > If you see an error then close any existing terminals and open a new one using `` Ctrl+Shift+` ``.

1. Copy the `https://microsoft.com/devicelogin` link and paste it into the **browser profile window that you created earlier**.

1. Copy the code displayed in the terminal, and paste it into the **Enter code** prompt and select **Next**.

1. Sign in with the **same Microsoft 365 account** you used to create the browser profile and the developer environments. If you do not see it listed, select **Use another account** and enter the credentials.

1. You will see a page asking if you are trying to sign in to **Power Platform CLI - pac**. Select **Continue**.

   You'll then see a confirmation that you have successfully signed in. Close the browser tab and return to VS Code.

1. The terminal should now show the message **Authentication profile created**.

1. At the terminal, type:

   ```powershell
   pac auth list
   ```

   You will see the new auth profile with an asterisk (*) next to it indicating that it is the currently selected profile. The profile is created as **UNIVERSAL** meaning that it is not specific to any environment.

### 👉 Select your developer environment

1. In VS Code, expand the **Power Platform** panel in the left sidebar. If you do not see the **UNIVERSAL** profile, hover over the **AUTH PROFILES** area and select **Refresh**.

   > [!IMPORTANT]
   > If you do not see the Power Platform extension icon in the sidebar, press `Ctrl + Shift + P`, type `Developer: Reload Window` and press **Enter**.

1. Under your auth profile, locate your developer environment and select the **Star icon** (**Select Environment**). The environment should then have a filled star next to it.

1. Verify your connection by running:

   ```powershell
   pac org who
   ```

   This will show the current connection and environment selected.

## ✅ Pre-flight checklist

Before the workshop, confirm you have all of the following ready:

| Item | Check |
| ---- | ----- |
| Dedicated browser profile created | ☐ |
| Logged in to [make.powerapps.com](https://make.powerapps.com) | ☐ |
| At least two developer environments created and ready | ☐ |
| VS Code installed | ☐ |
| Node.js installed | ☐ |
| GitHub account created and logged in | ☐ |
| GitHub Copilot extension installed and signed in | ☐ |
| Power Platform Tools extension installed | ☐ |
| PAC CLI authorized (`pac auth list` shows your profile) | ☐ |
| Developer environment selected (`pac org who` shows correct env) | ☐ |

> [!TIP]
> If you run into any issues during setup, bring your questions to the workshop and we will help you get sorted before the labs begin.

## 🥳 You're all set!

You have completed the prerequisite setup. See you at the workshop!
