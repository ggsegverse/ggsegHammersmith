describe("hammersmith atlas", {
  it("is a ggseg_atlas", {
    expect_s3_class(hammersmith(), "ggseg_atlas")
  })

  it("is valid", {
    expect_true(ggseg.formats::is_ggseg_atlas(hammersmith()))
  })

  it("renders with ggseg", {
    skip_if_not_installed("ggseg")
    skip_if_not_installed("ggplot2")
    p <- plot(hammersmith()) + ggplot2::theme_void()
    expect_s3_class(p, "gg")
  })
})
