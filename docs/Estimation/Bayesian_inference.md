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




## Recursive Bayesian inference for parameter estimation
With prior distribution \(p(\theta)\), measurement model \(p(y|\theta)\) and measurements \(y_{1:N}\), the estimation for model parameter \(\theta\) is
$$
p(\theta|y_{1:N}) = \frac{p(y_{1:N}|\theta) p(\theta)}{p(y_{1:N})}
$$
As measurements are typically received successively, the posterior of one instant becomes the prior of the next.
$$
\begin{aligned}
p(\theta|y_1) &= \frac{p(y_1|\theta)p(\theta)}{p(y_1)} \\
p(\theta|y_{1:2}) &= \frac{p(y_2|\theta)p(\theta|y_1)}{p(y_2)} \\
&\ldots
\end{aligned}
$$
Thus we are interested in 
$$
p(\theta|y) = \frac{p(y|\theta)p(\theta)}{p(y)}
$$
The denominator is only a normalizing constant so the PDF integrates to 1.

We can either

- compute the denominator, by _integrating out_ over \(\theta\),
$$
p(y) = \int p(y|\theta)p(\theta)d\theta
$$

- discard the denominator, if working with a quantity only proportionnal to \(p(\theta|y)\) is enough,
$$
p(\theta|y) \propto p(y|\theta) p(\theta)
$$

<details open>
<summary>Example for \(y=\theta + \epsilon\)</summary>
with measurement noise \(\epsilon=\mathcal{N}(0,\sigma_y^2)\) and a priori \(\theta\sim\mathcal{N}(\mu_0,\sigma_0^2)\), the posterior is proportional to a product of gaussians, itself proportional to another gaussian,
$$
\begin{aligned}
p(\theta|y) &\propto p(y|\theta)p(\theta) \\
&\propto \mathcal{N}(\mu_1,\sigma_1^2)
\end{aligned}
$$
$$
\begin{aligned}
\mu_1 &= \frac{1}{\frac{1}{\sigma_y^2} + \frac{1}{\sigma_0^2}} \left(\frac{y}{\sigma_y^2} + \frac{\mu_0}{\sigma_0^2}\right) \\
\sigma_1^2 &= \frac{1}{\frac{1}{\sigma_y^2} + \frac{1}{\sigma_0^2}}
\end{aligned}
$$
<details>
$$
\begin{aligned}
p(\theta|y) &\propto \exp\left(-\frac{1}{2}\frac{(y-\theta)^2}{\sigma_y^2}\right) \exp\left(-\frac{1}{2}\frac{(\theta-\mu_0)^2}{\sigma_0^2}\right) \\
&=\exp\left(-\frac{1}{2}\left(\frac{y^2-2y\theta+\theta^2}{\sigma_y^2}+\frac{\theta^2-2\theta\mu_0+\mu_0^2}{\sigma_0^2}\right)\right) \\
&= \exp\left(-\frac{1}{2}\left(\theta^2\left(\frac{1}{\sigma_y^2}+\frac{1}{\sigma_0^2}\right)-2\theta\left(\frac{y}{\sigma_y^2}+\frac{\mu_0}{\sigma_0^2}\right) + \text{cst}\right)\right)
\end{aligned}
$$
As we are interested in a quantity only proportionnal to \(p(\theta|y)\), we do not multiplying the exponential by a constant, or equivalently, adding a constant in the exponential as \(e^{f(\theta)+a}=Ae^{f(\theta)}\).
Hence the square can be completed with no regards for its last term,
$$
\begin{aligned}
&\propto \exp\left(-\frac{1}{2}\left(\frac{1}{\sigma_y^2}+\frac{1}{\sigma_0^2}\right)\left(\theta - \frac{1}{\frac{1}{\sigma_y^2}+\frac{1}{\sigma_0^2}}\left(\frac{y}{\sigma_y^2}+\frac{\mu_0}{\sigma_0^2}\right)\right)^2\right) \\
&= \exp\left(-\frac{1}{2}\frac{\left(\theta - \frac{1}{\frac{1}{\sigma_y^2}+\frac{1}{\sigma_0^2}}\left(\frac{y}{\sigma_y^2}+\frac{\mu_0}{\sigma_0^2}\right)\right)^2}{\frac{1}{\frac{1}{\sigma_y^2}+\frac{1}{\sigma_0^2}}}\right)
\end{aligned}
$$
</details>
For the multivariate case, \(p(\theta|y) \propto \mathcal{N}(\mu_1,\Sigma_1)\) with
$$
\begin{aligned}
\mu_1 &=\left[\Sigma_y^{-1} + \Sigma_0^{-1}\right]^{-1} \left[\Sigma_y^{-1}y + \Sigma_0^{-1}\mu_0\right] \\
\Sigma_1 &= \left[\Sigma_y^{-1} + \Sigma_0^{-1}\right]^{-1}
\end{aligned}
$$
</details>


