clear all; close all; clc;
addpath(genpath('./libs'))
addpath(genpath('./utils'))
addpath(genpath('./src'))

p_imgDir = fullfile(pwd,'data/LOL-v1/eval15/low/');
p_resDir = fullfile(pwd,'results');
p_gtDir =  fullfile(pwd,'data/LOL-v1/eval15/high/');

D = dir(p_imgDir);
parfor d=1:numel(D)
% for d=1:numel(D)
    Iname = D(d).name;
    [~,Inum,Iext] = fileparts(Iname);
    if  ismember(Iext,{'.jpg','.JPG','.jpeg','.JPEG','.png','.PNG','.bmp','.BMP','.tiff','.TIFF'})
        p_img = fullfile(p_imgDir, Iname);
        runEF(p_img, p_resDir)
    end
end

e_Iqsef = struct('psnr',[],'ssim',[]);
for d=1:numel(D)
    Iname = D(d).name;
    [~,Inum,Iext] = fileparts(Iname);
    Iname_L = strcat(Inum,'_L',Iext);
    if  ismember(Iext,{'.jpg','.JPG','.jpeg','.JPEG','.png','.PNG','.bmp','.BMP','.tiff','.TIFF'})
        Iqsef = im2double(imread(fullfile(p_resDir,Inum,Iname_L)));
        Igt = im2double(imread(fullfile(p_gtDir,Iname)));
        e_Iqsef.('psnr')(end+1)   =  psnr(Iqsef,Igt);
        e_Iqsef.('ssim')(end+1)   =  ssim(Iqsef,Igt);
    end
end
mean_e_Iqsef_psnr = round(mean(e_Iqsef.psnr),3);
mean_e_Iqsef_ssim = round(mean(e_Iqsef.ssim),3);
fprintf('=======================\n');
fprintf('Mean PSNR=%0.3f \t SSIM=%0.3f \n', mean_e_Iqsef_psnr, mean_e_Iqsef_ssim);
fprintf('=======================\n');


