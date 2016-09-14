clear all; close all;

addpath(genpath('/Users/idse/repos/Warmflash/')); 
dataDir = '/Users/idse/data_tmp/160812_C2C12siRNASki+Skil';

nucChannel = 1;
S4Channel = 0;

%%

channels = [nucChannel S4Channel];

% save idx for channels containing nuclear marker if multiple z-slices 
saveidx = [true false]; 

inputdir = dataDir;
outputdir = fullfile(dataDir, 'MIP');

% epi 
%---------
if ~isempty(dir(fullfile(dataDir, '*.vsi')))
    
    batchMIP_epi(dataDir, outputdir, channels, saveidx); %, meta.nTime, 1);
    
% Andor 
%---------
elseif ~isempty(dir(fullfile(dataDir, '*.txt')))
    
    outputdir = fullfile(dataDir, 'MIP');
    %batchMIP_Andor(inputdir, outputdir, channels, saveidx);
    meta = MetadataAndor(dataDir);
    batchMIP_Andor(inputdir, outputdir, channels, saveidx, meta.nTime, 1:9);
end
