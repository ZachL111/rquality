# rquality

`rquality` is a R project in data quality. Its focus is to run table checks for nulls, ranges, uniqueness, and cross-field rules.

## Project Rationale

I want this repository to be useful as a quick reading exercise: fixtures first, implementation second, verifier last.

## Rquality Review Notes

For a quick review, compare `manifest risk` with `schema drift` before reading the middle cases.

## Feature Set

- `fixtures/domain_review.csv` adds cases for schema drift and quality gap.
- `metadata/domain-review.json` records the same cases in structured form.
- `config/review-profile.json` captures the read order and the two review questions.
- `examples/rquality-walkthrough.md` walks through the case spread.
- The R code includes a review path for `manifest risk` and `schema drift`.
- `docs/field-notes.md` explains the strongest and weakest cases.

## Architecture

The implementation keeps the scoring rule plain: reward signal and confidence, preserve slack, penalize drag, then classify the result into a review lane.

The R addition stays small enough to inspect in one sitting.

## Usage

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File scripts/verify.ps1
```

## Test Command

The verifier is intentionally local. It should fail if the fixture score math, lane assignment, or language-specific test drifts.

## Next Improvements

This remains a local project with deterministic fixtures. It does not depend on credentials, hosted services, or live data. Future work should add richer malformed inputs before widening the public API.
