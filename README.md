# ICOR ReadMe
Aditya Jain, 2020

ICOR is a codon optimization tool which uses an RNN model in order to learn sequential, contextual information from DNA sequences with the goal of more accurately capturing the codon bias of a host organism. ICOR is currently in development. ICOR currently supports codon optimization for all species of E. Coli bacteria.

To run ICOR, users may either simply run the packaged ICOR project, or in order to perform high-throughput analysis, get accuracy statistics, or replicate the work done, the MATLAB run option is available. Both are detailed below.

# Packaged, ready-to-go ICOR project (RECOMMENDED)
1. Download the ICOR App folder under "Code/Packaged Execution" *must download the entire folder as it contains graphics and network object. Note the path where you downloaded it*
1.a Ensure that an ICORnet ".mat" file is in the ICOR App folder (this file will continue to be updated while ICOR is under development, so you only need to download the latest ICORnet instead of updating the entire program)
2. In the initialization tab, press the initialize button and select the folder in which the ICOR.exe file was downloaded
3. Go to the ICOR app tab to start the optimization process
4. Select your locally stored FASTA file containing the sequence or copy & paste the sequence into the textbox in the ICOR app
5. Select the downloaded ICORnet using the Select Net button
6. Copy your exported, optimized sequence in the textbox (it is also saved as a .txt file locally)

# MATLAB execution environment
- Dependencies: MATLAB 2019a+, Deep Learning Toolbox, Bioinformatics Toolbox
How to run on your data:
1. Download the folder under "Code/MATLAB Execution"
2. Import your data using fastalator.m
3. Convert it into the encoded format using createTrainingData.m
4. Type the following code: "Ypred = classify(ICORnet, XData)"
4a. Optional: run the getAllAccuracies.m program to get some detailed statistics which compare the optimized sequence to the original
5. Ypred contains the optimized sequence, this can be copied into a txt file or whereever you would like to use your optimized sequence

The MATLAB Execution file also contains the required files to train on a dataset (trainNetwork.m), experiments in progress (createTrainingDataNLF.m), and other files which can be useful when dealing with large amounts of data (splitlargefasta.m, revertToProtSeq)

Engage!
