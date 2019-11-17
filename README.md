# brfssR

This package contains five datasets provided by the Centers for Disease Control and Prevention Behavioral Risk Factor Surveillance System (BRFSS) between 2014-2017:

* `brfss_cog`: The variables from the BRFSS optional state module on cognitive function, 2015-2017
  (Source: https://www.cdc.gov/aging/pdf/2015-brfss-cognitive-decline-module.pdf)

* `brfss_cg`: The variables from the BRFSS optional state module on caregiving, 2015-2017
  (Source: https://www.cdc.gov/aging/pdf/2015-caregiving-module.pdf)

* `brfss_sgm`: The variables from the BRFSS optional state module on sexual orientation and gender identity, 2014-2018
  (Reference: https://www.americanprogress.org/issues/lgbt/reports/2016/03/29/134182/sexual-orientation-and-gender-identity-data-collection-in-the-behavioral-risk-factor-surveillance-system/)

* `brfss_emspt`: The variables from the BRFSS optional state module on emptional support and life satisfaction, 2014-2017

It also includes core variables from each BRFSS year 2014-2017:

* `brfss_core`: demographic, socioeconomic, health care, health behavior, and health status variables
  (Source: https://www.cdc.gov/brfss/annual_data/annual_data.htm)

## Installation

```R
# Install the development version from GitHub
devtools::install_github("bencapistrant/brfssR")
```

## How the raw data files are stored
The raw data files (`.XPT`) are stored via Git Large File System (LFS) (https://git-lfs.github.com/). LFS is a way to circumvent Github's limitation on large files. It replaces a file with a pointer to its storage space in a LFS cache (source: https://www.atlassian.com/git/tutorials/git-lfs). The `.rda` files should not be stored via LFS as the package will not be installable via `devtools::install_github()` and the `.rda` files will not be loadable; you will instead get the pointers if you try to open the `.rda` files.

Read more about Git LFS: https://help.github.com/en/github/managing-large-files/versioning-large-files
