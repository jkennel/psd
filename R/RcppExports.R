# Generated by using Rcpp::compileAttributes() -> do not edit by hand
# Generator token: 10BE3573-1514-4C36-9D1C-5A225CD40393

#' c++ implementation of the RLP constraint filter
#' 
#' @inheritParams tapers-refinement
#' @export
rcpp_ctap_simple <- function(tapvec, maxslope = 1L) {
    .Call('_psd_rcpp_ctap_simple', PACKAGE = 'psd', tapvec, maxslope)
}

#' @title Nearest value below
#' @export
#' @description
#' Returns the nearest \code{m}-length value (downwards from \code{n}).
#' @details
#' This function is different from \code{\link{nextn}} in that the value is floored.
#' For example:
#' \code{10} is the result for \code{n=11,m=2} whereas \code{\link{nextn}} would give \code{12}.
#'
#' @param n integer; the number of terms (can be a vector)
#' @param m integer; the modulo term (cannot be zero)
#'
#' @author A.J. Barbour
#'
#' @seealso \code{\link{psd-utilities}}; \code{\link{psdcore}} uses this to
#' truncate series to their nearest even length (i.e., \code{m=2}).
#'
#' @examples
#' n <- 11
#' nextn(n) # 12
#' modulo_floor(n) # 10
#'
#' # works on vectors too:
#' # defaults to m=2
#' modulo_floor(seq_len(n))
#' #[1]  0  2  2  4  4  6  6  8  8 10 10
#'
#' # change the floor factor
#' modulo_floor(seq_len(n), 3)
#' #[1] 0 0 3 3 3 6 6 6 9 9 9
#'
#' # zeros are not allowed for m
#' try(modulo_floor(n, 0))
#'
modulo_floor <- function(n, m = 2L) {
    .Call('_psd_modulo_floor', PACKAGE = 'psd', n, m)
}

#' @rdname parabolic_weights
#' @export
parabolic_weights_rcpp <- function(ntap = 1L) {
    .Call('_psd_parabolic_weights_rcpp', PACKAGE = 'psd', ntap)
}

#' @title parabolic_weights_field
#' @rdname parabolic_weights
#'
#' @param ntap the maximum number of tapers
#'
#' @export
#'
parabolic_weights_field <- function(ntap) {
    .Call('_psd_parabolic_weights_field', PACKAGE = 'psd', ntap)
}

#' @title Resample an fft using varying numbers of sine tapers
#'
#' @description
#' Produce an un-normalized psd based on an fft and a vector of optimal sine tapers
#'
#' @details
#' To produce a psd estimate with our adaptive spectrum estimation method, we need only make one
#' fft calculation initially and then
#' apply the weighting factors given by \code{\link{parabolic_weights_rcpp}}, which this
#' function does.
#'
#' @param fftz complex; a vector representing the dual-length \code{\link{fft}}; see also the \code{dbl} argument
#' @param tapers integer; a vector of tapers
#' @param verbose logical; should messages be given?
#' @param dbl logical; should the code assume \code{fftz} is dual-length or single-length?
#' @param tapcap integer; the maximum number of tapers which can be applied; note that the length is
#' automatically limited by the length of the series.
#'
#' @seealso \code{\link{riedsid}}
#'
#' @examples
#' fftz <- complex(real=1:8, imaginary = 1:8)
#' taps <- 1:4
#' try(resample_fft_rcpp(fftz, taps))
#'
#' @export
resample_fft_rcpp <- function(fftz, tapers, verbose = TRUE, dbl = TRUE, tapcap = 25000L) {
    .Call('_psd_resample_fft_rcpp', PACKAGE = 'psd', fftz, tapers, verbose, dbl, tapcap)
}

