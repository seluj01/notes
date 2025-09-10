# Bayesian inference

## Bayes' theorem
Obtained from the relation between conditional and joint probabilites.
<details>
<summary>Events \(A\) and \(B\)</summary>
$$
\mathbb{P}(A|B) \mathbb{P}(B) = \mathbb{P}(A,B) = \mathbb{P}(B|A) \mathbb{P}(A)
$$
$$
\mathbb{P}(A|B) = \frac{\mathbb{P}(B|A)\mathbb{P}(A)}{\mathbb{P}(A)}
$$
</details>

<details>
<summary>Discrete random variables \(X\) and \(Y\)</summary>
$$
p(X=x|Y=y) p(Y=y) = p(\lbrace X=x\rbrace ,\lbrace Y=y\rbrace) = p(Y=y|X=x) p(X=x)
$$
$$
p(X=x|Y=y) = \frac{p(Y=y|X=x) p(X=x)}{p(Y=y)}
$$
</details>

<details open>
<summary>Continuous random variables \(X\) and \(Y\)</summary>
$$
p_{X|Y}(x|y) p_Y(y) = p_{X,Y}(x,y) = p_{Y|X}(y|x) p_X(x)
$$
Omitting the subscript notation for the random variable,
$$
p(x|y) p(y) = p(x,y) = p(y|x) p(x)
$$
Bayes' theorem is
$$
p(x|y) = \frac{p(y|x) p(x)}{p(y)}
$$
</details>
The rest of this note only deals with continuous random variables. 




## Bayesian inference
With prior distribution \(p(\theta)\) and measurement model \(p(y|\theta)\),
$$
p(\theta|y_{1:N}) = \frac{p(y_{1:N}|\theta) p(\theta)}{p(y_{1:N})}
$$
Then either

- we need to keep the denominator, it can be _integrated out_ over \(\theta\) as
$$
p(y) = \int p(y|\theta)p(\theta)d\theta
$$

- we do not mind the scale factor \(p(y|\theta)\), it is sufficient to consider
$$
p(\theta|y_{1:N}) \propto p(y_{1:N}|\theta) p(\theta)
$$
which simplifies for _independent and identically distributed_ (i.i.d.) measurements, 
$$
p(\theta|y_{1:N}) \propto p(\theta) \prod_{i=1}^N p(y_i|\theta)
$$
and for Gaussian random variables (here in dim \(n=1\)),
$$
\begin{aligned}
p(\theta|y) &\propto \frac{1}{\sqrt{2\pi\sigma_\theta^2}}e^{-\frac{1}{2}\frac{(\theta-\mu_\theta)^2}{\sigma_\theta^2}}
\prod_{i=1}^N \frac{1}{\sqrt{2\pi\sigma_{y_i}^2}}e^{-\frac{1}{2}\frac{(\theta-\mu_{y_i})^2}{\sigma_{y_i}^2}}
\end{aligned}
$$

## Recursive Bayesian inference
In practice we often receive measurements successively, the posterior of one instant becomes the prior of the next.
$$
\begin{aligned}
p(\theta|y_1) &\propto p(y_1|\theta)p(\theta) \\
p(\theta|y_{1:2}) &\propto p(y_2|\theta)p(\theta|y_1) \\
&\text{etc.}
\end{aligned}
$$
<details>
<summary>Example for \(y=\theta + \epsilon\)</summary>
with measurement noise \(\epsilon=\mathcal{N}(0,\sigma_y^2)\) and a priori \(\theta\sim\mathcal{N}(\mu_0,\sigma_0^2)\), the posterior is proportional to a product of gaussians, itself proportional to another gaussian,
$$
\begin{aligned}
p(\theta|y) &\propto p(y|\theta)p(\theta) \\
&\propto \mathcal{N}(\mu_1,\sigma_1^2)
\end{aligned}
$$
with 
$$
\begin{aligned}
\mu_1 &= \frac{1}{\frac{1}{\sigma_y^2} + \frac{1}{\sigma_0^2}} \left(\frac{y}{\sigma_y^2} + \frac{\mu_0}{\sigma_0^2}\right) \\
\sigma_1^2 &= \frac{1}{\frac{1}{\sigma_y^2} + \frac{1}{\sigma_0^2}}
\end{aligned}
$$
For the multivariate case, \(p(\theta|y)\) is proportional to
$$
\begin{aligned}
\mu_1 &=\left[\Sigma_y^{-1} + \Sigma_0^{-1}\right]^{-1} \left[\Sigma_y^{-1}y + \Sigma_0^{-1}\mu_0\right] \\
\Sigma_1 &= \left[\Sigma_y^{-1} + \Sigma_0^{-1}\right]^{-1}
\end{aligned}
$$
</details>