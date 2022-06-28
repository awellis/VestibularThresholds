
function fit_model(model::Function, d::DataFrame; alg=NUTS())
	m = model(d.x, d.y)
	fit = Turing.sample(m, alg, MCMCThreads(), 1000, 4)
end

