# Create Hammersmith Brain Atlas
#
# Source: http://brain-development.org/brain-atlases/adult-brain-atlases/
# Reference: Hammers A, et al. (2003). NeuroImage, 19(4):1301-1315.
# Date obtained: 2026-03-28
#
# Run with: Rscript data-raw/make_atlas.R

library(ggseg.extra)
library(ggseg.formats)

Sys.setenv(FREESURFER_HOME = "/Applications/freesurfer/7.4.1")

atlases <- create_wholebrain_from_volume(
  input_volume = here::here(
    "data-raw", "source",
    "Hammers_mith_atlas_n30r83_SPM5.nii.gz"
  ),
  input_lut = here::here("data-raw", "source", "Hammersmith_LUT.txt"),
  atlas_name = "hammersmith",
  output_dir = "data-raw",
  skip_existing = TRUE,
  cleanup = FALSE
)

.hammersmith_cortical <- atlases$cortical
.hammersmith_subcortical <- atlases$subcortical

usethis::use_data(
  .hammersmith_cortical, .hammersmith_subcortical,
  overwrite = TRUE, compress = "xz", internal = TRUE
)
