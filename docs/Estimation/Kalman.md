# Kalman filter

## Model
Stochastic linear state-space model,
$$
\begin{aligned}
x_{k+1} &= A_d x_k + B_d u_k + Q\\
z_k &= H x_k + R
\end{aligned}
$$

- state is \(x_k\sim\mathcal{N}(m_k,P_k)\)
- predicted state is \(x_k\sim\mathcal{N}(m_{k}^\text{pred},P_{k}^\text{pred})\)
- output is \(z_k\sim\mathcal{N}(y_k,R)\)

<details>
<summary>Euler discretization for \(A_d\), \(B_d\)</summary>
Using Euler approximation,
$$
\begin{aligned}
\frac{\Delta x(t)}{\Delta t} &\approx Ax(t) + Bu(t) \\
\frac{x_{k+1}-x_k}{\Delta t} &= Ax_k + Bu_k\\
x_{k+1} &= \underbrace{x_k + \Delta t A x_k}_{A_d=(I+\Delta t A)} + \underbrace{\Delta t B}_{B_d} u_k
\end{aligned}
$$
</details>

## Equations
!!! note "Prediction"
     $$
     \begin{aligned}
     m_{k+1}^\text{pred} &= A_d m_k + B_du_k \\
     P_{k+1}^\text{pred} &= A_d P_k A_d^\top + Q
     \end{aligned}
     $$
!!! note "Update"
     $$
     \begin{aligned}
     S_k &= H P_{k}^\text{pred} H^\top + R \\
     K_k &= P_{k}^\text{pred} H^\top S_k^{-1} \\
     m_k &= m_{k}^\text{pred} + K_k (y_k - H m_{k}^\text{pred}) \\
     P_k &= (I - K_k H) P_{k}^\text{pred} 
     \end{aligned}
     $$
\(A_d\), \(B_d\), \(H\) can be time-varying.