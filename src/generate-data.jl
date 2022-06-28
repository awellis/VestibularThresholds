abstract type ModelParams end

@kwdef struct MixtureModelParams <: ModelParams
    b₀::Real = 0.0
	b₁::Real = 0.5
	θ::Real = 0.1
	γ::Real = 0.5
    noise::Sampleable = Normal(0, 0.1)
end



@kwdef struct PsychophysicsModelParams <: ModelParams
    b₀::Real = 0.0
	b₁::Real = 0.5
	λ::Real = 0.1
	γ::Real = 0.1
    noise::Sampleable = Normal(0, 0.1)
end


stimulus_levels = range(-1, 1, length = 5)

function bernoulli_mixture(θ, γ, linpred::Vector{Float64}) 
	@assert 0 < θ < 1
	@assert 0 < γ < 1
    θ * γ .+ (1-θ) .* logistic.(linpred)
end

function simulate(params::MixtureModelParams,
                stimulus_levels::Vector{Float64}; 
                nreps::Int64=10, noise::Bool=false)

	x = repeat(stimulus_levels, inner = nreps)
	b₀ = params.b₀
	bₓ = params.b₁
    internal_noise = noise === true ? rand(params.noise, length(x)) : 0

	linpred = b₀ .+ bₓ .* x .+ internal_noise
	# linpred = b₀ .+ bₓ .* x

	θ = params.θ
	γ = params.γ

	p = bernoulli_mixture(θ, γ, linpred)

	y = map(x -> rand(Binomial(1, x)), p)
	d = DataFrame(x = x, linpred = linpred, y = y)
	d
end

simulate(params::MixtureModelParams,
	stimulus_levels::StepRangeLen{Float64, Base.TwicePrecision{Float64}, Base.TwicePrecision{Float64}, Int64}; 
                nreps::Int64=10, noise::Bool=false) = simulate(params, collect(stimulus_levels); 
                nreps=nreps, noise=noise)