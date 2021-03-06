#' Calculate New Value of (Specific) Recursive Sequence
#'
#' For the recursive sequence xn = xn-1 + ((xn-3 - xn-2)/n), returns the
#' nth value in the sequence given the first three values.
#'
#' @param x A vector of the first three numbers in the sequence
#' @param n The integer value in the sequence to return
#'
#' @return Returns the value of the nth element in the sequence
#' @export rcrsv_solve
#'
#' @examples
#' rcrsv_solve(c(2, 4, 3), 4) # returns 2.5
#' \dontrun{rcrsv_solve(c(2, 4), 4) # returns an error}
rcrsv_solve <- function(x, n) {
  # test inputs
  rcrsv_solve_checkinputs(x=x,n=n)

  # write function
  results <-  vector(mode = "double")
  results[1:3] <-  x[1:3]
  for (i in seq(n)) {
    if (i>3)
      results[i] <- results[i-1] + (results[i-3] - results[i-2])/i
  }
  return(results[n])
}

rcrsv_solve_checkinputs <- function(x,n) {
  # test that x and n are of correct length
  if(length(x) != 3) {
    stop("x is not of length 3")
  }
  if(is.list(n)) {
    stop("n cannot be a list")
  }
  # test that x and n are numeric
  if(!is.numeric(x)) {
    stop("x is not numeric")
  }
  if(!is.numeric(n)) {
    stop("n is not numeric")
  }
  # test that n is a positive integer
  if(n<=0) {
    stop("n must be positive")
  }
  if(n%%1 != 0) {
    stop("n must be an integer")
  }
}
