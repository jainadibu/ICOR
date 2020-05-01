# ICOR ReadMe
Aditya Jain, 2020

ICOR is a codon optimization tool which uses an RNN model in order to learn sequential, contextual information from DNA sequences with the goal of more accurately capturing the codon bias of a host organism. ICOR is currently in development. ICOR currently supports codon optimization for all species of E. Coli bacteria.

To run ICOR, users may either simply run the packaged ICOR project, or in order to perform high-throughput analysis, get accuracy statistics, or replicate the work done, the MATLAB run option is available. Both are detailed below.

# Packaged, ready-to-go ICOR project (RECOMMENDED)
1. Download the Packaged Execution folder under "Code/Packaged Execution"
   1a. Ensure that an ICORNet_v... ".mat" file is in the ICOR App folder (this file will continue to be updated while ICOR is under        development, so you only need to download the latest ICORnet instead of re-installing the entire program)
2. Run ICORInstaller, note down the directory where it was installed to *this installer is unfortunately slow as MATLAB requires its runtime to be installed from the Web (~800 MB)*
3. Once the ICOR App installs, take the latest version of ICORNet and place it in the same directory where the program was installed (defaults to C:/Program Files...)
4. Select your locally stored FASTA file/s containing the sequence/s to be optimized and place it in the same directory.
5. Run the ICOR App now installed on your computer *as administrator*, and, if this is your first time running it, wait a few minutes for it to launch.
6. Once it loads, select your FASTA file using the button  the "ICORNet_v..." file using the Select Net button
   6a. Alternatively, copy & paste the amino acid sequence into the textbox in the ICOR app or run the Demo fasta file (optimizes a THR    Operon Leader Peptide)
7. Use the next button to select your ICORnet file which you saved to the same directory
8. Run the optimization. This should be quick! You can copy your exported, optimized sequence in the textbox or export it locally using the export button.

# MATLAB execution environment
- Dependencies: MATLAB 2019a+, Deep Learning Toolbox, Bioinformatics Toolbox

How to run on your data:
1. Download the folder under "Code/MATLAB Execution"
2. Import your training/testing sequence/s using fastalator.m
3. Convert it into the encoded format using createTrainingData.m
4. Type the following code: "Ypred = classify(ICORnet, XData)"
4a. Optional: run the getAllAccuracies.m program to get some detailed statistics which compare the optimized sequence to the original
5. Ypred contains the optimized sequence, this can be copied into a txt file or whereever you would like to use your optimized sequence

The MATLAB Execution file also contains the required files to train on a dataset (trainNetwork.m), experiments in progress (createTrainingDataNLF.m), and other files which can be useful when dealing with large amounts of data (splitlargefasta.m, revertToProtSeq)

Engage!
