% setting parameters

params.n1 = 15;
params.n2 = 15;
params.min_theta1 = 1;
params.max_theta1 = 3;
params.min_theta2 = 0.1;
params.max_theta2 = 2;


lengthscales = [0,0.5,2,5];
figure(1)
clf

N = length(lengthscales);
for n=1:N
    figure(2*n-1); clf;
    ell = lengthscales(n);
    div = @(x,y) div_kernel_Normal(x,y,ell);
    [X,thetas,parallel_edges] = embed_manifold(params,div);
    draw_results(X,thetas,parallel_edges)

    figure(2*n); clf;
    div = @(x,y) div_sphericalkernel_Normal(x,y,ell);
    [X,thetas,parallel_edges] = embed_manifold(params,div);
    draw_results(X,thetas,parallel_edges)
end