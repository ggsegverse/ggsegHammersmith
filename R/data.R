#' Hammersmith Cortical Atlas
#'
#' Cortical regions from the maximum probability map with 83 regions
#' from 30 healthy adult subjects.
#'
#' @family ggseg_atlases
#' @family cortical_atlases
#'
#' @references Hammers A, et al. (2003). Three-dimensional maximum probability
#'   atlas of the human brain. *NeuroImage*, 19(4):1301-1315.
#'   \doi{10.1016/S1053-8119(03)00165-7}
#' @return A [ggseg.formats::ggseg_atlas] object (cortical).
#' @import ggseg.formats
#' @export
#' @examples
#' hammersmith_cortical()
# nolint next: object_usage_linter.
hammersmith_cortical <- function() .hammersmith_cortical

#' Hammersmith Subcortical Atlas
#'
#' Subcortical regions from the maximum probability map with 83 regions
#' from 30 healthy adult subjects.
#'
#' @family ggseg_atlases
#' @family subcortical_atlases
#'
#' @references Hammers A, et al. (2003). Three-dimensional maximum probability
#'   atlas of the human brain. *NeuroImage*, 19(4):1301-1315.
#'   \doi{10.1016/S1053-8119(03)00165-7}
#' @return A [ggseg.formats::ggseg_atlas] object (subcortical).
#' @export
#' @examples
#' hammersmith_subcortical()
# nolint next: object_usage_linter.
hammersmith_subcortical <- function() .hammersmith_subcortical
