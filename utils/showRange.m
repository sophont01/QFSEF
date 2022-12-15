function [mn,mm,mx] = showRange(M,f)
narginchk(1,2);
nargoutchk(0,3);

mx = max(M(:));
mn = min(M(:));
mm = mean(M(:));

if nargin<2
    fprintf('%0.4f %0.4f %0.4f\n', mn, mm, mx);
elseif f
    fprintf('%0.4f %0.4f %0.4f\n', mn, mm, mx);
else
    ;
end
end
