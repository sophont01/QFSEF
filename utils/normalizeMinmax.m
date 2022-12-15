function[imN] = normalizeMinmax(im,mn,mx)
% narginchk(1,3);
% if (nargin<3)
%     mn = min(im(:));
%     mx = max(im(:));
% end
% imN = (im-mn)./(mx-mn+eps);

narginchk(1,3);
Imn = min(im(:));
Imx = max(im(:));
if (nargin<3)
%     mn = min(im(:));
%     mx = max(im(:));
% rescaleMx = 1;
% rescaleMn = 0;
    mn = 0;
    mx = 1;
end
imN = (mx*(im-Imn)./(Imx-Imn+eps)) + mn;

end
