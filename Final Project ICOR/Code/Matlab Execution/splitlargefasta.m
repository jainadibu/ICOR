%% Copyright (C) 2020-2021 Aditya Jain, Rishab Jain
function infoStruct = splitlargefasta(filename,numInFile)
% SPLITLARGEFASTA breaks a large FASTA file into smaller files
%
%   SPLITLARGEFASTA(FILENAME) takes a large FASTA file and splits it into
%   smaller files containing 20000 entries each. The files will be called
%   FILENAME.1, FILENAME.2, etc.
%
%   SPLITLARGEFASTA(FILENAME,NumPerFile) splits the large file into smaller
%   files each with NumPerFile entries.
%
%   Examples:
%           splitlargefasta('mrna.fa');
%           dir('mrna.fa*')
%           data = fastaread('mrna.fa.1')
%
%           % load the Nth file
%           N = 6;
%           filename = sprintf('mrna.fa.%d',N)
%           Ndata = fastaread(filename)
%

if nargin < 2
    numInFile = 20000;
end

fid = fopen(filename,'rt');
blockSize = 2^24;

hNdx = [];
pos = 0;
count = blockSize;
while count == blockSize
    [str count] = fread(fid,blockSize,'*char');
    str = str';
    hNdx = [hNdx (pos + strfind(str,'>'))];
    pos = ftell(fid);
end
frewind(fid);


numItems = numel(hNdx);
headers = cell(size(hNdx));

for count = 1:numItems
    fseek(fid,hNdx(count),-1);
    headers{count} = fgetl(fid);
end
fclose(fid);

numFiles = ceil(numItems/numInFile);
fid = fopen(filename,'r');
for fileNum = 1:numFiles
    outName = sprintf('%s.%d',filename,fileNum);
    fidOut = fopen(outName,'w');
    chunkStart = hNdx(((fileNum-1)*numInFile)+1)-1;
    if fileNum < numFiles
        chunkEnd = hNdx(((fileNum)*numInFile)+1)-1;
        chunkSize = chunkEnd - chunkStart;
    else
        chunkSize = Inf;
    end
    fseek(fid,chunkStart,-1);
    chunk = fread(fid,chunkSize,'*char');
    fwrite(fidOut,chunk,'char');
    fclose(fidOut);
end
fclose(fid);

if nargout > 0
    infoStruct.Headers = headers;
    infoStruct.Index = hNdx;
end
