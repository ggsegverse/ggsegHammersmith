# Create Hammersmith Brain Atlas
#
# Source: http://brain-development.org/brain-atlases/adult-brain-atlases/
# Reference: Hammers A, et al. (2003). NeuroImage, 19(4):1301-1315.
#   doi:10.1016/S1053-8119(03)00165-7
#
# Date obtained: 2026-03-28
#
# Run with: Rscript data-raw/make_atlas.R

library(ggseg.extra)
library(ggseg.formats)

hammersmith <- create_subcortical_from_volume(
  input_volume = here::here("data-raw", "source", "Hammers_mith_atlas_n30r83_SPM5.nii.gz"),
  input_lut = here::here("data-raw", "source", "Hammersmith_LUT.txt"),
  atlas_name = "hammersmith",
  output_dir = "data-raw",
  skip_existing = TRUE,
  cleanup = FALSE
)

print(hammersmith)
plot(hammersmith)

.hammersmith <- hammersmith
usethis::use_data(.hammersmith, overwrite = TRUE, compress = "xz", internal = TRUE)
