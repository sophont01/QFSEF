function[allFocus, pmAll] =  getFocusPmaps(fStack, gamma1, gamma2, gamma3, sig_w)
%% global parameters
% resizeFactor = 1;
% sig_y = 1; %beta is 1/(std_dev for g)
if ~exist('gamma1','var')
    gamma1 = 0.1;
end
if ~exist('gamma2','var')
    gamma2 = 1;
end
if ~exist('gamma3','var')
    gamma3 = 1;
end
if ~exist('sig_w','var')
    sig_w = 0.1;
end
nbins = 5000;
bin_size = 1/nbins;
% h=fspecial('laplacian',0);

%% computing gr
K = numel(fStack);
[row,col,cChannel] = size(fStack{1});

Lum = cell(K,1);
Im_2der = cell(K,1);
counts = cell(K,1);
xout = cell(K,1);

SceneSum=zeros(row,col,3);
var_pad = 5; var_patch = 11;
% fprintf('==============================================================\n');
for k=1:K
%     uprintf(sprintf('Computing focus measure k=%d \n',k));
    F = im2double(rgb2gray(fStack{k}));     % apply laplacian filter
    varFocalStack(:,:,1) = var(im2col(padarray(F(:, :, 1), [var_pad var_pad], 'symmetric'), [var_patch var_patch], 'sliding'));
    Im_2der{k} = abs(reshape(varFocalStack, [row col 1]));
    
    [counts{k},xout{k}] = hist(Im_2der{k}(:),nbins);
    counts{k} = counts{k}/sum(counts{k}(:));
    SceneSum = SceneSum + fStack{k};
end

SceneAvg = SceneSum/K;
tmp = SceneAvg(:,:,1);
SceneAvgVals(:,1) = tmp(:);
tmp = SceneAvg(:,:,2);
SceneAvgVals(:,2) = tmp(:);
tmp = SceneAvg(:,:,3);
SceneAvgVals(:,3) = tmp(:);

%% get average luminance and rgb
[points edges] = lattice(row,col);
point_idx = sub2ind([row col],points(:,2)+1,points(:,1)+1);
pix_pix_Compat = gamma2*makeweights(edges,SceneAvgVals,1/sig_w);    % as the formulation for edgeweights is similar to leo grady's for segmentation sig_w is beta, and form is exp(-norm(pi-pj)/sig_w)

%% Lx
Lx = sparse(edges(:,1),edges(:,2),-pix_pix_Compat,row*col,row*col,2*length(edges));
Lx = Lx+Lx';
%% Bt
Bt = zeros(row*col,K);
Ll = zeros(K,K);
pix_label_Compat_k = zeros(row,col);

% fprintf('======================================\n');
for k=1:K
%     uprintf(sprintf('Computing color consistency measure k=%d \n',k));
    Im_2der_k = Im_2der{k};
    bin_size = max(Im_2der_k(:))/(nbins);
    counts_k = counts{k};
    sig_y = std(Im_2der_k(:));
    bin_no = uint16(ceil(Im_2der_k/bin_size));
    bin_no = round((bin_no*100))/100;
    bin_no(bin_no==0) = 1;
    theta_k = counts_k(bin_no);
    
    pix_label_Compat_k = gamma1*theta_k.*(erf(Im_2der_k/sig_y)).^K;
    Bt(:,k) = pix_label_Compat_k(point_idx);
end

%% complete L & solving
L = [Ll -Bt'; -Bt Lx];
L = L-diag(sum(L));
boundary = eye(K);
% fprintf('L condition number = %f',rcond(L));
probabilities = dirichletboundary(L, (1:K)', boundary);     % <-- solving for pMaps
probabilities = probabilities/gamma3;
pmAll = reshape(probabilities(K+1:end,:),row,col,K);

%%  processing results
allFocus = zeros(size(fStack{1}));

for i=1:K
    allFocus = allFocus + fStack{i}.*repmat(pmAll(:,:,i),[1,1,3]);
end

% maxPooling
% [~,idx]=max(pmAll,[],3); % maxProbability and its index


end