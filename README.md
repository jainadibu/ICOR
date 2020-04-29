# ICOR ReadMe
Aditya Jain, 2020

ICOR is a codon optimization tool which uses an RNN model in order to learn sequential, contextual information from DNA sequences with the goal of more accurately capturing the codon bias of a host organism. ICOR is currently in development. ICOR currently supports codon optimization for all species of E. Coli bacteria.

To run ICOR, users may either simply run the packaged ICOR project, or in order to perform high-throughput analysis, get accuracy statistics, or replicate the work done, the MATLAB run option is available. Both are detailed below.

# Packaged, ready-to-go ICOR project (RECOMMENDED)
1. Download the ICOR.exe file under "Code/Packaged Execution"
2. Download the latest version of ICORnet from the same folder (this file will continue to be updated while ICOR is under development, so you only need to download the latest ICORnet instead of updating the entire program)
3. Select your locally stored FASTA file containing the sequence or copy & paste the sequence into the textbox in the ICOR app
4. Select the downloaded ICORnet using the Select Net button
5. Copy your exported, optimized sequence in the textbox (it is also saved as a .txt file locally)

# MATLAB execution environment
- Dependencies: MATLAB 2019a+, Deep Learning Toolbox, Bioinformatics Toolbox
How to run on your data:
1. Download the folder under "Code/MATLAB Execution"
2. Import your data using fastalator.m
3. Convert it into the encoded format using createTrainingData.m
4. Type the following code: "Ypred = classify(ICORnet, XData)"
4a. Optional: run the getAccuracies.m program to get some detailed statistics which compare the optimized sequence to the original
5. Ypred contains the optimized sequence, this can be copied into a txt file or whereever you would like to use your optimized sequence

The MATLAB Execution file also contains the required files to train on a dataset (trainNetwork.m)
