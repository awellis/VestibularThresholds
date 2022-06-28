
@kwdef struct MixtureModelParams
    noise::Distribution = Normal(0, 1.0)
    b₀::Real = 0.0
	b₁::Real = 0.5
	θ::Real = 0.1
	γ::Real = 0.5
end

@kwdef struct PsychophysicsModelParams
    b₀::Real = 0.0
	b₁::Real = 0.5
	λ::Real = 0.1
	γ::Real = 0.1
end

