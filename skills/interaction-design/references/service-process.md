# Services and human processes

This file covers services and processes carried out by people, documents and organisations, not only screens. Examples: leave requests, procurement, patient intake, employee onboarding, permit applications, support escalation, a training programme. The laws in `laws.md` still apply; translate "screen" into "step", "form", "counter" or "message".

## Translating the laws

| Law / heuristic | In a human process |
|---|---|
| Tesler | Who carries the complexity: the applicant, or the organisation? Don't make people collect data the organisation already holds. |
| Postel | Accept requests through the channels and formats people actually use; the organisation normalises them internally. |
| Hick | Count the decisions the person must make, and the approvers and forms they must choose between. Each fork costs time and causes wrong turns. |
| Miller | Requirements arrive in chunks (a checklist with 3–5 groups), not as a 4-page regulation. |
| Jakob | Follow the way people already do similar things elsewhere, such as existing forms, channels and terms. A unique internal procedure costs every newcomer. |
| Visibility of status / Zeigarnik / goal-gradient | People can see where their request is, who holds it, and what remains, without having to ask. |
| Doherty, translated | Acknowledge receipt immediately (same day). For each step, publish the expected waiting time and keep to it. Silence is the main source of anxiety and of chasing. |
| Error hierarchy | Prevent incomplete submissions with a checklist or template. Detect problems early, at intake, not at the final approver. Explain a rejection with the exact fix. Allow resubmission without starting over. |
| Peak-End | Design the decision moment and the closure: a clear outcome, what happens next, and the record kept. |
| User control and freedom | People can withdraw, edit or appeal. Every state has an exit. |
| Norman constraints / signifiers | The form makes the wrong option impossible, or shows clearly which option applies to whom. |

## Service blueprint

Use a blueprint when staff, several units or systems deliver the experience. Map **one scenario**, for example "employee requests 3 days of annual leave", with its current state first and then its future state.

| Lane | Contents |
|---|---|
| **Evidence** | What the person sees or receives: form, email, letter, counter, notification, document |
| **Person's actions** | What the applicant, customer, employee or citizen does |
| ── line of interaction ── | |
| **Frontstage** | What staff or systems do that the person sees: the reply, the approval, the counter service |
| ── line of visibility ── | |
| **Backstage** | What happens out of sight: checking leave balance, verification, routing, data entry |
| ── line of internal interaction ── | |
| **Support** | Systems, policies, tools and other units that the backstage depends on |

Columns are the steps over time. Add a row for **wait time** and one for the **owner** (role, not person) of each step.

**How to read a blueprint for problems:**
- A frontstage promise the backstage can't keep, e.g. "approved in 1 day" when the approver checks requests weekly.
- A long stretch with no touchpoint: the person is waiting with no news.
- A dense cluster of backstage steps: a candidate for simplifying, merging or automating.
- One step that depends on several support systems or one specific person: a single point of failure.
- Data entered twice in different lanes: a retyping job and a source of errors.

## Journey / experience map (the person's view)

Use one when you need to understand the experience before you fix the system. Phases run across the columns, from trigger to aftermath: *need arises → find out how → prepare → submit → wait → outcome → after*. For each phase give: goal, actions, touchpoints and channels, questions or thoughts, emotion (−2…+2), pain points and opportunities. Mark the **moments of truth**, the points that make or break trust.

Journey map or blueprint? The journey map shows *what it feels like*; the blueprint shows *why it happens*. For an audit, sketch the journey quickly, then blueprint the phases where pain clusters.

## Process state checklist

Every request or case is a state machine (`states.md`). Typical states:

`draft → submitted → received → in review → (needs revision ↔ resubmitted) → approved | rejected → fulfilled → closed`, plus `withdrawn`, `escalated`, `on hold`, `expired`.

For each state, check:
- **Who owns it?** One role, not "the team".
- **How long may it stay there?** Is there an SLA, and what happens when it is breached: reminder, escalation, auto-approval?
- **What does the person see and hear?** Is there a notification when the state changes?
- **What is the exit?** Look for dead ends: "rejected" with no reason, "on hold" with no end date, an approver on leave with no deputy.

## Handoffs

Most failures in human processes happen *between* people or units, not inside a step.
- Count the handoffs. Each one adds waiting time, a chance for loss and a fresh "who owns this?".
- At every handoff, check:
  - Is the full context passed on? Look for re-asking the person, retyping, and attachments lost.
  - Is the new owner notified?
  - Is there a fallback when that owner is absent? A deputy, a shared queue, or a time-out rule.
- Prefer one owner per request from start to end (a case owner) who coordinates the others. That beats a relay where nobody owns the whole request.

## Failure points and recovery

For each step, ask what can go wrong (missing document, wrong form, approver absent, system down, policy ambiguous), how it is detected, and how the person recovers. Fail early: verify at intake what the final approver will check. Write the exception path down. "Ask HR" is not a path.

## Ethics and power

Human processes often carry an imbalance of power: employer and employee, government and citizen, provider and patient. Check that:
- Rules and criteria are visible *before* someone applies.
- Decisions give reasons and allow an appeal.
- The process does not penalise people with less time, connectivity or literacy. Offer an assisted channel; don't make the digital channel the only way in.
- Data is collected only when needed, and the person knows who sees it.

## Output for an AUDIT of a process

1. The scenario and scope in one line.
2. A compact blueprint table (current state), or a journey table if the backstage is unknown. Mark any assumptions.
3. Findings in the standard format. In the location field name the step and lane, e.g. `Step 4 · Backstage`.
4. The top 3 changes ranked by impact on the person against effort for the organisation. Include at least one quick win that needs no system change.
