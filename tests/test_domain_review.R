source("R/domain_review.R")

item <- list(signal=70, slack=22, drag=16, confidence=67)
stopifnot(domain_review_score(item) == 181)
stopifnot(domain_review_lane(item) == "ship")
