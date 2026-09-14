# Create Hammersmith Brain Atlas
#
# Source: http://brain-development.org/brain-atlases/adult-brain-atlases/
# Reference: Hammers A, et al. (2003). NeuroImage, 19(4):1301-1315.
# Date obtained: 2026-03-28
#
# The volume is a 181x217x181 1 mm LAS grid, the grid FreeSurfer's
# average/mni152.register.dat was built for, so registration = "mni152"
# is exact here rather than the ~2 mm offset "header" leaves.
#
# Hammersmith_LUT.txt carries a type column, so the cortical/subcortical
# split is read from the atlas definition instead of guessed from surface
# vertex counts. The vertex-count fallback puts the subgenual and
# subcallosal cingulate parcels on the subcortical side, where they do not
# belong.
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
  registration = "mni152",
  skip_existing = TRUE,
  cleanup = FALSE
)

.hammersmith_cortical <- atlas_smooth(
  atlas_simplify(atlases$cortical, keep = 0.25),
  smoothness = 0.4,
  method = "chaikin"
)

.hammersmith_subcortical <- atlas_smooth(
  atlas_simplify(atlases$subcortical, keep = 0.5),
  smoothness = 0.4,
  method = "chaikin"
)

usethis::use_data(
  .hammersmith_cortical, .hammersmith_subcortical,
  overwrite = TRUE, compress = "xz", internal = TRUE
)
