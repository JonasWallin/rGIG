#include <Rcpp.h>
#include "gig_par.h"
#include <R.h>
#include <Rmath.h>
#ifdef _OPENMP
  #include <omp.h>
#endif

#include <stdio.h>
#include <stdlib.h>
// Below is a simple example of exporting a C++ function to R. You can
// source thiz function into an R session using the Rcpp::sourceCpp 
// function (or via the Source button on the editor toolbar)

// For more on using Rcpp click the Help button on the editor toolbar
//' Rgig wrapper for the c++ code simulating gig
//' 
//' @param a - (nx1 - double ) input parameter for gig  
//' @param b - (nx1 - double ) input parameter for gig
//' @param p - (nx1 - double)  input parameter for gig
//' @return (nx1 - double)
// [[Rcpp::export]]
Rcpp::NumericVector gig_cpp(Rcpp::NumericVector p,
                            Rcpp::NumericVector a, 
                            Rcpp::NumericVector b 
                            ) {
  
  RngStream * RngArray = new RngStream[1];
  gig *gigstream= new gig[1];
  gigstream[0].setRngStream(&(RngArray[0]));
  int n = p.size();
  Rcpp::NumericVector x(n);
  GetRNGstate();
  unsigned long *seed = (unsigned long *) malloc(6 * sizeof(unsigned long));
  for(int i = 0; i < 3; i++)
    seed[i] = (unsigned long)  round(4294967087u*Rf_runif(0,1));
  for(int i = 3; i < 6; i++)
    seed[i] = (unsigned long)  round(4294944443u*Rf_runif(0,1)); 
  PutRNGstate();
  RngArray[0].SetSeed(seed);
  for(int i = 0; i < 5; i++)
  for(int i = 0; i < n; i++)
    gigstream[0].rgig(x[i],
  					          &(p[i]), 
  					          &(a[i]), 
  					          &(b[i]));
  
  
  delete [] RngArray;
  delete [] gigstream;
  free(seed);
  return x ;
   
}
