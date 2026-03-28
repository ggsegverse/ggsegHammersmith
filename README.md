
<!-- README.md is generated from README.Rmd. Please edit that file -->

# ggsegHammersmith

<!-- badges: start -->
<!-- badges: end -->

Contains data for ggseg for the Hammersmith adult brain atlas (83
regions).

Hammers A et al. (2003) "Three-dimensional maximum probability atlas of
the human brain, with particular reference to the temporal lobe."
Human Brain Mapping, 19(4):224-247.
[doi:10.1002/hbm.10123](https://doi.org/10.1002/hbm.10123)

## Installation

We recommend installing the ggseg-atlases through the ggseg
[r-universe](https://ggsegverse.r-universe.dev/ui#builds):

``` r
# Enable this universe
options(repos = c(
    ggsegverse = 'https://ggsegverse.r-universe.dev',
    CRAN = 'https://cloud.r-project.org'))

# Install some packages
install.packages('ggsegHammersmith')
```

You can install the development version from
[GitHub](https://github.com/) with:

``` r
# install.packages("remotes")
remotes::install_github("ggsegverse/ggsegHammersmith")
```

## Source data files

The Hammersmith atlas requires registration to download from the
Brain Development project:

<http://brain-development.org/brain-atlases/adult-brain-atlases/>

After registering, download the maximum probability atlas in MNI space
(NIfTI format) and place it in `data-raw/`.

Reference: Hammers A et al. (2003) "Three-dimensional maximum
probability atlas of the human brain, with particular reference to the
temporal lobe." *Human Brain Mapping*, 19(4):224-247.
doi:[10.1002/hbm.10123](https://doi.org/10.1002/hbm.10123)

Please note that the 'ggsegHammersmith' project is released with a
[Contributor Code of Conduct](CODE_OF_CONDUCT.md). By contributing to
this project, you agree to abide by its terms.
