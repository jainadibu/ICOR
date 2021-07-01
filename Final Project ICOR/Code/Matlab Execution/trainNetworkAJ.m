%% Copyright (C) 2020-2021 Aditya Jain, Rishab Jain
%%Control panel for training IcorNet. Try uncommenting and commenting out
%%different lines to adjust the network properties. Also commented out
%%below is a way to sort your data for when you do not want to shuffle

%%Looking for the most up to date trained network of ICOR? Check the
%%Packaged Execution folder!!

numFeatures = 26;
numHiddenUnits = 512;
numHiddenUnits2 = 256;
numClasses = 64;

layers = [
    sequenceInputLayer(numFeatures)
    %wordEmbeddingLayer(64,26)
    bilstmLayer(numHiddenUnits2,'OutputMode','sequence')
    %dropoutLayer(0.05)
    %bilstmLayer(numHiddenUnits2,'OutputMode','sequence')
    fullyConnectedLayer(numClasses)
    reluLayer
    softmaxLayer
    classificationLayer];

options = trainingOptions('adam', ...
    'MaxEpochs',15, ...
    'GradientThreshold',2, ...
    'Verbose',0, ...
    'MiniBatchSize',16,...
    'ExecutionEnvironment','auto',...
    'InitialLearnRate',0.005,...
        'Plots','training-progress');

%'Shuffle','never',...     
%'LearnRateSchedule','piecewise',...,
%     'LearnRateDropPeriod',1,...,
%'SequenceLength',7,...
% 
% numObs = numel(XTrain);
% for i = 1:numObs
%     sequence = XTrain{i};
%     sequenceLengths(i) = size(sequence,2);
% end
% [sequenceLengths,idx] = sort(sequenceLengths);
% XTrainSorted = XTrain(idx);
% YTrainSorted = YTrain(idx);

% XTrain(6001:end) = [];
% YTrain(6001:end) = [];
disp('Starting Training')
newnetEX = trainNetwork(XTrainSorted,YTrainSorted,layers,options);
