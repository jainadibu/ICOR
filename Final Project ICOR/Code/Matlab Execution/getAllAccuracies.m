%% Copyright (C) 2020-2021 Aditya Jain, Rishab Jain
%%This script calculates the codon accuracy, amino acid accuracy, and
%%"error" in a,t,c,g percentages for a set of testing data
%Set XTest to be the input data (amino acids, encoded) and newnetEX to be
%the network you want ot test with. YTest is the expected output of
%optimized codons

accuracy = zeros(1,length(XTest));
AAaccuracy = accuracy;
aerror = accuracy;
terror = accuracy;
cerror = accuracy;
gerror = accuracy;

for i = 1:length(XTest)
    disp(i)
    %get raw accuracy of codons
    YPred = classify(newnetEX,XTest{i});
    accuracy(i) = sum(YPred==YTest{i})/numel(YTest{i});
    
    %get AA sequence similarity
    actualprotseq = nt2aa(char(YTest{i}))';
    predictedprotseq = nt2aa(char(YPred))';
    AAaccuracy(i) = sum(predictedprotseq==actualprotseq)/numel(actualprotseq);
    
    %%base bias
    testBases = basecount(char(YTest{i}));
    predBases = basecount(char(YPred));
    aerror(i) = (predBases.A/testBases.A)-1;
    terror(i) = (predBases.T/testBases.T)-1;
    cerror(i) = (predBases.C/testBases.C)-1;
    gerror(i) = (predBases.G/testBases.G)-1;
%     
%     %%codon bias
%     predbias = codonbias(char(YPred));
%     actualbias = codonbias(char(YTest{i}));
    
end
