# Heuristics for AUDIT

## Nielsen's 10 usability heuristics

For each heuristic: the question to ask, then typical failures.

1. **Visibility of system status.** Does the user always know what is happening?
   Typical failures: no feedback after a click, a silent save, no progress shown on long work, a stale status badge.
2. **Match between system and the real world.** Is it written in the user's language?
   Typical failures: internal jargon, database terms, error codes, a list order that makes sense only to developers.
3. **User control and freedom.** Is there an easy exit and undo?
   Typical failures: modals that trap the user, no cancel, irreversible actions with no undo, the back button losing state.
4. **Consistency and standards.** Does the same thing look and behave the same everywhere, and follow platform conventions?
   Typical failures: two names for one concept, different button positions on different screens.
5. **Error prevention.** Is a slip hard to make?
   Typical failures: free-text input where a constrained input would work, no safe defaults, destructive actions placed next to primary ones.
6. **Recognition rather than recall.** Are the options and the context visible?
   Typical failures: placeholder-only labels, a selection lost after navigating, codes the user must remember.
7. **Flexibility and efficiency of use.** Do frequent users have accelerators?
   Typical failures: no keyboard support, no bulk actions, no recent items or defaults.
8. **Aesthetic and minimalist design.** Is anything irrelevant competing with what matters?
   Typical failures: several primary buttons, metadata noise, decoration with no purpose.
9. **Help users recognise, diagnose and recover from errors.** Is the message plain, specific and constructive?
   Typical failures: "Something went wrong", a cleared form, no retry.
10. **Help and documentation.** Is help available in context when it is needed?
    Typical failures: help hidden in a separate docs site, empty states that teach nothing.

## Norman's principles (from *The Design of Everyday Things*)

- **Affordance vs. signifier.** The affordance is what an element *can* do; the signifier is what tells the user it can. Audit the signifiers:
  - Does it look clickable? Look for false affordances (static text styled like a link) and missing ones (actions that appear only on hover, which touch users never see).
- **Mapping.** The layout of controls should correspond to their effect: a control sits next to what it changes, and the order of controls matches the order of the result.
- **Constraints.** Make the wrong action impossible or hard to do. Use disabled states, typed inputs and pickers. Always explain *why* something is disabled.
- **Feedback.** Every action produces an immediate, informative response, scaled to how important the action is.
- **Conceptual model.** The interface should show how the system works, so the user's mental model matches reality. Examples: where the data lives, what "save" means, who can see this.
- **Gulf of execution and gulf of evaluation.** These are the questions "how do I do X?" and "did it work?". Audit both gulfs for every key task.
- **Slips vs. mistakes.** A slip is the right intention with the wrong action; prevent it with constraints and undo. A mistake is the wrong intention, coming from a bad mental model; fix it with clearer signifiers and a clearer conceptual model.

## Severity scale

| Level | Meaning | Rule of thumb |
|---|---|---|
| **S4** | Blocks the task, loses data, a security or privacy risk, or locks out a user on accessibility grounds | Fix before release |
| **S3** | Major friction, a frequent error, or the user needs help to continue | Fix soon |
| **S2** | Minor friction with an easy workaround | Schedule |
| **S1** | Cosmetic or polish | When convenient |

Severity combines **frequency** (how many users and how often), **impact** (how bad it is when it happens) and **persistence** (whether users learn around it or hit it every time).

## Audit walk-through checklist

- Can a first-time user work out what this screen is for in about 5 seconds, and what the primary action is?
- Is there exactly one dominant primary action per view?
- Walk every key task end to end. Check both gulfs (how do I do it? did it work?) and where it ends (Peak-End).
- Unhappy paths: invalid input, server error, slow network, empty data, very long content, no permission, expired session, double submit.
- Keyboard only: is the tab order logical? Is focus visible? Does Esc close overlays? Is focus moved back after a modal closes?
- Screen reader basics: labels, roles, live regions for status messages, errors linked to their fields.
- Colour: contrast ≥4.5:1 for text and ≥3:1 for UI and large text; no meaning carried by colour alone.
- Motion: is `prefers-reduced-motion` respected? Is anything flashing?
- Mobile: targets ≥44pt, thumb reach, no hover-only actions, no horizontal scroll.
- Copy: specific labels such as "Save changes" (not "OK"); blame-free errors; consistent terms.
