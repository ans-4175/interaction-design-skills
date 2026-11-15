# Information design

## Gestalt — how people see things as groups
- **Proximity:** items close together read as one group. Spacing *inside* a group must be clearly smaller than spacing *between* groups. This is the cheapest way to group.
- **Similarity:** items that share colour, shape or size read as related. So elements that look alike must behave alike, and elements that behave differently must look different.
- **Common region:** a border or background groups its contents. Use it when proximity alone isn't enough, for example on cards. Avoid nesting boxes inside boxes.
- **Continuity:** the eye follows lines and alignments. Align to a grid, and use shared edges to tie related elements together.
- **Closure:** people complete shapes that are only partly drawn. This allows minimal icons, and content cut off at the edge to signal that it scrolls.
- **Figure-ground:** the layer in front must separate clearly from the background, for example a modal over a dimmed background or an elevated layer.

## Visual hierarchy
- Decide the reading order first: what is the 1st, 2nd and 3rd thing the user should see? Then encode that order with size, weight, contrast, position and space, roughly from strongest to weakest.
- Use a small number of levels. A type scale with ~4–6 sizes covers most products. Too many levels means no hierarchy at all.
- One focal point per view (von Restorff). Supporting information is visibly quieter than primary information.
- **Squint test:** blur the screen. The primary content and the primary action should still be what stands out.

## Density and scanning
- Show the information needed for the *current* task. Move secondary detail into a detail view, an expander or a tooltip, but never hide primary actions there.
- Scanning patterns: text-heavy pages and lists are read in an F-pattern, so left-align labels and keep line starts consistent. Hero-and-CTA pages are read in a Z-pattern.
- **Measure:** 45–75 characters per line for body text. Line height ~1.4–1.6 for body text.
- Experts tolerate, and often prefer, high density in tools they use every day. Novices need more space and guidance. Design for the actual audience.
- **Common failures:**
  - A dashboard that shows every metric instead of the 3–5 people act on.
  - A table with 10+ columns when 3 do 90% of the work.
  - Inlining every related object instead of linking to it.

## Tables
- Left-align text. Right-align numbers, use tabular figures and consistent decimals. Units go in the header, not in every cell.
- Put the identifying column first and freeze it when the table scrolls sideways. Sort by the column users decide by.
- Use minimal gridlines: whitespace or zebra striping, not a full grid. Add row hover and selection states.
- Sticky header on long tables. Give empty, loading and error states for the table itself (`states.md`).
- On mobile, collapse to cards or prioritise columns. Don't force a horizontal scroll of the whole page.

## Charts (data visualisation)
- **Choose the chart from the question:**
  - Comparing categories: bar chart.
  - Change over time: line chart.
  - Part of a whole: a stacked bar, or a pie with ≤3 slices.
  - Distribution: histogram or box plot.
  - Relationship between two measures: scatter.
  - Several series that overlap badly: small multiples instead of one tangled chart.
- **Data-ink (Tufte):** remove anything that carries no data, such as heavy gridlines, 3D, decorative fills and redundant legends. Label the data directly instead of using a legend where possible.
- **Pre-attentive attributes:** position and length are read most accurately, then angle and area, then colour intensity. Encode the most important comparison as position.
- Bars start at zero; lines may use a truncated axis if it is clearly labelled. Never use a dual axis without a strong reason.
- **Colour:**
  - Categorical: ≤6–8 distinguishable hues.
  - Sequential: one hue, light to dark.
  - Diverging: two hues around a meaningful midpoint.
  - Colourblind-safe; highlight one series and grey out the rest to make a point.
- The title states the takeaway ("Sign-ups doubled after launch"), not only the variable names.

## Copy as information design
- Headings and labels use the user's vocabulary, and the same term everywhere. One concept has one name.
- Front-load the meaning: the first 2–3 words of a label, link or message carry it.
- Numbers and dates are formatted for the locale and consistent. Show relative time ("2 hours ago") where recency matters, with the absolute time on hover.
- Microcopy for each state follows `patterns.md` and `states.md`.
