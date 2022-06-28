# VestibularThresholds

Example:

```julia
m1 = MixtureModelParams()

stimulus_levels = range(-1, 1, length = 5)
d1 = simulate(m1, stimulus_levels, nreps=200)

fit = fit_model(mixture_model, d1)
```
