% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/func_psdcore.R
\name{pgram_compare}
\alias{pgram_compare}
\alias{pgram_compare.amt}
\title{Compare multitaper spectrum with cosine-tapered periodogram}
\usage{
pgram_compare(x, ...)

\method{pgram_compare}{amt}(
  x,
  f = NULL,
  X = NULL,
  log.freq = TRUE,
  db.spec = TRUE,
  taper = 0.2,
  ...
)
}
\arguments{
\item{x}{a single \code{\link{psdcore}} object}

\item{...}{additional parameters (currently unused)}

\item{f}{numeric; the frequency range to plot; optional: if not given the program will show the entire band.}

\item{X}{object used to create \code{x}; optional: if not given the program will
try and access the last copy in the environment. An attempt is made to coerce to an object of class \code{'ts'}.}

\item{log.freq}{logical; should frequencies be transformed with \code{\link{log10}}?
Note that if \code{f} is given, the values should not already be transformed.}

\item{db.spec}{logical; should the spectrum estimates be converted to decibels with \code{\link{dB}}?}

\item{taper}{numeric; specifies the proportion of data to taper for the cosine periodogram.}
}
\value{
A list with the cosine-tapered estimates and the adaptive estimates, invisibly.
}
\description{
Plot the results of \code{\link{psdcore}} against the results of
\code{\link{spec.pgram}}
}
\examples{
set.seed(1234)
X <- rnorm(1e3)

# multitaper spectrum
p <- psdcore(X, ntaper=10)

# how does it compare to a single-cosine tapered spectrum?
pgram_compare(p)

# or in a certain band
pgram_compare(p, c(0.1,0.4))

# linear frequencies
pgram_compare(p, c(0.1,0.4), log.freq = FALSE)
}
