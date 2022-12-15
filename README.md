# QFSEF
## Quaternion Factorized Simulated Exposure Fusion for Low Light Image Enhancement - [ICVGIP 2022](https://events.iitgn.ac.in/2022/icvgip/)

[Saurabh Saini](https://sophont01.github.io/) & [P. J. Narayanan](https://scholar.google.co.in/citations?user=3HKjt_IAAAAJ&hl=en&oi=ao)

[CVIT](https://cvit.iiit.ac.in/), [IIIT-Hyderabad](https://www.iiit.ac.in/)

**[Official code release]**

![](https://img.shields.io/badge/Matlab-R2022a-green) ![](https://img.shields.io/badge/Python-3.9-green) ![](https://img.shields.io/badge/Ubuntu-22.04-green)

```
@inproceedings{goel2022styletrf,
author = {Saini, Saurabh and Narayanan, P. J.},
title = {Quaternion Factorized Simulated Exposure Fusion for Low Light Image Enhancement},
year = {2022},
doi = {10.1145/3571600.3571604},
booktitle = {Proceedings of the Thirteenth Indian Conference on Computer Vision, Graphics and Image Processing},
series = {ICVGIP '22}}
```
[paper](https://sophont01.github.io/data/docs/QFSEF.pdf) | [poster](https://sophont01.github.io/data/docs/QFSEF_poster.pdf) | arxiv

## Overview

![teaser](https://user-images.githubusercontent.com/6546898/207841431-09a313e6-c883-4dc5-a154-c0f96e2ec01a.png)
_QFSEF: Given a poorly lit image as input (left), we factorize it into multiple illumination consistent layers using a pure quaternion matrix factorization scheme, which we then use to simulate an exposure stack (mid) and fuse to obtain an enhanced image (right)._

![simstack](https://user-images.githubusercontent.com/6546898/207841472-03f1eeff-c47c-49a9-ab38-bfe74164d757.png)
_Simulated exposure stack from a single image. For two scenes types (outdoor vs. indoors) with varying illumination sources (natural vs. artificial), we show our simulated images (top) and underlying specular factors (bottom)._

## Abstract
Image Fusion maximizes the visual information at each pixel location by merging content from multiple images in order to produce an enhanced image. Exposure Fusion, specifically, fuses a bracketed exposure stack of poorly lit images to generate a properly illuminated image. Given a single input image, exposure fusion can still be employed on a ‘simulated’ exposure stack, leading to direct single image contrast and low-light enhancement. In this work, we present a novel ‘Quaternion Factorized Simulated Exposure Fusion’ (QFSEF) method by factorizing an input image into multiple illumination consistent layers. To this end, we use an iterative sparse matrix factorization scheme by representing the image as a two-dimensional pure quaternion matrix. Theoretically, our representation is based on the dichromatic reflection model and accounts for the two scene illumination characteristics by factorizing each progressively generated image into separate specular and diffuse components. We empirically prove the advantages of our factorization scheme over other exposure simulation methods by using it for the low-light image enhancement task.

## Usage

The code has been build using Matlab R2022a (but should work for > R2019a) and python 3.9. It also depends upon [qtfm toolbox](https://qtfm.sourceforge.io/) for quaternion based processing and adapts codes from [Exposure Fusion](https://mericam.github.io/exposure_fusion/index.html), [GRWF](http://leogrady.net/software/), [BM3D](https://webpages.tuni.fi/foi/GCF-BM3D/) and [qRPCA](https://github.com/takshingchan/spl2016). Please cite the respective papers and look into their License agreements before publishing. We have provided these code in the `libs` and `utils` folders.

* Install required python packages using:
  `pip install -r requirements.txt`

* Then from Matlab run the script `demo.m` (modify dataset and result paths as necessary).
`demo.m` calls `runEF.m` with image paths from `data` folder.
`runEF.m` calls `utils/qSIM.m` to simulate exposure stack (which internally runs the quaternion factorization function `utils/qFactorize.m`). Then it fuses the simulated stack using `utils/qExposure_fusion.m`  and denoises the fused image by running the python script `denoise.py`. The results are generated in the `results` folder in the root directory. 

* You can raise an issue on github or email the first author (emailID from paper title) in case of any problem.
