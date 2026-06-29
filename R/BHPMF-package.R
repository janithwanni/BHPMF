#' @keywords internal
#' @title An R Package to fill missing values in a data matrix.
#' @description
#' An R package to filling gaps in a data matrix with hierarchical information (e.g. taxonomy) using Gibbs sampling (BHPMF).
#' 
"_PACKAGE"

## usethis namespace: start
#' @import Matrix
#' @importFrom grDevices dev.off pdf
#' @importFrom graphics axis plot
#' @importFrom stats sd
#' @importFrom utils read.table write.table
## usethis namespace: end
NULL

#' @export CalculateCvRmse
#' @export GapFilling
#' @export TuneBhpmf
NULL

#' @useDynLib BHPMF, .registration = TRUE
NULL
