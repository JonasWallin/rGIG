\name{rGIG}
\alias{rGIG}
\title{simulator of generalised inverse Gaussian (GIG) rv}
\usage{
rGIG(p, a, b)
}
\arguments{
  \item{p}{- (nx1 - double ) input parameter for gig}

  \item{a}{- (nx1 - double ) input parameter for gig, must
  be >0}

  \item{b}{- (nx1 - double) input parameter for gig, must
  be >0}
}
\value{
(nx1 - double) GIG rvs
}
\description{
Simulating gig random variable. the density is propotional
to: \cr \eqn{$x^{p-1} e^{-\frac{1}{2} (\frac{b}{x} + ax)}\,
x>0$}{x^(p-1) exp( -1/2 (b/x + ax )), x> 0}
}
\examples{
p <- c(1,2)
b <- c(1,2)
a<-c(1,1)
x <- rGIG(p,a,b)
}

