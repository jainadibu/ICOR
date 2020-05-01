%%encodes input amino acid & nucleotide set through One Hot Encoding,
%%accounting for IUPAC guidelines 

function [XTrain,YTrain] = createTrainingData(ntseq,aaseq)
    XTrain = {};
    for i = 1:length(aaseq)
        currentcell = zeros(26,length(aaseq(i)));
        currentin = aa2int(aaseq(i).Sequence);
        for gothrough = 1:length(currentin)
            for create = 0:25
                if(currentin(gothrough) == create)
                    currentcell(create+1,gothrough) = 1;
                end
            end
        end
        %currentcell = num2cell(currentcell);
        XTrain{i} = currentcell;
    end
    XTrain = XTrain';
    disp('Now on Y');
    YTrain = {};
        for i = 1:length(ntseq)
        currentin2 = ntseq(i).Sequence;
        currentcell2 = {};
        currentcell2{floor(length(currentin2)/3)} = '';
        for codon = 0:floor(length(currentin2)/3)-1
            currcodon = currentin2(1+(codon*3):3+(codon*3));
            if contains(currcodon,'R')
                for replacer = 1:3
                    if currcodon(replacer) == 'R'
                        temp = round(rand);
                        switch temp
                            case 0
                                currcodon(replacer) = 'A';
                            case 1
                                currcodon(replacer) = 'G';
                            otherwise
                                currcodon(replacer) = 'A';
                        end
                    end
                end
            end
            
            if contains(currcodon,'Y')
                for replacer = 1:3
                    if currcodon(replacer) == 'Y'
                        temp = round(rand);
                        switch temp
                            case 0
                                currcodon(replacer) = 'C';
                            case 1
                                currcodon(replacer) = 'T';
                            otherwise
                                currcodon(replacer) = 'C';
                        end
                    end
                end
            end
            
            
            if contains(currcodon,'S')
                for replacer = 1:3
                    if currcodon(replacer) == 'S'
                        temp = round(rand);
                        switch temp
                            case 0
                                currcodon(replacer) = 'G';
                            case 1
                                currcodon(replacer) = 'C';
                            otherwise
                                currcodon(replacer) = 'G';
                        end
                    end
                end
            end            

            if contains(currcodon,'W')
                for replacer = 1:3
                    if currcodon(replacer) == 'W'
                        temp = round(rand);
                        switch temp
                            case 0
                                currcodon(replacer) = 'A';
                            case 1
                                currcodon(replacer) = 'T';
                            otherwise
                                currcodon(replacer) = 'A';
                        end
                    end
                end
            end

            if contains(currcodon,'K')
                for replacer = 1:3
                    if currcodon(replacer) == 'K'
                        temp = round(rand);
                        switch temp
                            case 0
                                currcodon(replacer) = 'G';
                            case 1
                                currcodon(replacer) = 'T';
                            otherwise
                                currcodon(replacer) = 'G';
                        end
                    end
                end
            end
            
            if contains(currcodon,'M')
                for replacer = 1:3
                    if currcodon(replacer) == 'M'
                        temp = round(rand);
                        switch temp
                            case 0
                                currcodon(replacer) = 'A';
                            case 1
                                currcodon(replacer) = 'C';
                            otherwise
                                currcodon(replacer) = 'A';
                        end
                    end
                end
            end

            if contains(currcodon,'B')
                for replacer = 1:3
                    if currcodon(replacer) == 'B'
                        temp = round(rand);
                        switch temp
                            case 0
                                currcodon(replacer) = 'C';
                            case 1
                                currcodon(replacer) = 'G';
                            otherwise
                                currcodon(replacer) = 'T';
                        end
                    end
                end
            end
            
            if contains(currcodon,'D')
                for replacer = 1:3
                    if currcodon(replacer) == 'D'
                        temp = round(rand);
                        switch temp
                            case 0
                                currcodon(replacer) = 'A';
                            case 1
                                currcodon(replacer) = 'G';
                            otherwise
                                currcodon(replacer) = 'T';
                        end
                    end
                end
            end
            
            if contains(currcodon,'H')
                for replacer = 1:3
                    if currcodon(replacer) == 'H'
                        temp = round(rand);
                        switch temp
                            case 0
                                currcodon(replacer) = 'A';
                            case 1
                                currcodon(replacer) = 'C';
                            otherwise
                                currcodon(replacer) = 'T';
                        end
                    end
                end
            end
            
            if contains(currcodon,'V')
                for replacer = 1:3
                    if currcodon(replacer) == 'V'
                        temp = round(rand);
                        switch temp
                            case 0
                                currcodon(replacer) = 'A';
                            case 1
                                currcodon(replacer) = 'C';
                            otherwise
                                currcodon(replacer) = 'G';
                        end
                    end
                end
            end
            
            if contains(currcodon,'N')
                for replacer = 1:3
                    if currcodon(replacer) == 'N'
                        temp = round(rand);
                        switch temp
                            case 0
                                currcodon(replacer) = 'A';
                            case 1
                                currcodon(replacer) = 'C';
                            otherwise
                                currcodon(replacer) = 'G';
                        end
                    end
                end
            end            
            currentcell2{codon+1} = currcodon;
        end
        currentcell2 = categorical(currentcell2);
        YTrain{i} = currentcell2;
        end
        YTrain = YTrain';
end

%%note to self: may need to fix the output of the machine learning model by
%%manually checking if the AAseq input matches the AAseq output and fixing
%%any ones where it does not match - this depends on which model we use tho