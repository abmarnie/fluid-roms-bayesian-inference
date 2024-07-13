# fluid-roms-bayesian-inference
An experimental repo for constructing ROMs for the numerical solution of statistical inference problems in fluid dynamics. Largely based off of the work of [[1]](#1) and [[2]](#2).

## Dependencies

1. [Git](https://git-scm.com/downloads). 
2. [Julia](https://julialang.org/). As of July 2024, the officially recommended way to get Julia is to install [juliaup](https://github.com/JuliaLang/juliaup); it is a popular Julia version manager. In a Linux Shell (e.g., Git Bash for Windows users), you can download and install juliaup (which comes with Julia) in one command:

`curl -fsSL https://install.julialang.org | sh`

## Installation

`git clone https://github.com/abmarnie/fluid-roms-bayesian-inference.git`

## References

<a id="1">[1]</a>
Jeff Borggaard, Nathan Glatt-Holtz, and Justin Krometis. “A Bayesian ap-
proach to estimating background flows from a passive scalar”. In: SIAM/ASA
Journal on Uncertainty Quantification 8.3 (2020), pp. 1036–1060.

<a id="2">[2]</a>
Jeff Borggaard, Nathan E Glatt-Holtz, and Justin Krometis. “A statisti-
cal framework for domain shape estimation in Stokes flows”. In: Inverse
Problems 39.8 (2023), p. 085009.
