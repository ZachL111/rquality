# Review Journal

The repository goal stays the same: run table checks for nulls, ranges, uniqueness, and cross-field rules. This note explains the added review angle.

The local checks classify each case as `ship`, `watch`, or `hold`. That gives the project a small review vocabulary that matches its data quality focus without claiming live deployment or external usage.

## Cases

- `baseline`: `schema drift`, score 181, lane `ship`
- `stress`: `quality gap`, score 174, lane `ship`
- `edge`: `manifest risk`, score 189, lane `ship`
- `recovery`: `record pressure`, score 149, lane `ship`
- `stale`: `schema drift`, score 144, lane `ship`

## Note

The useful failure mode here is a wrong decision on a named case, not a vague style disagreement.
