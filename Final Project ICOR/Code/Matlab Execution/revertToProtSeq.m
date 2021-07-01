%% Copyright (C) 2020-2021 Aditya Jain, Rishab Jain
%%mini-script to take a One Hot Encoded input sequqence and revert it to an
%%amino acid sequence

function [protSeq] = revertToProtSeq(layeredinput)
    for i = 1:length(layeredinput)
        aaindex = find(layeredinput(:,i) == 1);
        protSeq(i) = int2aa(aaindex-1);
    end
end
