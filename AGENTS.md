# Agent instructions

## Herdr
- When running inside herdr-core (`HC_TERMINAL_ID` is set), rename the current tab to a short label for the task after the first prompt or if the scope of your work significantly changes: `herdr-app do tab.rename --id "$(hc get "$HC_TERMINAL_ID" --json | jq -r '.labels["herdr.tab"]')" --name "<label>"`.
- At the same points, if your tab is the only tab in its space, rename the space too: `herdr-app do space.rename --id "$(hc get "$HC_TERMINAL_ID" --json | jq -r '.labels["herdr.space"]')" --name "<label>"`. Count the space's tabs with `herdr-app ls`; leave a space with other tabs alone, since its name covers more than your task.

## Code comments, naming and PR review replies
- Keep code comments and review replies short: state the problem the code solves (in a review reply, the change you made), then the one reason that matters. Supporting evidence goes in the PR description.
- Comment only what the code can't say: a non-obvious why or a trap, on the line it applies to. A file or model header is one or two lines: what it is and, for a table, its grain.
- Say each fact once, where its reader looks. Don't repeat in a comment what the docs beside the code already say (a dbt model's .yml description, a docstring, the README).
- Don't restate in a description or comment what a test, schema or config beside it already enforces or defines (allowed values, nullability, uniqueness, types). Say what the thing means and what's non-obvious about it.
- Keep the comment where code looks wrong or lossy but isn't: a filter that defers rows rather than drops them, a key chosen to survive recreated ids.
- Deferred work is `TODO(<ticket>): <what to do>` on the line that defers it, not prose about what a later ticket will handle.
- Make code comments and descriptions timeless: say what the thing does and why, so the text stays true until that thing changes. No history ("previously", "now", "after the fix", the PR that added it), no inventories of what it contains or what uses it ("today: X and Y"), and no measurements (row counts, partition counts, costs, when something was measured). Those go in the PR description.
- Don't edit an existing comment just to keep it current with your PR. If it needs updating on every PR, rewrite it once so it's timeless.
- If an existing comment on code you're changing isn't timeless or only restates the code beside it, consider removing it rather than updating it.
- Don't name things after a system variant (e.g. an `mma_` prefix, or "MMA" vs "legacy") unless both variants appear side by side.

## PR descriptions
- Write for a reviewer who has the diff open. Say what the diff can't: why, the evidence, how to roll it out, and what's left for other tickets. Don't restate the diff: no file lists, "what's in it" tables, walkthroughs of the logic, or lists of the tests added.
- Keep the visible part to a short summary (what and why), rollout steps, and what's not in this PR (with tickets). Put evidence (discovery, validation numbers, examples) in `<details>` sections, each with a one-line summary of what it shows.
- Describe the code as it is, not how the branch got there. If evidence ran at an earlier commit, name that commit.
- Before updating a description you wrote, re-read the live version and keep the author's edits.

## Data pipelines
- Don't add defenses for dirty upstream data that has never been seen. Prefer simple code plus a loud test, and get the source fixed.
