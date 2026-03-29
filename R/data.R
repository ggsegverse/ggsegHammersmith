#' Hammersmith Brain Atlas
#'
#' Maximum probability map with 83 regions from 30 healthy adult subjects.
#'
#' @family ggseg_atlases
#' @references Hammers A, et al. (2003). Three-dimensional maximum probability
#'   atlas of the human brain. *NeuroImage*, 19(4):1301-1315.
#'   \doi{10.1016/S1053-8119(03)00165-7}
#' @return A [ggseg.formats::ggseg_atlas] object (subcortical).
#' @import ggseg.formats
#' @export
#' @examples
#' hammersmith()
#' plot(hammersmith())
hammersmith <- function() .hammersmith
