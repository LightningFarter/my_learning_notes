# Interactive Computer Graphics — Open-Book Notes

> Markdown + GitHub math. No examples. Symbols are local unless defined.

## 0. Scope

Interactive computer graphics maps descriptions/models to images through a pipeline:

$$
\text{model} \to \text{world} \to \text{eye/view} \to \text{clip} \to \text{NDC} \to \text{viewport} \to \text{raster} \to \text{fragment} \to \text{framebuffer}.
$$

Core topics: WebGL/GLSL, raster primitives, affine/projective transformations, 3D viewing/projection/clipping, visibility, illumination/shading, interpolation, texture/environment/bump mapping, antialiasing, volume rendering, ray tracing/radiosity, curves/surfaces, GPU concepts.

---

## 1. Computer Graphics Vocabulary

### 1.1 Graphics vs. Vision vs. Image Processing

$$
\begin{array}{c|cc}
& \text{output description} & \text{output image}\\ \hline
\text{input description} & - & \text{computer graphics}\\
\text{input image} & \text{computer vision / pattern recognition} & \text{image processing}
\end{array}
$$

Computer graphics synthesizes images from models.

### 1.2 Interactive Graphics

Interactive graphics requires low-latency feedback:

$$
\Delta t_{\text{input}\to\text{image}} \ll 1\text{ s},\qquad f_{\text{frame}} \in [30,120+]\text{ Hz}.
$$

GUI: interactive image-based interface.  VR: rendered world replaces visual world.  AR: rendered objects registered into real view.

### 1.3 Pixel, Framebuffer, Color

$$
\text{screen}=\{0,\dots,W-1\}\times\{0,\dots,H-1\}.
$$

$$
\text{framebuffer}: (x,y)\mapsto (R,G,B,A,z,\ldots).
$$

Color encodings:

$$
\begin{aligned}
\text{indexed }8\text{-bit}&: 2^8=256\text{ indices},\\
\text{true color }24\text{-bit}&: R,G,B\in\{0,\\dots,255\},\\
\text{RGBA }32\text{-bit}&: (R,G,B,A),\quad 8\text{ bits/channel}.
\end{aligned}
$$

Dithering / halftoning approximates unavailable color by spatial distribution:

$$
\bar C_{\Omega}=\frac{1}{|\Omega|}\sum_{p\in\Omega} C_p \approx C^*.
$$

---

## 2. WebGL / GLSL / Shader Model

### 2.1 WebGL Rendering Model

WebGL is shader-based: every application supplies at least

$$
\text{vertex shader},\qquad \text{fragment shader}.
$$

Vertex shader:

$$
(v_i,\text{attributes},\text{uniforms})\mapsto (\texttt{gl\_Position},\text{varyings/out}).
$$

Fragment shader:

$$
(\text{interpolated varyings/in},\text{uniforms})\mapsto \texttt{gl\_FragColor}\text{ or fragment output}.
$$

### 2.2 GLSL Types

Scalars:

$$
\texttt{int},\quad \texttt{float},\quad \texttt{bool}.
$$

Vectors:

$$
\texttt{vec2},\texttt{vec3},\texttt{vec4},\quad \texttt{ivec*},\quad \texttt{bvec*}.
$$

Matrices:

$$
\texttt{mat2},\texttt{mat3},\texttt{mat4},\qquad \text{column-major storage}.
$$

GLSL has no pointers. Structs, vectors, and matrices are passable/copyable values.

### 2.3 Shader Qualifiers

$$
\begin{array}{c|c|c}
\text{qualifier} & \text{frequency} & \text{role}\\ \hline
\texttt{attribute}/\texttt{in} & \text{per vertex} & \text{vertex input}\\
\texttt{uniform} & \text{per primitive/draw/application state} & \text{constant in shader invocation}\\
\texttt{varying}/\texttt{out}\to\texttt{in} & \text{per vertex}\to\text{per fragment} & \text{rasterizer interpolation}
\end{array}
$$

Rasterizer interpolation:

$$
q_f=\sum_i \lambda_i q_i,
\qquad \sum_i\lambda_i=1.
$$

### 2.4 Attribute and Uniform Binding

Buffer data path:

$$
\text{CPU array}\to\text{GPU buffer}\to\text{attribute pointer}\to\text{vertex shader input}.
$$

Uniform data path:

$$
\text{CPU value}\to\text{uniform location}\to\text{shader uniform}.
$$

---

## 3. Vectors, Points, Planes, Homogeneous Coordinates

### 3.1 Points vs. Vectors

Homogeneous point:

$$
P=(x,y,z,1)^T.
$$

Homogeneous vector/direction:

$$
v=(x,y,z,0)^T.
$$

Affine combination of points:

$$
P=\sum_i \alpha_i P_i,\qquad \sum_i\alpha_i=1.
$$

Vector combination:

$$
v=\sum_i \beta_i v_i.
$$

### 3.2 Dot, Cross, Norm

$$
a\cdot b=\sum_i a_i b_i=\|a\|\|b\|\cos\theta.
$$

$$
a\times b=\begin{bmatrix}
a_yb_z-a_zb_y\\
a_zb_x-a_xb_z\\
a_xb_y-a_yb_x
\end{bmatrix},
\qquad \|a\times b\|=\|a\|\|b\|\sin\theta.
$$

Unit vector:

$$
\hat v=\frac{v}{\|v\|}.
$$

### 3.3 Plane

$$
\pi: Ax+By+Cz+D=0,
\qquad n=(A,B,C)^T.
$$

Homogeneous plane:

$$
\pi=(A,B,C,D)^T,
\qquad \pi^T P=0.
$$

