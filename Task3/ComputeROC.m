%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Project: compute ROC function 
% Autor  : Alvaro Peiro
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Use: Plots the ROC function of a learnt detector (parametrized by the 
%      values inside Cparams) evaluating it agains the images that weren't
%      used for training it.
% Input: * Cparams: parameters of the learnt detector.
%        * Fdata, NFdata: structures that contains the filenames of all
%                         the images, both the ones used for training and
%                         the one that not.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [allFnames, allNFnames]= ComputeROC(Cparams, Fdata, NFdata)

    % 1 - Get test images
    allFfiles = dir(Fdata.dirname);     allFnames = {allFfiles.name};
    allFnames = {allFnames{3:length(allFnames)}};
    allNFfiles = dir(NFdata.dirname);   allNFnames = {allNFfiles.name};
    allNFnames = {allNFnames{3:length(allNFnames)}};
    
    testFimages = allFnames; testNFimages = allNFnames;
    for i=1:length(Fdata.fnums), testFimages{Fdata.fnums(i)} = ''; end
    testFimages = setdiff(testFimages, '');
    for i=1:length(NFdata.fnums), testNFimages{NFdata.fnums(i)} = ''; end
    testNFimages = setdiff(testNFimages, '');
    
    % 2 - Apply detector to each test image.
    scFtestImages = zeros(1, length(testFimages));
    scNFtestImages = zeros(1, length(testNFimages));
    
    for i=2:length(testFimages),
        [im, ii_im] = LoadIm(testFimages{i});
        scFtestImages(i) = ApplyDetector(Cparams, ii_im);
    end
    for i=2:length(testNFimages),
        [im, ii_im] = LoadIm(testNFimages{i});
        scNFtestImages(i) = ApplyDetector(Cparams, ii_im);
    end
    
    scImages = [scFtestImages scNFtestImages];
    
    % 3 - Compute true and false positive rates.
    granularity = 0.1; tpr = []; fpr = [];
    for threshold=min(scImages):granularity:max(scImages),
        
        facesInFset = scFtestImages > threshold;
        facesInNFset = scNFtestImages > threshold;
        
        truePositives = sum(facesInFset(:)==1);
        falsePositives = sum(facesInNFset(:)==1);
        trueNegatives = sum(facesInNFset(:)==0);
        falseNegatives = sum(facesInFset(:)==0);
        
        tpr = [tpr truePositives/(truePositives+falseNegatives)];
        fpr = [fpr falsePositives/(trueNegatives+falsePositives)];
        thr = [thr threshold];
        
    end
    
    % 4 - Plot the ROC curve
    [sortedFpr, rowOrder] = sort(fpr);
    sortedTpr = tpr(rowOrder);
    sortedThr = thr(rowOrder);
    
    TprI = find(sortedTpr > 0.7, 1, 'first');
    Cparams.thresh = sortedThr(TprI(1));
    
    plot(sortedFpr, sortedTpr);
    
end