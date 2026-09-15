# ggsegHammersmith 1.0.0.9001

Both atlases are rebuilt from source against the current ggseg.extra pipeline.

## Regions

- **All 83 Hammersmith structures are now in the atlas**, up from 73. The ten
  that were previously dropped are `Ant_TL_inf_lat_l/r`, `Cerebellum_l/r`,
  `CaudateNucl_l/r`, `Pallidum_l/r`, `Putamen_r` and `ThirdVentricl`.
- **`Amygdala_r` is an amygdala again.** The pipeline used to write
  subcortical structures onto the FreeSurfer brain-outline indices, and
  Hammersmith's index 3 is `Amygdala_r`, so it rendered as a 49,711-vertex
  slab covering an entire hemisphere. The largest mesh is now `Cerebellum_l`
  at 8,709 vertices.
- **The cortical/subcortical split comes from the atlas definition.**
  `Hammersmith_LUT.txt` gained a `type` column, so the split is no longer
  guessed from surface vertex counts. `Subgen_antCing_l/r`,
  `Subcall_area_l/r` and `Presubgen_antCing_l/r` move to the cortical atlas,
  where they belong; `Brainstem`, `Corp_Callosum`, `Thalamus_l/r` and
  `TemporaHorn_r` move to the subcortical atlas (#6).

## Rendering

- **Regions have colours.** The lookup table shipped with every entry set to
  RGB 0 0 0, so both palettes were entirely black. Each structure now has a
  distinct hue.
- The cortical surface no longer has holes, and the medial wall is drawn as
  grey context rather than as a region: `unknown` is in the geometry but not
  in the atlas core or palette.
- The volume sits on the 1 mm LAS grid `mni152.register.dat` was built for,
  so the surface projection now uses `registration = "mni152"` instead of
  trusting the header, removing the roughly 2 mm MNI305 offset.
- Subcortical slabs are framed on the label bounding box, and the geometry is
  explicitly simplified and smoothed, which cuts the cortical atlas from
  22,250 to 7,311 vertices and the subcortical atlas from 10,755 to 9,695.
- **The grey brain outline behind the subcortical structures keeps its
  detail.** It used to be polished like a parcel, and simplifying at 0.5 and
  then smoothing left it with 19 of its 46 rings. The parcels keep their
  settings; the outline is now only lightly simplified and never smoothed,
  and keeps 45 of the 46.

  The outline still has no sulci, and no polish setting can give it any. The
  whole-brain pipeline builds it from the union of the atlas's own cortical
  labels, and Hammersmith's manual parcels run across the sulci, so the
  silhouette is already solid in the volume.