Point-plane signed distance:

$$
d(P,\pi)=\frac{n\cdot p+D}{\|n\|}.
$$

### 3.4 Line and Segment

$$
P(t)=P_0+t(P_1-P_0),\qquad t\in[0,1].
$$

Line-plane intersection:

$$
t^*=-\frac{\pi^TP_0}{\pi^T(P_1-P_0)},
\qquad P^*=P(t^*).
$$

### 3.5 Homogeneous Coordinates

Equivalent coordinates:

$$
(x,y,z,w)^T\sim (\alpha x,\alpha y,\alpha z,\alpha w)^T,
\quad \alpha\ne0.
$$

Perspective divide:

$$
(x,y,z,w)^T\mapsto \left(\frac{x}{w},\frac{y}{w},\frac{z}{w}\right)^T.
$$

---

## 4. Geometric Transformations

### 4.1 Affine Matrix

$$
M=\begin{bmatrix}
A&t\\
0^T&1
\end{bmatrix},
\qquad P'=MP.
$$

Affine transformations preserve collinearity and parallelism, not necessarily length or angle.

### 4.2 Translation

$$
T(d_x,d_y,d_z)=
\begin{bmatrix}
1&0&0&d_x\\
0&1&0&d_y\\
0&0&1&d_z\\
0&0&0&1
\end{bmatrix}.
$$

### 4.3 Scaling / Reflection

$$
S(s_x,s_y,s_z)=
\begin{bmatrix}
s_x&0&0&0\\
0&s_y&0&0\\
0&0&s_z&0\\
0&0&0&1
\end{bmatrix}.
$$

Reflection is scaling with one or more negative scale factors.

### 4.4 Rotation

$$
R_x(\theta)=
\begin{bmatrix}
1&0&0&0\\
0&\cos\theta&-\sin\theta&0\\
0&\sin\theta&\cos\theta&0\\
0&0&0&1
\end{bmatrix}.
$$

$$
R_y(\theta)=
\begin{bmatrix}
\cos\theta&0&\sin\theta&0\\
0&1&0&0\\
-\sin\theta&0&\cos\theta&0\\
0&0&0&1
\end{bmatrix}.
$$

$$
R_z(\theta)=
\begin{bmatrix}
\cos\theta&-\sin\theta&0&0\\
\sin\theta&\cos\theta&0&0\\
0&0&1&0\\
0&0&0&1
\end{bmatrix}.
$$

Rotation about fixed point $p_f$:

$$
M=T(p_f)R(\theta)T(-p_f).
$$

### 4.5 Shear

2D shear:

$$
H_x(a)=\begin{bmatrix}1&a&0\\0&1&0\\0&0&1\end{bmatrix},
\qquad x'=x+ay.
$$

3D shear in $x,y$ by $z$:

$$
H_{xy}(h_x,h_y)=
\begin{bmatrix}
1&0&h_x&0\\
0&1&h_y&0\\
0&0&1&0\\
0&0&0&1
\end{bmatrix}.
$$

### 4.6 Concatenation and CTM

Column-vector convention:

$$
q=CBAp=C(B(Ap)).
$$

Most recently specified transformation is applied first when matrices are postmultiplied:

$$
C\leftarrow CM,
\qquad p'=Cp.
$$

### 4.7 Normal Transformation

Plane invariance:

