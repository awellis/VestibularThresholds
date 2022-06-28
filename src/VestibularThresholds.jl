module VestibularThresholds

using Turing, Random
using CairoMakie
using Base: @kwdef

export MixtureModelParams, PsychophysicsModelParams
export simulate

include("utils.jl")
include("generate-data.jl")
include("turing-models.jl")
include("turing-utils.jl")

end
