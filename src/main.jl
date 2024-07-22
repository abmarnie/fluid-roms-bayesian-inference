# TODO: Port `run_twodStokesRotatingOuter.jl`

const rngseed = 0
const angularvelocity = -10.0
const num_bsplines_innergeometry = 40

Random.seed(rngseed)

const a0 = 1.0
const a = [-1 / 2, -1 / 8, -1 / 8, 1 / 18, 1 / 18]
const b = [1 / 4, -1 / 8, 0.0, 1 / 4, -1 / 8]

"""
    fit_bspline_to_fouriercoeffs(a0, a, b, n)

    Computes the best (with respect to L2 norm) bspline approximation to a function 
    defined by it's fourier coefficients:

    f(x) = a0 + ∑_{k = 1}^N (a_k * cos(k * x) + b_k * sin(k * x)).

    inputs:
        a0: the first fourier coefficient.
        a:  the fourier coefficients of the cosine terms.
        b:  the fourier coefficients of the sine terms.
        n:  the number of bspline interpolation points.

    outputs:
        c:   the coefficients of the L2-optimal bspline interpolant.
        err: an estimate of the approximation error.
"""
function fit_bspline_to_fouriercoeffs(a0, a, b, n)
    temp = zeros(2 * n - 1)
    temp[(n - 3):(n + 3)] =
        pi * [
            1.0 / 2520.0,
            1.0 / 21.0,
            397.0 / 840.0,
            302.0 / 315.0,
            397.0 / 840.0,
            1.0 / 21.0,
            1.0 / 2520.0,
        ] / n
    temp[(2 * n - 3):(2 * n - 1)] = pi * [1.0 / 2520.0, 1.0 / 21.0, 397.0 / 840.0] / n
    temp[1:3] = pi * [397.0 / 840.0, 1.0 / 21.0, 1.0 / 2520.0] / n

    const toeplitz_size = (length(temp) + 1) ÷ 2
    const toeplitz = temp[toeplitz_size:-1:(toeplitz_size - 1), :]

    r = a0 * 2 * pi / n * ones(n)
    const k = 1:n
    const const_factor = n^3 / (8 * pi^3)

    rhs_a = zeros(Float64, length(a), n)
    rhs_b = zeros(Float64, length(a), n)

    for n in 1:length(a)
        n4 = n^4
        rhs_a[n, :] =
            const_factor * (
                cos.(2 * n * pi * (-1 .+ k) / n) .- 4 * cos.(2 * pi * k * n / n) .+
                6 * cos.(2 * n * pi * (1 .+ k) / n) .-
                4 * cos.(2 * n * pi * (2 .+ k) / n) .+ cos.(2 * n * pi * (3 .+ k) / n)
            ) ./ n4

        rhs_b[n, :] =
            const_factor * (
                sin.(2 * n * pi * (-1 .+ k) / n) .+ 6 * sin.(2 * n * pi * (1 .+ k) / n) .-
                4 * sin.(2 * n * pi * (2 .+ k) / n) .+ sin.(2 * n * pi * (3 .+ k) / n) .-
                4 * sin.(2 * pi * k * n / n)
            ) ./ n4
    end

    r = sum(a .* rhs_a + b .* rhs_b; dims=1)

    const c = toeplitz \ r

    # The max is taken because numerical errors can make err^2 < 0.
    const err = sqrt(
        max(
            0.0,
            2 * pi * a0^2 + pi * (norm(a)^2 + norm(b)^2) - 2 * dot(r, x) +
            dot(c, toeplitz * c),
        ),
    )

    return c, err
end