#' @title replaces time consuming portion of riedsid2
#'
#' @param PSD vector or class \code{'amt'} or \code{'spec'}; the spectral values used to optimize taper numbers
#' @param ntaper scalar or vector; number of tapers to apply optimization
#' @param riedsid_column scalar integer; which column to use in multivariate optimization. If the value is 0 the maximum number of tapers for all columns is chosen. If the value is < 0 the minimum number of tapers for all columns is chosen. If the value is 1, 2, 3, etc. the number of tapers is based on the column selected.
#'
#' @return kopt vector
#' @export
#'
riedsid_rcpp <- function(PSD, ntaper, riedsid_column = 0L) {
    .Call('_psd_riedsid_rcpp', PACKAGE = 'psd', PSD, ntaper, riedsid_column)
}

#' @title Resample an fft using varying numbers of sine tapers
#'
#' @description
#' Produce an un-normalized psd based on an fft and a vector of optimal sine
#' tapers.
#'
#' @details
#' To produce a psd estimate with our adaptive spectrum estimation method,
#' we need only make one fft calculation initially and then apply the weighting
#' factors given by \code{\link{parabolic_weights}}, which this function
#' does.
#'
#' @param fftz complex; a matrix representing the dual-length \code{\link{fft}}; see also the \code{dbl} argument
#' @param tapers integer; a vector of tapers
#' @param verbose logical; should messages be given?
#' @param dbl logical; should the code assume \code{fftz} is dual-length or single-length?
#' @param tapcap integer; the maximum number of tapers which can be applied; note that the length is
#' automatically limited by the length of the series.
#'
#' @return list that includes the auto and cross-spectral density, and the
#' number of tapers
#'
#' @seealso \code{\link{riedsid}}
#'
#' @examples
#' fftz <- complex(real=1:8, imaginary = 1:8)
#' taps <- 1:4
#' try(resample_mvfft(fftz, taps))
#'
#' @export
resample_mvfft <- function(fftz, tapers, verbose = TRUE, dbl = TRUE, tapcap = 25000L) {
    .Call('_psd_resample_mvfft', PACKAGE = 'psd', fftz, tapers, verbose, dbl, tapcap)
}

calc_psd <- function(fftz, taper_vec, para, j, ne2) {
    .Call('_psd_calc_psd', PACKAGE = 'psd', fftz, taper_vec, para, j, ne2)
}

#' @title Resample an fft using varying numbers of sine tapers
#'
#' @description
#' Produce an un-normalized psd based on an fft and a vector of optimal sine tapers
#'
#' @details
#' To produce a psd estimate with our adaptive spectrum estimation method, we need only make one
#' fft calculation initially and then
#' apply the weighting factors given by \code{\link{parabolic_weights_rcpp}}, which this
#' function does.
#'
#' @param fftz complex; a matrix representing the dual-length \code{\link{fft}}; see also the \code{dbl} argument
#' @param tapers integer; a vector of tapers
#' @param verbose logical; should messages be given?
#' @param dbl logical; should the code assume \code{fftz} is dual-length or single-length?
#' @param tapcap integer; the maximum number of tapers which can be applied; note that the length is
#' automatically limited by the length of the series.
#'
#' @seealso \code{\link{riedsid}}
#'
#' @examples
#' fftz <- complex(real=1:8, imaginary = 1:8)
#' taps <- 1:4
#' try(resample_mvfft_parallel(fftz, taps))
#'
#' @export
resample_mvfft_parallel <- function(fftz, tapers, verbose = TRUE, dbl = TRUE, tapcap = 25000L) {
    .Call('_psd_resample_mvfft_parallel', PACKAGE = 'psd', fftz, tapers, verbose, dbl, tapcap)
}

#' @title
#' det_vector
#'
#' @description
#' Determinant for an array
#'
#' @param x \code{numeric array} values to evaluate
#'
#' @return vector of determinants
#'
#'
#' @export
det_vector <- function(x) {
    .Call('_psd_det_vector', PACKAGE = 'psd', x)
}

solve_tf <- function(x) {
    .Call('_psd_solve_tf', PACKAGE = 'psd', x)
}

