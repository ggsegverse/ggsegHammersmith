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
    p <- plot(hammersmith_cortical()) + ggplot2::theme_void()
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
