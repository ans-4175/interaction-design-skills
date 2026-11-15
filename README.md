# interaction-design

> *"It looked fine in Figma."* — every product ever, right before launch

An agent skill that reviews your work like a senior designer would. Every opinion it gives names the law behind it.

You give it a screen, a flow, a dashboard, or the 11-step leave-request process run on three spreadsheets and one very tired HR person. It tells you what's broken, why it's broken, and what to change, with less "make it pop" and more "Hick's Law, S3, here's the fix."

## What it's for

- **Digital products:** apps, web, dashboards, forms, and the modal nobody can close
- **Information design:** layout, hierarchy, density, tables, and charts that don't need a legend to explain the legend
- **Services and human processes:** approvals, onboarding, intake. Most process failures happen in the handoff between people, not inside a step, so that's where it looks.

## Three modes

| Mode | When you're thinking… | You get |
|---|---|---|
| **GUIDE** | "I need to design this" | A lean spec: structure, interactions, every state (empty, loading, error, the lot) and copy, with each choice tagged by the principle behind it |
| **AUDIT** | "Something feels off" | Findings ranked from **S4** (users are crying) to **S1** (designers are crying). Each one gives principle, location, problem and fix |
| **DECIDE** | "Tabs or drawer? Fight." | The trade-offs, a scored comparison, **one** recommendation, what would change its mind, and the cheapest way to check |

```
/interaction-design audit the participant list page (screenshot attached)
/interaction-design decide: bottom tabs or a drawer for a 6-section mobile app?
/interaction-design guide: file upload with retry and progress
/interaction-design audit our leave process: form → manager → HR → email → silence
```

## The usual suspects

Fitts · Hick · Miller (the 4±1 version, not the 7 that keeps getting misquoted) · Jakob · Tesler · Doherty · Postel · Peak-End · Serial Position · von Restorff · Zeigarnik · Goal-gradient · Norman · Nielsen's 10 · Gestalt · Tufte · the service blueprint

It applies only the 2–5 laws that fit your problem. Reciting all seventeen would be a lecture, and nobody asked for one.

## Install

**Lazy mode: let your agent do it.** Paste this into Claude Code, Codex, pi, or whatever agent you're using:

```text
Install the interaction-design skill from https://github.com/ans-4175/interaction-design-skills.
Read its README first. Use `npx skills add ans-4175/interaction-design-skills` if Node is available,
otherwise run the curl one-liner from the README. Don't overwrite any existing skill folder.
Afterwards, confirm where SKILL.md landed and tell me to restart the session and run /interaction-design.
```

Or pick your speed yourself:

**One command, via [skills.sh](https://skills.sh)** (needs Node)
```bash
npx skills add ans-4175/interaction-design-skills
```

**One command, no Node, no clone**
```bash
curl -fsSL https://raw.githubusercontent.com/ans-4175/interaction-design-skills/main/install.sh | bash
# changed your mind:
curl -fsSL https://raw.githubusercontent.com/ans-4175/interaction-design-skills/main/install.sh | bash -s -- --uninstall
```

**Clone it if you plan to tinker**
```bash
git clone https://github.com/ans-4175/interaction-design-skills ~/workspaces/interaction-design
cd ~/workspaces/interaction-design
./install.sh             # symlink: edit the repo, the agent sees it immediately
./install.sh --copy      # copy, for machines where the repo won't stay
./install.sh --uninstall # remove what it installed
```

`install.sh` installs into `~/.agents/skills`, `~/.claude/skills` and `$CLAUDE_CONFIG_DIR/skills` (if set). It never overwrites a folder it didn't create. Re-run the curl line to update.

**It speaks only when spoken to.** The skill sets `disable-model-invocation: true`, so it stays out of your context until you type `/interaction-design`. To let your agent call it on its own, delete that line from `SKILL.md`.

## What's inside

```
skills/interaction-design/
  SKILL.md                          modes, how to pick a law, finding format
  references/
    laws.md                         the laws, plus how people misuse them
    heuristics.md                   Nielsen, Norman, severity scale, audit checklist
    patterns.md                     errors, feedback, loading, forms, nav, search, onboarding
    states.md                       empty/loading/error/…, state machines, micro-interactions
    information-design.md           Gestalt, hierarchy, density, tables, charts
    service-process.md              blueprints, journeys, handoffs, who owns this request
```

`SKILL.md` stays small, and the agent opens a reference file only when the task needs it (progressive disclosure).

## Credits

Adapted and extended from [Owl-Listener/designer-skills](https://github.com/Owl-Listener/designer-skills) (MIT, © 2026 MC Dean). The full list of sources is in [`SOURCES.md`](skills/interaction-design/references/SOURCES.md).

## License

MIT. Use it, fork it, and please don't put a hamburger menu on desktop. See [LICENSE](LICENSE).
