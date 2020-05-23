#' simulator of generalised inverse Gaussian (GIG) rv
#'
#' Simulating gig random variable. the density is propotional to:  \cr
#' \eqn{$x^{p-1} e^{-\frac{1}{2} (\frac{b}{x} + ax)}\, x>0$}{x^(p-1) exp( -1/2  (b/x + ax )),  x> 0}
#' 
#' @param p - (nx1 - double ) input parameter for gig   
#' @param a - (nx1 - double ) input parameter for gig, must be >0
#' @param b - (nx1 - double)  input parameter for gig, must be >0
#' @return   (nx1 - double)   GIG rvs
#' @examples
#' p <- c(1,2) 
#' b <- c(1,2) 
#' a<-c(1,1) 
#' x <- rGIG(p,a,b)
#' @export
#' 
rGIG <- function(p,a,b)
{
  if (length(a) != length(p))
    stop("vector a does not have same length as vector p")
  if (length(a) != length(b))
    stop("vector a does not have same length as vector b")
  if(min(a)<=0)
    stop("vector a must be strict pos")
  if(min(b)<=0)
    stop("vector b must be strict pos")
  return(gig_cpp(p,a,b))
}

