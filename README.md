# fluid-roms-bayesian-inference

An experimental repo for constructing ROMs for the numerical solution of statistical inference problems in fluid dynamics. Largely based off of the work of [[1]](#1) and [[2]](#2).

## Dependencies

1. [Git](https://git-scm.com/downloads). 
2. [Julia](https://julialang.org/). As of July 2024, the officially recommended way to get Julia is to install [juliaup](https://github.com/JuliaLang/juliaup); it is a popular Julia version manager. In any Unix-like shell (e.g., Git Bash for Windows), you can download and install juliaup (which comes with Julia) in one command:

`curl -fsSL https://install.julialang.org | sh`

## Installation

`git clone https://github.com/abmarnie/fluid-roms-bayesian-inference.git`

## References

<a id="1">[1]</a>
Jeff Borggaard, Nathan Glatt-Holtz, and Justin Krometis. "A Bayesian approach to estimating background flows from a passive scalar". In: SIAM/ASA Journal on Uncertainty Quantification 8.3 (2020), pp. 1036–1060.
```
@article{borggaard2020bayesian,
  title={A Bayesian approach to estimating background flows from a passive scalar},
  author={Borggaard, Jeff and Glatt-Holtz, Nathan and Krometis, Justin},
  journal={SIAM/ASA Journal on Uncertainty Quantification},
  volume={8},
  number={3},
  pages={1036--1060},
  year={2020},
  publisher={SIAM}
}
```

<a id="2">[2]</a>
Jeff Borggaard, Nathan E Glatt-Holtz, and Justin Krometis. "A statistical framework for domain shape estimation in Stokes flows". In: Inverse Problems 39.8 (2023), p. 085009.
```
@article{borggaard2023statistical,
  title={A statistical framework for domain shape estimation in Stokes flows},
  author={Borggaard, Jeff and Glatt-Holtz, Nathan E and Krometis, Justin},
  journal={Inverse Problems},
  volume={39},
  number={8},
  pages={085009},
  year={2023},
  publisher={IOP Publishing}
}
```

## Acknowledgments

This project uses the [julia-actions/julia-format](https://github.com/julia-actions/julia-format) GitHub Action, which is under the MIT License.

Some implementation details in this project are largely based off of [BayesianShape](https://github.com/jborggaard/BayesianShape), [InfDimMCM.jl](https://github.com/krometis/InfDimMCMC.jl), and [FEMfunctions.jl](https://github.com/jborggaard/FEMfunctions.jl), which are all under the MIT License.
