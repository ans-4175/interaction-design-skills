# States

## State coverage checklist
For every screen or component that shows data or runs async work, decide what each of these states looks like. Mark a state "n/a" only on purpose:

| State | Questions |
|---|---|
| **Empty (first use)** | What belongs here? What is the one first action? |
| **Empty (filtered or no results)** | Is the query or filter echoed? Is there a way to clear it or broaden it? |
| **Loading (first load)** | Skeleton or spinner? Is the indicator delayed so it doesn't flash? |
| **Refreshing** | Does the old content stay visible? Is the scroll position kept? |
| **Partial** | Some items failed, or the content is truncated: does the user know? |
| **Success / populated** | Long content, very many items, very long names? |
| **Error (recoverable)** | Retry? Is the user's input kept? |
| **Error (fatal / not found)** | A path back? |
| **No permission** | Why, and how to get access? |
| **Offline / stale** | Is the stale data marked? What happens to queued actions? |
| **Submitting** | Is double submit prevented? Can it be cancelled? |
| **Disabled** | Is the reason given? |
| **Session expired** | Is the user returned to the same place, with input kept where possible? |

## Modelling with a state machine
Use one when the behaviour has several interacting conditions, such as loading combined with error combined with editing.

1. List the **states**. They must be mutually exclusive: the UI is in exactly one at a time.
2. List the **events**: user actions, responses, timeouts.
3. Write the **transitions** as `state + event → state`.
4. Add **guards**, conditions that must hold before a transition (isValid, hasPermission).
5. Add **actions**, the side effects on entering or leaving a state (fetch, toast, focus, log).
6. Check it:
   - Every state has a way out; there are no dead ends.
   - Every async state handles success, failure **and** timeout.
   - Impossible combinations (loading and error at once, success with stale input) cannot be represented. Replace scattered booleans with a single state value.
   - Every state maps to a distinct UI.

Common shapes:
- Fetch: `idle → loading → success | error`, `error → retrying → success | error`
- Form: `editing → validating → submitting → success | error(editing, input kept)`
- Wizard: `step1 → … → review → submitting → done`, with going back allowed and data kept

Document the machine as a table (state × event) or a small diagram. These double as test cases.

## Micro-interaction spec
For one interaction that is handed off to engineering:

- **Trigger:** user (click, hover, swipe) or system (event, threshold, time).
- **Rules:** what happens, in what order, and under what conditions.
- **Feedback:** visual, motion, text, haptic or audio, with duration and easing.
- **Loops and modes:** first time vs. repeat, long-press mode, what happens when the trigger repeats quickly.
- **Accessibility:** the keyboard equivalent, the announcement, the reduced-motion version.
