library(GIGrvg)
library(rGIG)
n <- 1000


p <- rep(rnorm(1),n)#rnorm(n)
a <- rep(1,n)#0.1 + runif(n)
b <- rep(1,n)#0.2 + runif(n)
x<-rGIG(p,a,b)
K = vector(mode="numeric", length=n)
for(i in 1:length(p))
{
  K[i] = rgig(n=1, p[i], b[i], a[i])
}

plot (density(K))
lines (density(x))