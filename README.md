# Multivariable Calculations
Program to compute flux, triple integrals, etc.
## Running
### In RStudio
Import code and run each section (or entire file with Ctrl + Shift + S) normally
### In VSCode
[Follow these steps](https://code.visualstudio.com/docs/languages/r) and then run each section
(or entire file with Ctrl + Shift + S) normally
## What it does
### 3D graph, double integral
Graphs a given function $z = f(x,y)$ from $x \times y$ where $\{ (x,y)\,|\,x,y \in [-2, 2]\}$
and computes the volume beneath this domain as $\int_{-2}^{2}\int_{-2}^{2} f(x,y)\,dydx$
### Triple integral
Computes the triple integral $\int_{x_1}^{x_2}\int_{y_1}^{y_2}\int_{z_1}^{z_2}f(x,y,z)\,dzdydx$
### Flux / surface integral
Computes the flux of a vector field $\vec f$ through a given surface $S$ where the surface is parametrized
as $\vec r(x,y) = (r_1, r_2, r_3)$ with $x \in [x_1, x_2], y \in [y_1, y_2]$ and the vector field
is $\vec f(x,y,z)$. Computed as $\int_{x_1}^{x_2}\int_{y_1}^{y_2} \vec f \cdot \vec n\,dydx$
### Line integral
Computes the integral along the curve $\vec r(t)$ from $t_1$ to $t_2$
through the vector field $\vec f(x,y,z)$. Computed as $\int_{t_1}^{t_2}\vec f(\vec r(t))\cdot r'(t)\,dt$
## Examples
### Flux
The `compute_flux()` function given
`cos(x)*sin(y), sin(x)*sin(y),cos(y), 0, 2*pi, 0, pi, x^2, z, y+z` should output
```
Flux:
-4.18879 with absolute error < 6.8e-05
Surface area:
12.56637 with absolute error < 1.4e-13
```
### Line integral
The `line_int()` function given `t, t^2, 0, 0, 4, y, z, x` should output
```
Line integral:
21.33333 with absolute error < 2.4e-13
```
### 3D graph, double integral
The `three_d()` function given `x^2 + y^2` should output
```
Area under the curve:
42.66667 with absolute error < 4.7e-13
```
and generate a nice paraboloid:

<img src="paraboloidexample.jpg" width="200" />

### Triple integral
The `triple_int()` function given `x^2 + y^2 + z^2, 0, 2, 0, 2, 0, 2` should output
```
Triple integral:
32 with absolute error < 3.6e-13
```
Thank you for reading this far, I spent more time on this README than the actual program. Feel
free to [contact me](mailto:ribru17@gmail.com) if you find any issues.