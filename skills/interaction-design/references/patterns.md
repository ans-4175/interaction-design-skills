# Patterns: decision rules

## Errors
Order of preference: **prevent → detect → communicate → recover**.
- **Prevent:** use constrained inputs (pickers, selects, masks), smart defaults and autosave. Separate destructive actions from primary ones.
- **Detect:** validate fields **on blur**, not on every keystroke; the exception is a live check the user wants (password strength, availability). Validate the whole form on submit. Handle network loss and timeouts explicitly.
- **Communicate:** say what happened, why if it helps, and what to do next.
  - Write in plain language, with no codes and no blaming the user.
  - Put the message next to the source; a form also gets a summary at the top that links to each field.
  - Match severity to the problem: error, warning or info.
- **Recover:**
  - Never clear the user's input.
  - Retry transient failures, with backoff for automatic retries.
  - Offer an alternative path and undo.
  - When the session expires, keep the user's place and their input where possible.
- **Where the error shows:** a form shows it inline per field plus a summary; a failed page shows a full-page state with retry and back; a network failure shows a banner or toast with retry; a permission error explains what access is needed and how to get it.

## Feedback
- Every action gets acknowledged. The closer the feedback is to the action the better: inline, then component, then page, then system.
- Match the intensity of the feedback to the importance of the action. A minor confirmation should not interrupt flow.
- Toasts are for low-stakes confirmations. Give them enough time to read (~4–6s, longer if there is an action); don't use them for errors that need action.
- Errors stay on screen until they are resolved. Status stays on screen while it is relevant.
- Offer undo for reversible actions instead of a confirmation dialog.
- Never carry meaning through colour alone. Announce status changes to assistive tech (`aria-live`).

## Loading
| Expected wait | Pattern |
|---|---|
| <~400ms | Nothing; delay any indicator so it doesn't flash |
| 0.4–1s | A subtle indicator, or a skeleton if the layout is known |
| 1–10s | A skeleton for content; a spinner with a label for actions; determinate progress if the work is measurable |
| >10s | Progress plus an estimate, the option to cancel or run in the background, and a notification when done |
- Use a skeleton when you know the layout; use a spinner for an unknown result or an action.
- Use optimistic UI when the result is predictable and easy to roll back. Roll back visibly if it fails.
- Avoid layout shift. Keep scroll position on refresh. Show one loading indicator per region, never several competing ones.
- Never show a blank screen. Respect reduced motion for shimmer effects.

## Forms
- **Layout:** one column. Labels above fields and always visible; never use the placeholder as the only label. Make each field as wide as its expected input.
- **Fields:** ask for less. Every optional field costs completion. Mark the *optional* fields when most are required. Group fields with headings.
- **Inputs:**
  - Up to ~5 options: radio buttons, all visible.
  - More options: a select or combobox.
  - Several options can be chosen: checkboxes.
  - Dates: a picker or segmented fields, not free text.
  - Passwords: a show/hide toggle.
- **Copy:** the button label states the outcome ("Create training", not "Submit"). Helper text goes before the field. Errors explain how to fix the problem.
- **Multi-step:**
  - Use named steps.
  - Going back must not lose data.
  - Save progress on long forms, and confirm before discarding work.
  - Add a review step for high-stakes submissions.
- **Accessibility:** use `<label for>` on every field, link errors with `aria-describedby`, and keep the focus order the same as the visual order.

## Navigation
| Situation | Pattern |
|---|---|
| Mobile, 3–5 primary destinations | Bottom tab bar |
| Desktop app, many or nested destinations | Sidebar |
| Simple site or docs | Top bar |
| Deep hierarchy | Breadcrumbs + local navigation |
| Parallel views of the same object | Tabs or segmented control |
| Rare utilities (account, help) | Utility area, top-right, or an overflow menu |
- **Orientation:** the active state shows where the user is. Make it distinct beyond colour alone; a page title helps too.
- **Scent:** labels should predict the destination, using the user's own vocabulary. Validate them with a first-click test.
- **Layout:** keep it stable across screens. Don't mix global and local navigation in one component. Don't put primary desktop navigation behind a hamburger menu.
- **Many top-level items:** more than ~7 means revisit the information architecture, not the menu styling.

## Search
- **Input:** the placeholder says what can be searched. Give it a clear button, submit on Enter, and keep the query in the field after searching.
- **Suggestions:**
  - Start after 2–3 characters.
  - Order: recent searches, popular, then completions.
  - Highlight the matched part; show 5–8 items; support keyboard navigation.
- **Results:** show the count, highlight the matched terms, and give enough metadata to decide whether to click.
- **Filters:** only show filters relevant to the results, with counts. Show applied filters as removable chips, plus "clear all".
- **Navigational queries** ("settings", "invoices") should return the destination itself.
- **Zero results:**
  - Echo the query.
  - Suggest typo fixes and broader terms, with paths to browse or get help.
  - Never show a blank page. Log zero-result queries.

## Onboarding and empty states
- Aim at time to first value. Orient the user; don't teach every feature. Defer setup and data collection until it is needed.
- **Pattern choice:**
  - The product can't work without configuration: a short setup wizard, skippable where possible.
  - An empty product makes no sense: sample data, clearly labelled and easy to clear.
  - A complex tool: contextual hints on first use.
  - A product tour: 3–5 steps at most, dismissable at any time.
- **An empty state** says what belongs here, gives one clear first action, and optionally previews what the populated state looks like. Never show an empty table with headers and nothing else.
- Returning users after a long gap need re-orientation too.

## Gestures
- Every gesture has a visible alternative, such as a button or menu. This matters for accessibility and for discovery.
- Respond immediately when a gesture starts. Show progress and a threshold while it is in progress. Allow cancelling by moving back to the start.
- **Conflicts:** lock direction to separate scroll from swipe. Use a time threshold (~500ms) to separate tap from long-press. System gestures always win.
- Provide undo for destructive gestures such as swipe-to-delete. Don't require precise timing.

## Confirmation vs. undo
- Undo is the default for reversible actions.
- Use a confirmation dialog only when an action is both destructive **and** irreversible, or affects other people.
  - The dialog names the object and its consequence ("Delete 'Batch 3'? 24 participants lose access.").
  - The button carries a verb, not "OK".
- For very high stakes, use type-to-confirm.

## Motion
- Easing: ease-out for entering, ease-in for exiting, ease-in-out for moving, linear only for continuous progress.
- Durations: ~100ms for micro state changes, 150–250ms for small transitions, 250–400ms for modals and page transitions. Stagger list items by 30–50ms and keep the whole sequence under ~700ms.
- Every animation needs a purpose: show a change of state, keep spatial continuity, or direct attention.
- Animations must be interruptible. Support `prefers-reduced-motion`.
