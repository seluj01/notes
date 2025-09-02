using Distributions, Plots, LinearAlgebra, Random

Random.seed!(1234) # for reproducibility

μ = [1.0; 2.0]  # Mean vector
Σ = [2.0 1.0; 1.0 1.5]  # Covariance matrix
dist = MvNormal(μ, Σ)

# Confidence ellipse
Λ,Q = eigen(Σ) # Σ = QΛ/Q
Σsqrt = Q*diagm(sqrt.(Λ))

# Generate unit circle
θ = range(0, 2π, 100)'
circle = [cos.(θ); sin.(θ)]

# transform unit circle to ellipse
ell_1σ = μ .+ Σsqrt * circle

# Generate random samples
n_samples = 100
samples = rand(dist, n_samples)

# Plot the samples and the ellipse
plot(title="Bivariate Gaussian Distribution", aspect_ratio=:equal)
scatter!(samples[1,:], samples[2,:], label="Samples", ms=2)
plot!(ell_1σ[1,:], ell_1σ[2,:], label="1-σ ellipse", color=:red)
xlabel!("X")
ylabel!("Y")
path_save = dirname(@__FILE__()) * "/img/gaussian2Dplot.png"
savefig(path_save)
