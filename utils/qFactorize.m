function[iA, iE] = qFactorize(I,k,Iname)
narginchk(2,3);
if nargin<3, Iname=''; end

[m,n,~] = size(I);
w = zeros(m*n,1);
x = I(:,:,1); x = x(:);
y = I(:,:,2); y = y(:);
z = I(:,:,3); z = z(:);
qI = quaternion( w, x, y, z );

iA = cell(numel(k),1);
iE = cell(numel(k),1);
T = qI;
if ~isempty(Iname),  fprintf('Processing %s | Factorizing ',Iname); end
for i=1:numel(k)
    [A,E] = inexact_alm_qrpca(T, k(i)/sqrt(m*n), 1e-7, 1000);    fprintf('..%d',i);
    T = A;
    
    Ax = reshape(A.x, [m,n]);     Ay = reshape(A.y, [m,n]);     Az = reshape(A.z, [m,n]);
    Ex = reshape(E.x, [m,n]);     Ey = reshape(E.y, [m,n]);     Ez = reshape(E.z, [m,n]);
    A   = cat(3,Ax,Ay,Az);
    E   = cat(3,Ex,Ey,Ez);
    iA{i} = A;
    iE{i} = E;

    [mn,mm,mx] = showRange(A,false);
    if (mm==mx)&&(mx==0)
        break; 
    end
end
fprintf(' | \n');
end