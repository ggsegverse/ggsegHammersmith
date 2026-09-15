describe("hammersmith_cortical atlas", {
  it("is a ggseg_atlas", {
    expect_s3_class(hammersmith_cortical(), "ggseg_atlas")
    expect_s3_class(hammersmith_cortical(), "cortical_atlas")
  })

  it("is valid", {
    expect_true(
      is_ggseg_atlas(hammersmith_cortical())
    )
  })

  it("renders with ggseg", {
    p <- ggplot2::ggplot() +
      ggseg::geom_brain(atlas = hammersmith_cortical()) +
      ggplot2::theme_void()
    expect_s3_class(p, "gg")
  })
})

describe("hammersmith_subcortical atlas", {
  it("is a ggseg_atlas", {
    expect_s3_class(hammersmith_subcortical(), "ggseg_atlas")
  })

  it("is valid", {
    expect_true(
      is_ggseg_atlas(hammersmith_subcortical())
    )
  })
})

describe("hammersmith atlas coverage", {
  it("covers all 83 Hammersmith structures", {
    cortical <- sub("^[lr]h_", "", hammersmith_cortical()$core$label)
    labels <- union(
      setdiff(cortical, "unknown"),
      hammersmith_subcortical()$core$label
    )
    expect_equal(length(labels), 83)
  })

  it("has a mesh per subcortical structure", {
    meshes <- hammersmith_subcortical()$data$meshes
    expect_equal(nrow(meshes), nrow(hammersmith_subcortical()$core))
  })

  it("has no mesh large enough to be a whole hemisphere", {
    meshes <- hammersmith_subcortical()$data$meshes
    vertices <- vapply(meshes$mesh, function(x) nrow(x$vertices), numeric(1))
    expect_lt(max(vertices), 15000)
  })

  it("keeps the subgenual cingulate parcels cortical", {
    subgenual <- c(
      "Subgen_antCing_l", "Subgen_antCing_r",
      "Subcall_area_l", "Subcall_area_r",
      "Presubgen_antCing_l", "Presubgen_antCing_r"
    )
    cortical <- sub("^[lr]h_", "", hammersmith_cortical()$core$label)
    expect_true(all(subgenual %in% cortical))
    expect_false(any(subgenual %in% hammersmith_subcortical()$core$label))
  })

  it("keeps context geometry out of the core and palette", {
    for (atlas in list(hammersmith_cortical(), hammersmith_subcortical())) {
      expect_false(any(grepl("unknown|cortex_", atlas$core$label)))
      expect_false(any(grepl("unknown|cortex_", names(atlas$palette))))
    }
  })

  it("has a valid hex colour for every region", {
    for (atlas in list(hammersmith_cortical(), hammersmith_subcortical())) {
      expect_true(all(grepl("^#[0-9A-Fa-f]{6}$", atlas$palette)))
    }
  })
})
