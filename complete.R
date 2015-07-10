complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  all.the.files <- paste(directory, sprintf("%03d.csv", id), sep = "/")
  all.the.data <- lapply(all.the.files, read.csv, header = TRUE)
  nobs = sapply(all.the.data, function(x) sum(complete.cases(x)))
  data.frame(id = id, nobs = nobs)
}