<details open>
<summary>Example for \(y=\sum\theta_i x_i + \epsilon = X\theta + \epsilon \)</summary>
with input vector \(X=(x_1,\ldots,x_n)\), measurement noise \(\epsilon=\mathcal{N}(0,\sigma_y^2)\) and a priori \(\theta\sim\mathcal{N}(\mu_0,\Sigma_0)\),
$$
p(\theta|y) \propto \mathcal{N}(\mu_1,\Sigma_1^2)
$$
$$
\begin{aligned}
\mu_1 &=\left[\frac{X^\top X}{\sigma_y^2} + \Sigma_0^{-1}\right]^{-1} \left[\frac{X^\top y}{\sigma_y^2} + \Sigma_0^{-1}\mu_0\right] \\
\Sigma_1 &= \left[\frac{X^\top X}{\sigma_y^2} + \Sigma_0^{-1}\right]^{-1}
\end{aligned}
$$
<details>
$$
\begin{aligned}
p(\theta|y) &\propto \exp\left(-\frac{1}{2}\frac{(y-X\theta)^2}{\sigma_y^2}\right) \exp\left(-\frac{1}{2}(\theta-\mu_0)^\top\Sigma_0^{-1}(\theta-\mu_0)\right) \\
&=\exp\left(-\frac{1}{2}\left(\frac{y^2-2yX\theta+(X\theta)^2}{\sigma_y^2}\theta^\top\Sigma_0^{-1}\theta - 2\theta^\top\Sigma_0^{-1}\mu_0 + \mu_0^\top\Sigma_0^{-1}\mu_0\right)\right)
\end{aligned}
$$
Using \((X\theta)^2 = (X\theta)^\top X\theta = \theta^\top X^\top X \theta\) and \(yX\theta = (yX\theta)^\top = \theta^\top X^\top y\),
$$
= \exp\left(-\frac{1}{2}\left(\theta^\top\left(\frac{X^\top X}{\sigma_y^2}+\Sigma_0^{-1}\right)\theta - 2\theta^\top\left(\frac{X^\top y}{\sigma_y^2}+\Sigma_0^{-1}\mu_0\right)+\text{cst}\right)\right)
$$
and we can directly identify the form
$$
\begin{aligned}
&\quad\exp\left(-\frac{1}{2}\left(\theta^\top\Sigma_1^{-1}\theta -2\theta^\top\Sigma_1^{-1}\mu_1 + \ldots\right)\right)\\
&\propto\exp\left(-\frac{1}{2}\left((\theta-\mu_1)^\top\Sigma_1^{-1}(\theta-\mu_1)\right)\right)
\end{aligned}
$$
</details>
For the multivariate case with \(y\in\mathbb{R}^m\), \(X\in\mathbb{R}^{m\times n}\), \(\epsilon\sim\mathcal{N}(0,\Sigma_y)\), which corresponds to mapping the different lines of \(X\) onto elements of \(y\) through the same linear transformation with coefficients \(\theta\). If batches of input-output measurements are obtained, we could use this equation.
$$
\begin{aligned}
\mu_1 &=\left[X^\top\Sigma_y^{-1}X + \Sigma_0^{-1}\right]^{-1} \left[X^\top\Sigma_y^{-1}y + \Sigma_0^{-1}\mu_0\right] \\
\Sigma_1 &= \left[X^\top\Sigma_y^{-1}X + \Sigma_0^{-1}\right]^{-1}
\end{aligned}
$$
</details>