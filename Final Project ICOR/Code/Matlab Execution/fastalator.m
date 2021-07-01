%% Copyright (C) 2020-2021 Aditya Jain, Rishab Jain
%%input fasta file is converted into a structure as a nucleotide sequence
%%and a translated amino acid sequence. For training, your input fasta file
%%should have all the proteins you are using. For testing on a single
%%protein, you should still use this function to import it and take the
%%translated genome, encode it with createTrainingData, and then use
%%matlab's YPred = classify(net,XTest) or the getAllAccuracies fxn

function[nucleotidegenome, translatedgenome] = fastalator(filename)
    nucleotidegenome = fastaread(filename);
    translatedgenome = nucleotidegenome;
    for i = 1:length(nucleotidegenome)
        currentseq = nucleotidegenome(i).Sequence;
        %disp(i)
        SeqAA = nt2aa(currentseq,'ACGTOnly',false);
        translatedgenome(i).Sequence = SeqAA;
    end
end
