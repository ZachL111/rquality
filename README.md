# rquality

`rquality` is a R project for Data quality. It turns run table checks for nulls, ranges, uniqueness, and cross-field rules into a small local model with readable fixtures and a direct verification command.

## Reading Rquality

Start with the README, then open `metadata/project.json` to check the constants behind the examples. After that, `fixtures/cases.csv` shows the compact path and `examples/extended_cases.csv` gives a wider look at the same rule.

## Purpose

I use this kind of project to make a rule visible before adding more machinery around it. The important part here is not the size of the codebase. It is that the input signals, scoring rule, fixture data, and expected output can all be checked in one sitting.

## Fixture Notes

`degraded` is the first example I would inspect because it lands on the `review` path with a score of -10. The broader file also keeps `degraded` at -10 and `surge` at 227, which gives the model a useful low-to-high spread.

## Design Sketch

The core is a scoring model over demand, capacity, latency, risk, and weight. That keeps schema checks, quality rules, and manifest output in one explicit decision path. The threshold is 158, with risk penalty 5, latency penalty 2, and weight bonus 3. The R version keeps the model as simple functions over named lists for easy analysis use.

## What It Does

- Models schema checks with deterministic scoring and explicit review decisions.
- Uses fixture data to keep quality rules changes visible in code review.
- Includes extended examples for manifest output, including `surge` and `degraded`.
- Documents review gates tradeoffs in `docs/operations.md`.
- Runs locally with a single verification command and no external credentials.

## Usage

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File scripts/verify.ps1
```

This runs the language-level build or test path against the compact fixture set.

## Verification

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File scripts/audit.ps1
```

The audit command checks repository structure and README constraints before it delegates to the verifier.

## Files Worth Reading

- `tests`: verification harness
- `fixtures`: compact golden scenarios
- `examples`: expanded scenario set
- `metadata`: project constants and verification metadata
- `docs`: operations and extension notes
- `scripts`: local verification and audit commands

## Next Directions

- Add malformed input fixtures so the failure path is as visible as the happy path.
- Split the scoring constants into a typed configuration object and validate it before use.
- Add a comparison mode that shows how decisions change when one signal is adjusted.
- Add one more data quality fixture that focuses on a malformed or borderline input.

## Limits

This code is local-first. It makes no claim about deployed usage and avoids credentials, hosted state, and environment-specific setup.

## Setup

Install R and run the commands from the repository root. The project does not need credentials or a hosted service.
