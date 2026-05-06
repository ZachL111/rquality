# Rquality Walkthrough

This walk-through keeps the domain vocabulary close to the data instead of burying it in prose.

| Case | Focus | Score | Lane |
| --- | --- | ---: | --- |
| baseline | schema drift | 181 | ship |
| stress | quality gap | 174 | ship |
| edge | manifest risk | 189 | ship |
| recovery | record pressure | 149 | ship |
| stale | schema drift | 144 | ship |

Start with `edge` and `stale`. They create the widest contrast in this repository's fixture set, which makes them better review anchors than the middle cases.

`edge` is the optimistic case; use it to make sure the scoring path still rewards strong signal.
