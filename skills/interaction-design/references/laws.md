# Laws and principles

Each entry has five parts: the principle, how to apply it, misuse to avoid, and its neighbours. Thresholds are design targets that come from research or platform guidelines; they are not hard limits.

## Fitts's Law — size and distance
`MT = a + b·log2(2D/W)`: a target that is large and close is fast to hit, and one that is small and far away is slow and error-prone. Size and distance each matter on their own.
- Touch targets should be at least **44×44pt** (Apple) or **48×48dp** (Material); WCAG 2.2 sets the floor at 24×24px. Make the hit area bigger with padding, not by enlarging the icon.
- Put actions next to the thing they act on: a card's actions belong on the card.
- Screen edges and corners behave like targets of infinite size for a pointer. On mobile the thumb zone sits at the bottom of the screen.
- Frequent or high-value actions get larger targets.
- **Misuse:** making destructive actions tiny to "prevent" accidents, which hurts accessibility. Give them distance from the primary action and add undo or confirmation instead. Also, Fitts models movement only: a well-placed button with an ambiguous label still fails.
- First suspect when users mis-tap or mis-click.

## Hick's Law — number of choices
`RT = a + b·log2(n+1)`: decision time grows with the number of choices that are equally likely. The law predicts best for simple, uniform choices such as menus and shortcuts.
- Reduce the number of choices shown *at the same time*. Group them, use progressive disclosure, and set smart defaults so the user can skip a choice entirely.
- Clear, distinct options matter as much as their count: five clear options beat three vague ones.
- **Misuse:** hiding options that people use often. "Fewer choices" means fewer at once, not fewer features.
- Neighbours: Miller for what people remember afterwards, Tesler for who carries the complexity.

## Miller's Law — chunking
Working memory holds a small number of *chunks*. Miller's 1956 figure was 7±2; Cowan (2001) puts it closer to **4±1**. A chunk is any unit that means something to that person.
- Design the structure first and count second: section headings, groups of 3–5, formatted codes (`1234-5678`), named phases instead of "step 7 of 12".
- Experts form bigger chunks, so they can handle more density than novices.
- **Misuse:** "a menu must have 7 items". The point is to group, not to hit a number. The law is about verbal memory; visual scanning follows different rules.

## Jakob's Law — convention
Users spend most of their time in *other* products and arrive with expectations from them. Breaking a convention costs the user effort on every visit until they have learned the new pattern.
- Strong conventions: logo top-left goes home, X closes, a magnifier means search, a cart means checkout, the active nav item is highlighted, links look like links. Platform rules (iOS/Android/web) are also conventions.
- Breaking one is justified when the convention fails your task, when the domain has its own convention, when a test shows it is worse, or when the category is genuinely new.
- Breaking one is **not** justified by wanting to look different or by taste alone.
- High-frequency or high-stakes interactions should stay conventional; leave novelty to low-stakes ones. Onboarding does not substitute for a convention.

## Tesler's Law — conservation of complexity
Every task has complexity that cannot be removed, only moved. The question is who absorbs it: the product or the user.
- Remove *extraneous* complexity, which the design created. For *inherent* complexity, which the task brings, decide deliberately where it lives.
- The product should absorb it where it can: accept many input formats, detect what can be detected, offer smart defaults, suggest the fix inside the error message, and ask only for what only the user knows.
- **Misuse:** over-simplifying until the complexity reappears as support tickets, workarounds, or power users hunting for buried options. Measure complexity by outcomes (errors, time on task, support volume), not by how many elements are visible.

## Doherty Threshold — responsiveness
When the system responds in under **~400ms** the user stays in flow. The thresholds:

| Response time | What the user perceives |
|---|---|
| <100ms | Instant, like direct manipulation |
| 100–400ms | Fast, but noticeable |
| 0.4–1s | Waiting; show some sign of activity |
| 1–10s | Flow is broken; show progress |
| >10s | The user switches context; offer to continue in the background and give an estimate |

- Acknowledge the input within 100ms (a pressed state) even when the work takes longer. Use optimistic UI when the action is predictable and easy to roll back.
- Don't flash a spinner for work that finishes quickly. Delay the indicator by ~300–500ms.
- The threshold applies to *perceived waiting*, not to deliberate motion: a 250ms transition is fine.

## Postel's Law — robustness
Be liberal in what you accept and conservative in what you send. Accept phone numbers with spaces or dashes, dates in several formats, pasted text with stray whitespace; normalise them, then show the result in one consistent format. This is Tesler applied to input.

## Peak-End Rule — memory of an experience
People judge an experience by its most intense moment and its ending; how long it took matters little ("duration neglect").
- Design the peak on purpose: the first real result, the completion of the purchase or booking.
- Design the end on purpose: never end on an administrative or ambiguous screen. Give a clear confirmation and the next step.
- When a negative peak is unavoidable (a wait, a failure), make the recovery good enough that the recovery becomes the peak.

## Serial Position Effect — order
People remember items at the start (primacy) and at the end (recency) of a sequence; the middle is a valley.
- Put the critical items first or last. Navigation already follows this: primary destinations first, account and settings last.
- Put necessary but tedious steps in the middle of a flow. The last step should resolve the task.
- If an important item has to sit in the middle, rescue it with visual distinction (von Restorff).

## Von Restorff (Isolation) Effect — distinctiveness
The item that differs from its neighbours is the one people notice and remember. It only works when *few* items differ: one primary button per view, one recommended plan. Don't rely on colour alone; pair it with weight, shape or size. Watch for "isolation inflation", where every feature asks for highlight treatment.

## Zeigarnik Effect — open loops
People keep thinking about tasks they left unfinished.
- Use it for progress indicators, drafts, "resume where you left off", and short checklists of 1–3 open items.
- The precondition is **autosave**: the product must store the state reliably and restore it exactly.
- **Misuse:** progress bars that can never be completed, nags about tasks the user has abandoned, guilt-trip copy.

## Goal-Gradient Effect — the pull toward the finish
Effort increases as people get closer to a goal. Show progress honestly and make the first steps quick. Counting steps the user has already done (for example, account created = step 1 of 4) works when it is truthful. Combine with Zeigarnik.

## Progressive disclosure
Show what most users need now and reveal the rest on request: advanced settings, detail views, "show more". Use it to tame Hick and Miller. Primary actions must never be hidden behind it.

## Recognition over recall
Show options, recent items, examples and the current context instead of making users remember them. Examples: autocomplete, recent searches, the selection kept visible, labels kept visible (not placeholder-only), breadcrumbs.

## Aesthetic-Usability Effect
Users perceive polished, consistent interfaces as easier to use, and they forgive more friction in them. The most reliable signal is consistency (spacing, type scale, alignment), not decoration. **Risk:** polish can hide real usability problems in a review or demo, so test behaviour, not impressions.

## Emotional timing (from "interfaces that feel")
Name the user's emotional state at each moment and design for it:
- **System error:** the product owns the failure; never make the user feel at fault.
- **Small win:** acknowledge it briefly instead of absorbing it silently.
- **Heavy news:** deliver it calmly, without a cheerful tone or snappy motion.
- **Loading:** set expectations for what is about to arrive.
Easing carries meaning: ease-out for things arriving, ease-in for things leaving, linear only for continuous progress.
