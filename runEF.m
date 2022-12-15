function  runEF(p_Iin, p_Iout)
%% PATHS
tic;
warning('off');

[~,Inum,Iext] = fileparts(p_Iin);
I = im2double(imread(p_Iin));
[~,~,Idims] = size(I);
if Idims<3, fprintf('ERROR. Expecting 3 channel RGB Image as input.\n'); exit(); end

[h,w,~] = size(I);
%% Aspect ratio preserving resizing
% if (h>1024) && (h>w)
%     aspRatio = 1024/h;
%     nw = floor(w*aspRatio);
%     I = imresize(I,[1024 nw]);
% elseif (w>1024) && (w>h)
%     aspRatio = 1024/w;
%     nh = floor(h*aspRatio);
%     I = imresize(I,[nh 1024]);
% end

%% Dircet resizing 1024x512 or 512x1024 
if (h>1024) && (h>w)
    I = imresize(I,[1024 512]);
elseif (w>1024) && (w>h)
    I = imresize(I,[512 1024]);
end

%% CONFIG
cfg.Iname = [Inum Iext];
cfg.f_saveRes   = true;
cfg.simnum = 15;
cfg.minThresh = 0.01;
cfg.maxThresh = 0.10;
cfg.k = flip(round(linspace(1,2,cfg.simnum),3));
cfg.maxSize = 1024;
cfg.alpha = 0.1;
cfg.wexp=2; cfg.wcont=0; cfg.wdel=0; cfg.wsat=1;  
Rpath = fullfile(p_Iout,Inum);
if ~exist(Rpath, 'dir'), mkdir(Rpath);  end
fprintf('======================= Setting Up: DONE %.2f\n',toc)

%% EXPOSURE STACK SIMULATION
[E, simEn, simdE] = qSIM(I, cfg);
fprintf('======================= Stack Simulation: DONE %.2f\n',toc);

%% FUSION  STRATS
% % DIRECT
% lSim = simEn{end};
% lSim =  prctileNormalize(lSim);
% T_p_resPath = fullfile(Rpath,[Inum '.mat']);
% save(T_p_resPath, 'efSim');
% s_cmd = strcat("python denoise.py ",T_p_resPath);
% system(s_cmd);
% load(T_p_resPath);
% delete T_p_resPath;
% Idirect = normalizeMinmax(Idirect);
% fprintf('======================= Direct Fusion: DONE %.2f\n',toc);

% LAPLACIAN
efSim = qExposure_fusion(cell2ImMat(simEn),cfg,simdE);
efSim = prctileNormalize(efSim);
T_p_resPath = fullfile(Rpath,[Inum '.mat']);
save(T_p_resPath, 'efSim');
s_cmd = strcat("python denoise.py ",T_p_resPath);
system(s_cmd);
load(T_p_resPath);
delete T_p_resPath;
% Iqsef = imbilatfilt(Iqsef, 'degreeOfSmoothing', 0.05);
Iqsef = normalizeMinmax(Iqsef);
fprintf('======================= Laplacian Fusion: DONE %.2f\n',toc);

% % GRWF
% [~,pMaps] = getFocusPmaps(simEn,0.1,1,1,0.1);
% WsimEn = arrayfun(@(x) pMaps(:,:,x).*simEn{x}, 1:numel(simEn), 'UniformOutput', false);
% pMapSim=0; for x=1:numel(WsimEn), pMapSim=pMapSim+WsimEn{x}; end
% pMapSim= prctileNormalize(pMapSim);
% T_p_resPath = fullfile(Rpath,[Inum '.mat']);
% save(T_p_resPath, 'efSim');
% s_cmd = strcat("python denoise.py ",T_p_resPath);
% system(s_cmd);
% load(T_p_resPath);
% delete T_p_resPath;
% Igrwf = normalizeMinmax(Igrwf);
% fprintf('======================= GRW Fusion: DONE %.2f\n',toc);

%% Visualizing/saving results
fprintf('======================= SAVING results \n');

imwrite(Iqsef, fullfile(Rpath,[Inum '_L.png']));
figure; montage({I Iqsef}, 'Size', [1 nan], 'BackgroundColor','white', 'BorderSize',[5 5])
% figure; montage({I Idirect Iqsef Igrwf}, 'Size', [2 2], 'BackgroundColor', 'white', 'BorderSize', [2 2])
% save(fullfile(Rpath,[Inum '.mat']), 'E', 'simEn');

fprintf('=======================\n');
fprintf('Processing of %s COMPLETE\n',p_Iin);
fprintf('=======================\n');

end