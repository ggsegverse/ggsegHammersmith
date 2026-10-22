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
  projection_opts = list(registration = "mni152"),
  skip_existing = TRUE,
  cleanup = FALSE
)

.hammersmith_cortical <- atlas_smooth(
  atlas_simplify(atlases$cortical, keep = 0.25),
  smoothness = 0.4,
  method = "chaikin"
)

# The grey `cortex_` backdrop is context, not a parcel. Its small islands
# and holes are what makes it read as a brain, and polishing it like a
# parcel eats them: simplifying at 0.5 and then smoothing took the
# outline from 46 rings to 19. The parcels keep their settings; the
# context is only lightly simplified and never smoothed, which keeps 45
# of the 46.
#
# The outline still has no sulci, and no polish setting can give it any:
# the whole-brain pipeline builds the context from the union of the
# atlas's own cortical labels, and Hammersmith's manual parcels run
# across the sulci, so the mantle is already solid in the volume. A
# sulcal outline would have to come from a cortical ribbon (the aseg one,
# as `ggsegHO`'s `ho_sub` uses), which is a change to `ggseg.extra`, not
# to this script.
# Seven slabs, of which four drew a few structures on mostly backdrop --
# axial_1 showed 3 of the 25 regions. Kept the slab that draws the most
# regions in each plane: axial_2 (25 regions, 60% of the panel), coronal_2
# (23, 69%) and sagittal_left (17, 80%). Every region is still drawn.
.hammersmith_subcortical <- atlases$subcortical |>
  atlas_simplify(keep = 0.5, exclude = "^cortex") |>
  atlas_smooth(smoothness = 0.4, method = "chaikin", exclude = "^cortex") |>
  atlas_simplify(keep = 0.9, labels = "^cortex") |>
  atlas_view_keep(c("axial_2", "coronal_2", "sagittal_left"))

usethis::use_data(
  .hammersmith_cortical, .hammersmith_subcortical,
  overwrite = TRUE, compress = "xz", internal = TRUE
)
