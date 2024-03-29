corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  ## NOTE: Do not round the result!
  all.the.files <- list.files(path = directory, pattern = "csv", full.names = TRUE)
  all.the.data <- lapply(all.the.files, read.csv, header = TRUE)
  all.complete.data <- lapply(all.the.data, function(x) subset(x, complete.cases(x)))
  all.good.data = all.complete.data[sapply(all.complete.data, function(x) nrow(x) >= threshold)]
  na.omit(sapply(all.good.data, function(x) cor(x$sulfate, x$nitrate)))
}
