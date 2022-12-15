function[E, simEn, simdE] = qSIM(I, cfg)
%function[E, simEn, simdE] = qSIM(Ipath, cfg)
nargoutchk(1,3);
%% Reading input
%[~,Iname,Iext] = fileparts(Ipath);
%I = im2double(imread(Ipath));

%% Factorization
%[A,E] = qFactorize(I,cfg.k,[Iname Iext]);
fprintf('Factorizing \t')
[A,E] = qFactorize(I,cfg.k);

E = groupLayers(I,E,cfg);
cfg.simnum = numel(E);

w1E = []; w2E = [];
for i=1:cfg.simnum
    E{i} = prctileNormalize(E{i});     % Remove spurious values
    E{i}(E{i}<0) = 0;
    w1E(i) = sum(E{i}(:));
end
cfg.simnum = numel(E);
wE = w1E/sum(w1E);

for c=1:cfg.simnum
    En{c} = normalizeIm(E{c});
    % Difference images
    if c>1
        dE{c} = abs(E{c}-E{c-1});
    else
        dE{c} = E{c};
    end
end

%% Exposure sequence simulation
simEn       = {};
simdE       = {};
for i=0:cfg.simnum
    if i<1
        simEn{i+1} = I;
        simdE{i+1} = I;
    else
        simEn{i+1} = (1-cfg.alpha)*simEn{i} + cfg.alpha*En{i};
        simEn{i+1} = normalizeIm((simEn{i+1}),0,1-wE(i));

        simdE{i+1} = dE{i};  
        simdE{i+1} = normalizeIm((simdE{i+1}),0,1-wE(i));
    end
end

end


