# ICOR ReadMe
(C) Aditya Jain, 2020

ICOR is a codon optimization tool which uses an RNN model in order to learn sequential, contextual information from DNA sequences with the goal of more accurately capturing the codon bias of a host organism. ICOR is currently in development. ICOR currently supports codon optimization for all species of E. Coli bacteria.

To run ICOR, users may either simply run the packaged ICOR project, or in order to perform high-throughput analysis, get accuracy statistics, or replicate the work done, the MATLAB run option is available. Both are detailed below.

# Packaged, ready-to-go ICOR project (RECOMMENDED)
1. Download ICORInstaller from "Final Project ICOR/Code/Packaged Execution/" *this installer is unfortunately slow as MATLAB requires its runtime to be installed from the Web (~800 MB)*
2. Once the ICOR App installs, run the newly installed app as an administrator. It may take a few minutes to launch, especially on first run.
3. Press the Import .FASTA button and import your fasta file. There is a sample fasta included called testfasta.fasta in ICOR/application.
   3a. Alternatively, copy & paste the amino acid sequence into the textbox in the ICOR app or toggle the Demo FASTA toggle (optimizes a     THR Operon Leader Peptide)
4. Select the Provide Input Net button. *Note: The most updated version of ICORnet is included in the ICOR/application directory. However, custom nets can also be imported and new releases of ICOR can be installed without updating the ICOR Application just by downloading the network and selecting it here. The ICORNet .mat file is included on the Github at "Packaged Execution/"*
5. Run the optimization by pressing ICOR Prediction. This should be quick! Close the loading screen after it finishes the prediction.
6. You can copy your optimized sequence from the textbox or export it locally using the Download .txt output button.

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
