function [A,E,iter] = inexact_alm_qrpca(X,lambda,tol,maxiter)
%% inexact_alm_qrpca.m
% Quaternionic Robust Principal Component Analysis
%   solve min |A|_*+lambda|E|_1 s.t. X = A+E
%   using the inexact augmented Lagrangian method (IALM)
% ----------------------------------
% Tak-Shing Chan 16-Jul-2015
% takshingchan@gmail.com
% Copyright: Music and Audio Computing Lab, Academia Sinica, Taiwan
%%

[m,n] = size(X);

% initialization
A = zeros(m,n);
X_2 = svds(adjoint(X,'complex'),1,'L');
X_inf = norm(X(:),inf);
X_fro = norm(X(:));

% parameters from Lin et al. (2009; can be tuned)
mu = 1.25/X_2;
Y = X/max(X_2,X_inf/lambda);
rho = 1.5;

for iter = 1:maxiter
    %% update E
    E = X-A+Y/mu;
    E = max(1-(lambda/mu)./abs(E),0).*E;

    %% update A
    [U,S,V] = svd(adjoint(X-E+Y/mu,'complex'),'econ');
    S = diag(S)-1/mu;
    r = length(find(S>0));
    A = internal_unadjoint(U(:,1:r)*diag(S(1:r))*V(:,1:r)');

    R = X-A-E;

    Y = Y+mu*R;
    mu = rho*mu;

    %% check for convergence
    if norm(R(:))/X_fro<tol
        return
    end
end
disp('Maximum iterations exceeded');

% ----------------------------------
function B = internal_unadjoint(A)
% Cannot use unadjoint(A) here because a biquaternion matrix may result.

[m,n] = size(A);

A11 = A(1:m/2,1:n/2);
A12 = A(1:m/2,n/2+1:n);
A21 = A(m/2+1:m,1:n/2);
A22 = A(m/2+1:m,n/2+1:n);

B = quaternion(real((A11+A22)/2),real((A11-A22)/2i),...
               real((A12-A21)/2),real((A12+A21)/2i));
