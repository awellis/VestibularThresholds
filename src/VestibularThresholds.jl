module VestibularThresholds

using Random, Distributions
using DataFrames
using Turing
using CairoMakie
using Base: @kwdef
using StatsFuns: logistic

export ModelParams
export MixtureModelParams, PsychophysicsModelParams
export bernoulli_mixture, simulate
export mixture_model, psychophysics_model, logistic_regression
export fit_model

include("utils.jl")
include("generate-data.jl")
include("turing-models.jl")
include("turing-utils.jl")

end
