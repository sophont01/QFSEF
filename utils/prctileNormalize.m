function I = prctileNormalize(I,mx,mn)
if (nargin<3)
    mx = 99.9;
    mn = 0.1;
end
maxThr = prctile(I(:),mx);
minThr = prctile(I(:),mn);
I(I > maxThr ) = maxThr;
I(I < minThr ) = minThr;
end
