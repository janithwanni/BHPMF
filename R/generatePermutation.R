generatePermutation <- function(noTraits, traitIds, numFolds) {
  if (is.na(numFolds) || numFolds <= 0) {
    stop("numFolds must be a positive integer.")
  }

  numObs <- length(noTraits)
  permutMatTest <- matrix(0, nrow = numObs, ncol = numFolds)
  permutMatV <- matrix(0, nrow = numObs, ncol = numFolds)

  for (id in seq_len(numObs)) {
    traitId <- traitIds[[id]]
    len <- length(traitId)

    if (len == 0L) {
      warning(sprintf(
        "traitIds[[%d]] is empty (length 0); this would cause an infinite loop in the original implementation. Filling row %d with NA instead.",
        id,
        id
      ))
      permutMatTest[id, ] <- NA
      permutMatV[id, ] <- NA
      next
    }

    if (len == 1L) {
      # Single trait: test and validation are just that trait repeated
      permutMatTest[id, ] <- traitId
      permutMatV[id, ] <- traitId
      next
    }

    # Number of full sample() cycles needed to cover numFolds columns
    nCycles <- ceiling(numFolds / len)

    permt <- vector("numeric", nCycles * len)
    permv <- vector("numeric", nCycles * len)

    for (cycle in seq_len(nCycles)) {
      idx <- ((cycle - 1L) * len + 1L):(cycle * len)

      ranPermT <- sample(traitId, len, replace = FALSE)
      ranPermV <- c(ranPermT[-1], ranPermT[1])

      permt[idx] <- ranPermT
      permv[idx] <- ranPermV
    }

    permutMatTest[id, ] <- permt[1:numFolds]
    permutMatV[id, ] <- permv[1:numFolds]
  }

  return(list(permutMatTest, permutMatV))
}