$$
N^TP=0,
\quad P'=MP,
\quad (N')^TP'=0.
$$

Then

$$
(N')^TMP=0=N^TP
\Rightarrow M^TN'=N
\Rightarrow N'=M^{-T}N.
$$

For affine $M=\begin{bmatrix}A&t\\0&1\end{bmatrix}$:

$$
n'=A^{-T}n.
$$

Normalize after transformation:

$$
\hat n'=\frac{A^{-T}n}{\|A^{-T}n\|}.
$$

---

## 5. Viewing and Projection

### 5.1 Viewing Components

Viewing has three matrix-level components:

$$
\text{camera position/orientation}\to M_{\text{modelview}},
\quad \text{lens}\to M_{\text{projection}},
\quad \text{view volume}\to \text{clipping}.
$$

OpenGL default camera: eye at origin, looking down $-z$, identity model-view, identity projection, cube view volume.

### 5.2 Classical Projection Taxonomy

Planar geometric projections preserve lines:

$$
\text{projectors}=\begin{cases}
\text{parallel} & \text{parallel projection},\\
\text{converge at center of projection} & \text{perspective projection}.
\end{cases}
$$

Parallel projection:

$$
\text{orthographic}\cup\text{oblique};
\qquad \text{orthographic}\supset\text{multiview},\text{axonometric}.
$$

Axonometric:

$$
\begin{array}{c|c}
\text{isometric} & 3\text{ equal foreshortenings}\\
\text{dimetric} & 2\text{ equal foreshortenings}\\
\text{trimetric} & 0\text{ equal foreshortenings}
\end{array}
$$

Perspective:

$$
\begin{array}{c|c}
\text{one-point} & 1\text{ principal vanishing point}\\
\text{two-point} & 2\text{ principal vanishing points}\\
\text{three-point} & 3\text{ principal vanishing points}
\end{array}
$$

Perspective is the finite-COP case; parallel is the COP-at-infinity limit.

### 5.3 LookAt / View Frame

Given eye $e$, target $a$, up vector $v_{up}$:

$$
w=\frac{e-a}{\|e-a\|},
\qquad u=\frac{v_{up}\times w}{\|v_{up}\times w\|},
\qquad v=w\times u.
$$

View matrix:

$$
M_v=
\begin{bmatrix}
u_x&u_y&u_z&-u\cdot e\\
v_x&v_y&v_z&-v\cdot e\\
w_x&w_y&w_z&-w\cdot e\\
0&0&0&1
\end{bmatrix}.
$$

VRP/VPN/VUP notation:

$$
\text{VRP}=\text{view reference point},\quad
\text{VPN}=\text{view-plane normal},\quad
\text{VUP}=\text{view-up vector}.
$$

### 5.4 Perspective Projection: Pinhole

Eye at origin, projection plane $z=d$:

$$
x_p=\frac{d x}{z},
\qquad y_p=\frac{d y}{z}.
$$

Homogeneous matrix form:

$$
M_{per}=\begin{bmatrix}
1&0&0&0\\
0&1&0&0\\
0&0&1&0\\
0&0&1/d&0
\end{bmatrix},
$$

$$
M_{per}(x,y,z,1)^T=(x,y,z,z/d)^T,
$$

$$
\left(\frac{X}{W},\frac{Y}{W},\frac{Z}{W}\right)
=\left(\frac{dx}{z},\frac{dy}{z},d\right).
$$

Eye at $(0,0,-d)$, projection plane $z=0$:

$$
X_p=\frac{x}{1+z/d},
\qquad Y_p=\frac{y}{1+z/d}.
$$

### 5.5 Orthographic Projection

For view volume $[l,r]\times[b,t]\times[n,f]$:

$$
M_{ortho}=\begin{bmatrix}
\frac{2}{r-l}&0&0&-\frac{r+l}{r-l}\\
0&\frac{2}{t-b}&0&-\frac{t+b}{t-b}\\
0&0&-\frac{2}{f-n}&-\frac{f+n}{f-n}\\
0&0&0&1
\end{bmatrix}.
$$

### 5.6 Perspective Frustum Matrix

For frustum $[l,r]\times[b,t]$ at near $n$ and far $f$:

$$
M_{frustum}=\begin{bmatrix}
\frac{2n}{r-l}&0&\frac{r+l}{r-l}&0\\
0&\frac{2n}{t-b}&\frac{t+b}{t-b}&0\\
0&0&-\frac{f+n}{f-n}&-\frac{2fn}{f-n}\\
0&0&-1&0
\end{bmatrix}.
$$

For field of view:

$$
t=n\tan\frac{\theta_y}{2},\quad b=-t,
\quad r=a t,
\quad l=-r,
$$

where $a=\text{aspect}=W/H$.

### 5.7 Viewport Transform

NDC $(x_n,y_n,z_n)\in[-1,1]^3$ to window:

$$
x_w=x_0+\frac{W}{2}(x_n+1),
\qquad y_w=y_0+\frac{H}{2}(y_n+1),
$$

$$
z_w=\frac{f_d-n_d}{2}z_n+\frac{f_d+n_d}{2}.
$$

---

## 6. Clipping

### 6.1 Purpose

Clipping restricts primitives to the view window/volume before rasterization:

$$
P\in V \iff \forall i,\; \pi_i^T P\ge0.
$$

Curves/text are usually converted to lines/polygons before clipping.

### 6.2 2D Cohen--Sutherland Line Clipping

Window: $x_{min}\le x\le x_{max}$, $y_{min}\le y\le y_{max}$.

Outcode:

$$
\begin{aligned}
b_0&=[y>y_{max}],\\
b_1&=[y<y_{min}],\\
b_2&=[x>x_{max}],\\
b_3&=[x<x_{min}].
\end{aligned}
$$

Acceptance/rejection:

$$
(c_0\lor c_1)=0\Rightarrow \text{accept},
$$

$$
(c_0\land c_1)\ne0\Rightarrow \text{reject},
$$

otherwise intersect endpoint with boundary selected by a set bit.

Line intersection formulas for $P(t)=P_0+t(P_1-P_0)$:

$$
t_{x=x_b}=\frac{x_b-x_0}{x_1-x_0},
\qquad t_{y=y_b}=\frac{y_b-y_0}{y_1-y_0}.
$$

Algorithm:

```text
while true:
  c0 = outcode(P0); c1 = outcode(P1)
  if (c0 | c1) == 0: accept
  else if (c0 & c1) != 0: reject
  else:
    c = nonzero(c0,c1)
    P = intersection with boundary indicated by c
    replace endpoint whose outcode was c by P
```

### 6.3 3D Cohen--Sutherland Extension

Use 6-bit outcode against six planes.

Canonical perspective volume form in slides:

$$
-z\le x\le z,
\qquad z\le y\le -z,
\qquad -1\le z\le -z_{min}.
$$

Equivalent bit tests given by plane inequalities:

$$
\begin{aligned}
&y>-z,\quad y<z,\quad x>-z,\quad x<z,\\
&z<-1,
\quad z>-z_{min}.
\end{aligned}
$$

General 3D line-plane clipping:

$$
t^*=-\frac{\pi^TP_0}{\pi^T(P_1-P_0)}.
$$

### 6.4 Polygon Clipping: Sutherland--Hodgman

For each clip plane/edge, process polygon edge $(S,E)$:

$$
\operatorname{inside}(P): \pi^TP\ge0.
$$

```text
for each clip plane π:
  output = []
  for each directed edge S -> E of input polygon:
    if inside(S) and inside(E): append E
    if inside(S) and not inside(E): append intersect(S,E,π)
    if not inside(S) and inside(E): append intersect(S,E,π), append E
    if not inside(S) and not inside(E): append nothing
  input = output
```

### 6.5 Perspective Normalization

Normalize arbitrary view volume to canonical view volume:

$$
N_{per}=S_{per}\,SH_{per}\,T(-PRP)\,R\,T(-VRP).
$$

Then clipping uses fixed inequalities; projection becomes standardized.

---

## 7. Rasterization and Interpolation

### 7.1 Scan Conversion

Continuous primitive $\Omega\subset\mathbb R^2$ to pixels:

$$
\text{covered}(i,j)\iff A(\Omega\cap P_{ij})>0.
$$

Point sampling:

$$
C_{ij}=C(i+1/2,j+1/2).
$$

Area sampling:

$$
C_{ij}=\frac{1}{A(P_{ij})}\int_{P_{ij}} C(x,y)\chi_{\Omega}(x,y)\,dx\,dy.
$$

### 7.2 Line Rasterization Core

Implicit line:

$$
F(x,y)=ax+by+c=0.
$$

Midpoint decision uses sign of $F$ at candidate midpoint.

DDA form:

$$
\Delta x=x_1-x_0,
\quad \Delta y=y_1-y_0,
\quad m=\frac{\Delta y}{\Delta x},
\quad y_{k+1}=y_k+m.
$$

Bresenham integer decision for $0\le m\le1$:

$$
d_0=2\Delta y-\Delta x,
$$

$$
\begin{cases}
E: d_{k+1}=d_k+2\Delta y,\\
NE: d_{k+1}=d_k+2(\Delta y-\Delta x).
\end{cases}
$$

### 7.3 Triangle Barycentric Coordinates

For triangle $P_1,P_2,P_3$:

$$
P=\lambda_1P_1+\lambda_2P_2+\lambda_3P_3,
\qquad \sum_i\lambda_i=1.
$$

Area form:

$$
\lambda_i=\frac{A_i}{A},
$$

where $A_i$ is opposite subtriangle area.

Matrix form:

$$
\begin{bmatrix}x\\y\\1\end{bmatrix}
=
\begin{bmatrix}
x_1&x_2&x_3\\
y_1&y_2&y_3\\
1&1&1
\end{bmatrix}
\begin{bmatrix}\lambda_1\\\lambda_2\\\lambda_3\end{bmatrix}.
$$

Attribute interpolation:

$$
q(P)=\sum_i\lambda_iq_i.
$$

Perspective-correct interpolation:

$$
q(P)=\frac{\sum_i \lambda_i\frac{q_i}{w_i}}{\sum_i\lambda_i\frac{1}{w_i}}.
$$

### 7.4 Gouraud Plane Interpolation

Triangle vertices $(x_i,y_i,R_i)$. Let

$$
(x,y)=(x_1,y_1)+s(x_2-x_1,y_2-y_1)+t(x_3-x_1,y_3-y_1).
$$

Then

$$
R(x,y)=R_1+s(R_2-R_1)+t(R_3-R_1).
$$

Since $s=A_1x+B_1y+C_1$, $t=A_2x+B_2y+C_2$:

$$
R(x,y)=Ax+By+C,
$$

$$
A=A_1(R_2-R_1)+A_2(R_3-R_1),
$$

$$
B=B_1(R_2-R_1)+B_2(R_3-R_1),
$$

$$
C=C_1(R_2-R_1)+C_2(R_3-R_1)+R_1.
$$

Same equations apply independently to $G,B,z,\alpha,u,v,n$.

---

## 8. Illumination and Shading

### 8.1 Vectors

$$
L=\text{unit direction from point to light},
\quad V=\text{unit direction from point to eye},
\quad N=\text{unit surface normal}.
$$

Reflection vector:

$$
R=2(N\cdot L)N-L.
$$

Halfway vector:

$$
H=\frac{L+V}{\|L+V\|}.
$$

### 8.2 Ambient Term

$$
I_a=k_a L_a O_d.
$$

Channel-wise:

$$
I_{a,c}=k_a L_{a,c}O_{d,c},
\quad c\in\{r,g,b\}.
$$

### 8.3 Lambert Diffuse Term

$$
I_d=f_{att}k_d L_p O_d\max(0,N\cdot L).
$$

Distance attenuation:

$$
f_{att}=\frac{1}{d_L^2}
\quad \text{or}\quad
f_{att}=\frac{1}{a+bd_L+cd_L^2}.
$$

### 8.4 Phong Specular Term

$$
I_s=f_{att}k_s L_p\max(0,R\cdot V)^\alpha.
$$

Blinn--Phong approximation:

$$
I_s=f_{att}k_s L_p\max(0,N\cdot H)^\alpha.
$$

### 8.5 Phong Reflection Model

For lights $j=1,\dots,m$:

$$
I= k_aL_aO_d+
\sum_{j=1}^m f_{att,j}L_{p,j}
\left[k_dO_d\max(0,N\cdot L_j)+k_s\max(0,R_j\cdot V)^\alpha\right].
$$

Blinn form:

$$
I= k_aL_aO_d+
\sum_{j=1}^m f_{att,j}L_{p,j}
\left[k_dO_d\max(0,N\cdot L_j)+k_s\max(0,N\cdot H_j)^\alpha\right].
$$

Clamp/scale:

$$
C_{out}=\operatorname{clamp}(I,0,1),
\qquad C_{8bit}=\lfloor255C_{out}\rceil.
$$

### 8.6 Shading Modes

Flat shading:

$$
N_f=\frac{(P_2-P_1)\times(P_3-P_1)}{\|(P_2-P_1)\times(P_3-P_1)\|},
\qquad C(P)=\operatorname{light}(N_f,P_f).
$$

Gouraud shading:

$$
C_i=\operatorname{light}(N_i,P_i),
\qquad C(P)=\sum_i\lambda_iC_i.
$$

Phong shading:

$$
N(P)=\frac{\sum_i\lambda_iN_i}{\left\|\sum_i\lambda_iN_i\right\|},
\qquad C(P)=\operatorname{light}(N(P),P).
$$

Computational order:

$$
\text{flat}<\text{Gouraud}<\text{Phong}.
$$

Quality order for specular highlights:

$$
\text{Phong}>\text{Gouraud}>\text{flat}.
$$

### 8.7 BRDF / BSSRDF / BSDF

BRDF:

$$
f_r(\omega_i,\omega_o)=\frac{dL_o(\omega_o)}{dE_i(\omega_i)}
=\frac{dL_o(\omega_o)}{L_i(\omega_i)\cos\theta_i\,d\omega_i}.
$$

Rendering equation:

$$
L_o(x,\omega_o)=L_e(x,\omega_o)+
\int_{\Omega^+} f_r(x,\omega_i,\omega_o)L_i(x,\omega_i)(n\cdot\omega_i)\,d\omega_i.
$$

BSSRDF:

$$
S(x_i,\omega_i,x_o,\omega_o),
$$

non-local scattering: incident point may differ from exit point.

BSDF:

$$
f_s=f_r+f_t,
$$

reflection plus transmission.

---

## 9. Visible-Surface and Visible-Line Determination

### 9.1 Visibility Problem

For pixel ray $r(t)=e+td$:

$$
P^*=\arg\min_{P\in\mathcal S\cap r,\;t>0} t.
$$

Visible color:

$$
C=C(P^*).
$$

### 9.2 Painter / Depth Sort

Sort polygons by decreasing depth; draw far-to-near. Failure cases: cyclic overlap, mutual penetration, ambiguous depth intervals.

Depth-sort tests:

$$
z_{max}(A)<z_{min}(B)\Rightarrow A\text{ behind }B.
$$

If depth intervals overlap, use screen overlap and plane-side tests; split polygons if necessary.

### 9.3 BSP Tree

BSP construction recursively partitions space by polygon planes.

For viewer position $E$ and node plane $\pi$:

$$
\operatorname{side}(E)=\operatorname{sign}(\pi^TE).
$$

Traversal:

```text
BSP(node, eye):
  if node == null: return
  if eye in front(node.plane):
    BSP(node.back, eye)
    draw(node.polygon)
    BSP(node.front, eye)
  else:
    BSP(node.front, eye)
    draw(node.polygon)
    BSP(node.back, eye)
```

### 9.4 Z-Buffer Algorithm

Initialize:

$$
Z(x,y)=+\infty,
\qquad C(x,y)=C_{bg}.
$$

For each rasterized fragment $f$:

$$
\text{if }z_f<Z(x_f,y_f):
\quad Z(x_f,y_f)\leftarrow z_f,
\quad C(x_f,y_f)\leftarrow C_f.
$$

Algorithm:

```text
for all pixels p:
  Z[p] = +∞
  Color[p] = background
for each primitive T:
  rasterize T
  for each covered pixel p:
    z = interpolate_depth(T,p)
    if z < Z[p]:
      Z[p] = z
      Color[p] = shade_or_interpolate(T,p)
```

Properties:

$$
\text{time}=O(N_{fragments}),
\qquad \text{memory}=O(W H).
$$

### 9.5 Scan-Line Visibility

Process one scan line at a time; maintain active edge table and active polygon list; resolve nearest surface along intervals.

### 9.6 Area Subdivision

Divide screen region $R$ until visibility is decidable:

$$
R\to R_1\cup R_2\cup R_3\cup R_4.
$$

Stop if one polygon covers $R$ and is nearest; or $R$ is pixel-sized.

### 9.7 Visible-Line Determination

Use visible-surface result, depth cueing, or Appel quantitative invisibility.

Quantitative invisibility:

$$
QI(P)=\#\{\text{front-facing occluding surfaces between eye and }P\}.
$$

$$
QI(P)=0\Rightarrow P\text{ visible}.
$$

QI changes when crossing contour lines.

Depth cueing:

$$
I(z)=I_{near}+\frac{z-z_{near}}{z_{far}-z_{near}}(I_{far}-I_{near}).
$$

---

## 10. Aliasing and Antialiasing

### 10.1 Sampling

Aliasing occurs when sampled signal exceeds Nyquist frequency:

$$
f_s<2f_{max}.
$$

Raster point sample:

$$
C_{ij}=C(i+1/2,j+1/2).
$$

### 10.2 Area Averaging

Pixel coverage:

$$
\alpha_{ij}=\frac{A(P_{ij}\cap\Omega)}{A(P_{ij})}.
$$

Composited color:

$$
C_{ij}=\alpha_{ij}C_{fg}+(1-\alpha_{ij})C_{bg}.
$$

Supersampling:

$$
C_{ij}=\frac1{n}\sum_{k=1}^n C(x_{ijk},y_{ijk}).
$$

### 10.3 Polygon Aliasing

Multiple polygons per pixel require compositing by coverage and visibility:

$$
C_{ij}=\sum_k \alpha_k C_k,
\qquad \sum_k\alpha_k\le1.
$$

---

## 11. Texture, Environment, and Bump Mapping

### 11.1 Mapping Coordinates

Coordinate chain:

$$
(u,v)\leftrightarrow \text{texture},
\quad (s,t)\leftrightarrow \text{parametric surface},
\quad (x,y,z)\leftrightarrow \text{object/world},
\quad (x_w,y_w)\leftrightarrow \text{window}.
$$

Texture mapping assigns image data to surface points:

$$
C(P)=T(u(P),v(P)).
$$

### 11.2 Forward vs. Backward Mapping

Forward:

$$
(u,v)\mapsto P\mapsto (x_w,y_w).
$$

Backward:

$$
(x_w,y_w)\mapsto P\mapsto (u,v).
$$

Backward mapping avoids holes in image space.

### 11.3 Point Sampling and Filtering

Nearest:

$$
T(u,v)=T[\operatorname{round}(uW),\operatorname{round}(vH)].
$$

Bilinear texture filtering:

$$
T(u,v)=(1-a)(1-b)T_{00}+a(1-b)T_{10}+(1-a)bT_{01}+abT_{11}.
$$

Area averaging / prefiltering:

$$
T_{pixel}=\frac{1}{A(\Omega_{uv})}\int_{\Omega_{uv}}T(u,v)\,du\,dv.
$$

Mipmapping:

$$
\ell=\log_2 \rho,
\qquad T=\operatorname{lerp}(T_{\lfloor\ell\rfloor},T_{\lceil\ell\rceil},\ell-\lfloor\ell\rfloor).
$$

### 11.4 Parametric Cylinder Mapping

$$
P(\theta,y)=(r\cos\theta,y,r\sin\theta),
$$

$$
u=\frac{\theta}{2\pi},
\qquad v=\frac{y-y_{min}}{y_{max}-y_{min}}.
$$

### 11.5 Parametric Sphere Mapping

$$
P(\theta,\phi)=
(r\sin\phi\cos\theta,
 r\cos\phi,
 r\sin\phi\sin\theta),
$$

$$
u=\frac{\theta}{2\pi},
\qquad v=\frac{\phi}{\pi}.
$$

Distortion/seam placement is unavoidable for sphere-to-rectangle maps.

### 11.6 Environment Mapping

Perfect reflection direction:

$$
R=2(N\cdot V)N-V.
$$

Then

$$
C(P)=E(R),
$$

where $E$ is cube map, sphere map, or other environment parameterization.

### 11.7 Bump Mapping

Height field $h(u,v)$ perturbs normal, not geometry.

Surface derivatives:

$$
P_u=\frac{\partial P}{\partial u},
\qquad P_v=\frac{\partial P}{\partial v},
\qquad N=\frac{P_u\times P_v}{\|P_u\times P_v\|}.
$$

Perturbed surface:

$$
P'(u,v)=P(u,v)+h(u,v)N(u,v).
$$

First-order perturbed normal:

$$
N'\propto N-h_uP_u-h_vP_v,
\qquad \hat N'=\frac{N'}{\|N'\|}.
$$

---

## 12. Transparency and Compositing

### 12.1 Source-over Alpha

For source $S$ over destination $D$:

$$
C'=\alpha_s C_s+(1-\alpha_s)C_d,
$$

$$
\alpha'=\alpha_s+(1-\alpha_s)\alpha_d.
$$

Slide convention for splatting/back-to-front:

$$
C_d'=(1-\alpha_s)C_d+
\alpha_s C_s,
$$

$$
\alpha_d'=(1-\alpha_s)\alpha_d+
\alpha_s.
$$

### 12.2 Volume Ray Accumulation

For voxel sample $x_i$:

$$
C_{out}=C_{in}(1-\alpha(x_i))+c(x_i)\alpha(x_i).
$$

Front-to-back accumulated transmittance:

$$
C=\sum_{i=1}^n T_i\alpha_i c_i,
\qquad T_i=\prod_{j<i}(1-\alpha_j).
$$

Opacity:

$$
\alpha=1-\prod_i(1-\alpha_i).
$$

---

## 13. Volume Rendering and Marching Cubes

### 13.1 Scalar Volume

Sampled scalar field:

$$
D(i,j,k)\approx D(x_i,y_j,z_k).
$$

Volume rendering computes a 2D projection of a colored semitransparent 3D field.

### 13.2 Gradient Normal

Central differences:

$$
G_x(i,j,k)=\frac{D(i+1,j,k)-D(i-1,j,k)}{2},
$$

$$
G_y(i,j,k)=\frac{D(i,j+1,k)-D(i,j-1,k)}{2},
$$

$$
G_z(i,j,k)=\frac{D(i,j,k+1)-D(i,j,k-1)}{2}.
$$

Normal:

$$
N=\frac{\nabla D}{\|\nabla D\|}.
$$

### 13.3 Marching Cubes

Given isovalue $\sigma$ and cube vertices $v_i$:

$$
b_i=[D(v_i)\ge\sigma],
\qquad code=\sum_{i=0}^{7}b_i2^i.
$$

For edge $(a,b)$ crossing isosurface:

$$
t=\frac{\sigma-D(a)}{D(b)-D(a)},
\qquad p=a+t(b-a).
$$

Algorithm:

```text
for each voxel cube:
  compute 8-bit case index from signs D(v_i)-σ
  lookup intersected edges and triangle topology
  interpolate edge vertices
  compute/interpolate normals from ∇D
  emit triangles
```

### 13.4 Ray Casting for Volume

Ray:

$$
r(t)=e+td.
$$

Continuous emission-absorption approximation:

$$
C=\int_{t_0}^{t_1} T(t)\,\tau(t)c(t)\,dt,
\qquad
T(t)=\exp\left(-\int_{t_0}^{t}\tau(s)\,ds\right).
$$

Discrete form equals front-to-back alpha compositing.

---

## 14. Global Rendering

### 14.1 Recursive Ray Tracing

Primary ray:

$$
r(t)=e+td,
\qquad t>0.
$$

Intersection:

$$
t^*=\min\{t:r(t)\in\mathcal S\}.
$$

Recursive radiance:

$$
L(P,V)=L_{local}(P,V)+k_rL(P,R)+k_tL(P,T).
$$

Reflection:

$$
R=2(N\cdot V)N-V.
$$

Refraction by Snell:

$$
\eta_i\sin\theta_i=\eta_t\sin\theta_t.
$$

Shadow test for light $j$:

$$
\exists t\in(\epsilon,t_L): e_j(t)=P+tL_j\in\mathcal S
\Rightarrow \text{light blocked}.
$$

### 14.2 Radiosity

Diffuse energy balance:

$$
B_i=E_i+\rho_i\sum_{j=1}^n F_{ij}B_j.
$$

Matrix:

$$
(I-RF)B=E.
$$

Form factor properties:

$$
\sum_jF_{ij}=1,
\qquad A_iF_{ij}=A_jF_{ji}.
$$

Progressive refinement: repeatedly shoot unshot radiosity from largest-energy patch.

---

## 15. Curves and Surfaces

### 15.1 Parametric Cubic Curve

$$
Q(t)=(x(t),y(t),z(t)),
\qquad t\in[0,1].
$$

$$
x(t)=a_xt^3+b_xt^2+c_xt+d_x,
$$

$$
y(t)=a_yt^3+b_yt^2+c_yt+d_y,
$$

$$
z(t)=a_zt^3+b_zt^2+c_zt+d_z.
$$

Matrix form:

$$
Q(t)=T M G,
\qquad T=[1\;t\;t^2\;t^3].
$$

### 15.2 Continuity

Geometric continuity:

$$
G^0: Q_1(1)=Q_2(0).
$$

Parametric continuity:

$$
C^k: \frac{d^rQ_1}{dt^r}(1)=\frac{d^rQ_2}{dt^r}(0),\qquad 0\le r\le k.
$$

### 15.3 Cubic Bézier Curve

Control points $p_0,p_1,p_2,p_3$:

$$
Q(t)=(1-t)^3p_0+3t(1-t)^2p_1+3t^2(1-t)p_2+t^3p_3.
$$

Bernstein basis:

$$
B_{i,3}(t)=\binom3i t^i(1-t)^{3-i},
\qquad Q(t)=\sum_{i=0}^3B_{i,3}(t)p_i.
$$

Endpoint/tangent constraints:

$$
Q(0)=p_0,
\quad Q(1)=p_3,
$$

$$
Q'(0)=3(p_1-p_0),
\quad Q'(1)=3(p_3-p_2).
$$

Bézier matrix with $T=[1,t,t^2,t^3]$:

$$
M_B=\begin{bmatrix}
1&0&0&0\\
-3&3&0&0\\
3&-6&3&0\\
-1&3&-3&1
\end{bmatrix},
\qquad Q(t)=T M_B G_B.
$$

### 15.4 Bézier Subdivision: de Casteljau at $t=1/2$

$$
l_0=p_0,
\qquad r_3=p_3,
$$

$$
l_1=\frac12(p_0+p_1),
\qquad r_2=\frac12(p_2+p_3),
$$

$$
m=\frac12(p_1+p_2),
$$

$$
l_2=\frac12(l_1+m),
\qquad r_1=\frac12(m+r_2),
$$

$$
l_3=r_0=\frac12(l_2+r_1).
$$

Subdivision recursively approximates curve by polyline; convex hulls shrink toward curve. Variation diminishing property.

### 15.5 Every Cubic Polynomial as Bézier

If

$$
Q(u)=u^T M_A q=u^T M_B p,
$$

then

$$
p=M_B^{-1}M_Aq.
$$

### 15.6 B-Spline Basis

Knot vector:

$$
T=\{t_0,t_1,\dots,t_m\},
\qquad t_i\le t_{i+1}.
$$

Degree:

$$
p=m-n-1.
$$

Basis recursion:

$$
N_{i,0}(t)=
\begin{cases}
1,&t_i\le t<t_{i+1},\\
0,&\text{otherwise},
\end{cases}
$$

$$
N_{i,p}(t)=
\frac{t-t_i}{t_{i+p}-t_i}N_{i,p-1}(t)+
\frac{t_{i+p+1}-t}{t_{i+p+1}-t_{i+1}}N_{i+1,p-1}(t).
$$

B-spline curve:

$$
C(t)=\sum_{i=0}^nP_iN_{i,p}(t).
$$

### 15.7 Uniform Cubic B-Spline Segment

For local controls $[p_{i-2},p_{i-1},p_i,p_{i+1}]^T$:

$$
P(u)=U M_S G_S,
\qquad U=[1\;u\;u^2\;u^3],
\quad u\in[0,1].
$$

Uniform cubic B-spline basis matrix:

$$
M_S=\frac16
\begin{bmatrix}
1&4&1&0\\
-3&0&3&0\\
3&-6&3&0\\
-1&3&-3&1
\end{bmatrix}.
$$

Endpoint relation between adjacent segments:

$$
P(0)=\frac16(p_{i-2}+4p_{i-1}+p_i),
$$

$$
P'(0)=\frac12(p_i-p_{i-2}).
$$

Cubic B-spline is $C^2$ continuous under uniform knots.

B-spline segment to Bézier controls:

$$
U M_S p=U M_B q
\Rightarrow q=M_B^{-1}M_Sp.
$$

### 15.8 Bézier vs. B-Spline

$$
\begin{array}{c|c|c}
&\text{Bézier}&\text{B-spline}\\\hline
\text{endpoint interpolation}&Q(0)=p_0,Q(1)=p_3&\text{generally no}\\
\text{local control}&\text{global over segment}&\text{local}\\
\text{continuity}&C^1\text{ typical joins}&C^2\text{ cubic uniform}\\
\text{rendering}&\text{subdivision}&\text{convert segments to Bézier or evaluate basis}
\end{array}
$$

### 15.9 Parametric Bicubic Surface / Patch

Surface:

$$
P(s,t)=\begin{bmatrix}1&s&s^2&s^3\end{bmatrix}MGM^T
\begin{bmatrix}1\\t\\t^2\\t^3\end{bmatrix}.
$$

Coordinate-wise:

$$
X(s,t)=S M G_x M^T T^T,
\quad Y(s,t)=S M G_y M^T T^T,
\quad Z(s,t)=S M G_z M^T T^T.
$$

Bézier patch:

$$
P(s,t)=\sum_{i=0}^3\sum_{j=0}^3B_{i,3}(s)B_{j,3}(t)P_{ij}.
$$

Surface normal:

$$
N(s,t)=\frac{P_s\times P_t}{\|P_s\times P_t\|}.
$$

Patch display:

$$
\text{adaptive subdivision until flatness}(P_{ij})<\epsilon,
$$

then triangulate/subdivide to polygons.

### 15.10 Quadric Implicit Surface

General second-degree implicit surface:

$$
f(x,y,z)=ax^2+by^2+cz^2+2dxy+2eyz+2fxz+2gx+2hy+2jz+k=0.
$$

Normal:

$$
N=\frac{\nabla f}{\|\nabla f\|}.
$$

---

## 16. Modeling Methods

3D model sources:

$$
\text{polygon mesh},\quad \text{parametric curves/surfaces},\quad \text{implicit surfaces},\quad \text{revolution},\quad \text{extrusion},\quad \text{digitization/scanning},\quad \text{procedural modeling}.
$$

Surface of revolution:

$$
P(u,\theta)=\big(r(u)\cos\theta,\,y(u),\,r(u)\sin\theta\big).
$$

Extrusion:

$$
P(u,v)=C(u)+v d.
$$

Mesh representation:

$$
G=(V,E,F).
$$

Winged-edge record stores adjacency:

$$
e\mapsto (v_1,v_2,f_L,f_R,e_{Lprev},e_{Lnext},e_{Rprev},e_{Rnext}).
$$

---

## 17. Graphics Pipeline Summary

### 17.1 Standard Pipeline

$$
P_{clip}=M_{proj}M_{view}M_{model}P_{obj}.
$$

Then

$$
P_{ndc}=\left(\frac{x_c}{w_c},\frac{y_c}{w_c},\frac{z_c}{w_c}\right),
$$

then viewport and rasterization.

### 17.2 Primitive Processing

```text
for each object:
  construct model matrix M
  for each vertex P:
    P_world = M_model P
    attributes_world = transform attributes
    P_eye = M_view P_world
    P_clip = M_proj P_eye
  clip primitive in homogeneous clip space
  perspective divide
  viewport map
  rasterize
  interpolate attributes
  shade fragments
  depth/stencil/blend tests
  write framebuffer
```

### 17.3 Homogeneous Clip Space

Typical OpenGL clipping before divide:

$$
-w_c\le x_c\le w_c,
\qquad -w_c\le y_c\le w_c,
\qquad -w_c\le z_c\le w_c.
$$

---

## 18. GPU / Hardware Concepts

GPU: many-core throughput processor for parallel vertex/fragment workloads.

Shader programmability history:

$$
\text{fixed-function pipeline}\to\text{programmable vertex/fragment shaders}\to\text{general GPU compute}.
$$

GPGPU: using GPU for non-graphics parallel workloads.

APU: CPU and GPU integrated on one chip/package.

Deep learning acceleration uses dense linear algebra:

$$
Y=WX+b,
\qquad C=AB,
\qquad \nabla_\theta L.
$$

GPU-friendly work:

$$
\text{many independent elements} + \text{regular memory access} + \text{high arithmetic intensity}.
$$

---

## 19. Search Terms / Exam Index

- affine transformation, homogeneous coordinate, CTM, postmultiply, fixed-point rotation
- normal matrix, inverse transpose, plane transform
- LookAt, VRP, VPN, VUP, PRP, view volume, viewport transform
- orthographic, oblique, axonometric, isometric, dimetric, trimetric
- perspective, one-point/two-point/three-point, vanishing point, perspective divide
- glOrtho, glFrustum, field of view, aspect ratio
- Cohen--Sutherland, outcode, Sutherland--Hodgman, canonical view volume
- barycentric coordinates, bilinear interpolation, perspective-correct interpolation
- Phong reflection model, Blinn halfway vector, ambient/diffuse/specular
- flat shading, Gouraud shading, Phong shading
- BRDF, BSSRDF, BSDF, rendering equation
- painter algorithm, depth sort, BSP tree, Z-buffer, scan-line, area subdivision
- visible line, Appel algorithm, quantitative invisibility, depth cueing
- aliasing, antialiasing, area averaging, supersampling
- texture mapping, backward mapping, point sampling, area averaging, mipmapping
- environment mapping, reflection mapping, bump mapping, normal perturbation
- alpha blending, transparency, splatting, volume compositing
- volume rendering, scalar field, gradient normal, marching cubes, ray casting
- recursive ray tracing, reflection, refraction, shadow ray
- radiosity, form factor, progressive refinement
- Bézier curve, Bernstein basis, de Casteljau subdivision, convex hull
- B-spline, knot vector, basis recursion, cubic uniform matrix, C2 continuity
- bicubic patch, Bézier surface, adaptive subdivision
- polygon mesh, winged-edge, extrusion, revolution, digitizer

