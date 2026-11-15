---
name: interaction-design
description: Guide, audit, or decide human-centered interaction design — digital products (apps, web, dashboards, forms), information design, and services or organisational processes (requests, approvals, onboarding) — using named laws and heuristics (Fitts, Hick, Miller, Jakob, Tesler, Doherty, Peak-End, Norman, Nielsen, Gestalt, service blueprint). Use when designing a screen, flow or process, reviewing one for usability problems, or choosing between design options.
disable-model-invocation: true
---

# Interaction Design

Three modes: **GUIDE** (design something new), **AUDIT** (judge something that exists) and **DECIDE** (choose between options). Pick the mode from the request. If the request is ambiguous, say which mode you are using in one line and go on.

Ground every claim in a named principle **and** in the actual artifact (screen, flow, code, screenshot, form, SOP, process description). A law alone is not a finding: say where it applies and what changes.

## References (read only what the task needs)

| File | Read when |
|---|---|
| `references/laws.md` | Any mode. The core laws: what each says, when it applies, common misuse |
| `references/heuristics.md` | AUDIT. Nielsen's 10, Norman's principles, severity scale |
| `references/patterns.md` | The work touches errors, feedback, loading, forms, navigation, search, onboarding, gestures |
| `references/states.md` | A component or flow has async work, branching, or many states |
| `references/information-design.md` | Layout, grouping, hierarchy, density, tables, charts, dashboards |
| `references/service-process.md` | Services and human processes: several people/units, approvals, documents, offline channels (service blueprint, handoffs, SLAs) |

## Choosing which principles matter

Start from the user's situation, not from the list of laws:

| Situation | Look first at |
|---|---|
| Too many options or a crowded screen | Hick, Miller (chunking), progressive disclosure, density |
| Hard to hit, mis-taps, mobile reach | Fitts |
| "Users don't find X" | Jakob (convention), scent/wayfinding, serial position, von Restorff |
| User does work the system could do | Tesler, Postel, recognition over recall |
| Feels slow | Doherty, loading ladder, optimistic UI |
| Errors, data loss, frustration | Error hierarchy, Norman constraints, undo over confirm |
| Unclear what happened after an action | Feedback, visibility of system status, gulf of evaluation |
| Multi-step / long tasks | Goal-gradient, Zeigarnik (with autosave), Peak-End |
| Grouping, alignment, "looks messy" | Gestalt, visual hierarchy, aesthetic-usability |
| A process run by people/units (requests, approvals, intake) | `service-process.md`: blueprint, handoffs, state ownership + Tesler, visibility of status |

Apply only 2–5 principles to any one problem. Listing every law is noise.

## GUIDE — design a screen, component, or flow

1. **Frame**: who the user is, the primary task, the context (device, frequency, stakes), and what "done" looks like. Ask only for what blocks the design; otherwise state your assumptions.
2. **Structure**: the content and actions on the screen, grouped and ordered by importance and task sequence (Miller, serial position, Gestalt).
3. **Interaction**: for each key action give the trigger, the rules, the feedback and the result. Use the conventional pattern unless there is a stated reason not to (Jakob).
4. **States**: empty, loading, partial, error, success, no-permission, offline where relevant (`states.md`). Each state needs a way out.
5. **Edges**: errors and recovery, long or missing content, first use vs. repeat use, keyboard and screen-reader access.
6. **Output**: a short spec. Cover structure, interactions, a state table, copy for key moments and open questions. Tag each design choice with the principle behind it, e.g. `(Hick)` or `(Tesler)`.

## AUDIT — review a screen, flow, or implementation

1. **Scope**: which screens, flows or tasks are in scope. Walk the primary task as a first-time user, then as a frequent user.
2. **Inspect** the real thing: a screenshot, the running app (anoa for browsing) or the code. Do not audit from memory.
3. **Check** against `heuristics.md`, then the relevant laws and patterns. Pay extra attention to the unhappy paths: errors, empty states, slow network, expired session.
4. **Report** findings ranked by severity:

```
[S3] <short title> — <where: screen/component/file:line>
Principle: <law/heuristic>
Problem: <what the user experiences, concretely>
Fix: <specific change>
```

Severity: S4 blocks the task or loses data · S3 major friction or a frequent error · S2 minor · S1 cosmetic. Put the strengths that must be kept at the end, in one or two lines. Do not pad the report: five real findings beat twenty generic ones.

## DECIDE — choose between options

1. **Restate** the options and the decision criteria: primary task, user type, frequency, stakes, platform, and constraints (time, engineering cost).
2. **Name the trade-off** each option makes, in terms of the laws. Examples: fewer choices against more hidden functionality (Hick vs. discoverability); convention against differentiation (Jakob); simplicity for the user against effort for the product (Tesler).
3. **Score** each option against the criteria in a compact table, giving reasons, not just numbers.
4. **Recommend one option.** State what would change your mind, and the cheapest way to validate the choice (first-click test, 5-user test, A/B, analytics).

## Rules

- Conventions and thresholds (44pt targets, 400ms, 4±1 chunks) are design targets, not physics. Say so when a decision depends on one.
- Accessibility is part of every mode. That means keyboard access, focus, contrast, never color alone, reduced motion, and labels.
- Prefer undo over "Are you sure?" Keep confirmation for actions that are both destructive and irreversible.
- When a recommendation conflicts with an existing design system or `DESIGN.md`, follow the system and flag the conflict.
- Match the user's language in the output. Keep the law names in English.
