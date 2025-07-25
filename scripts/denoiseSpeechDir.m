% This file has 2 functions: One function to process one file, another function to process an entire directory
%%
function denoisedAudioArray = denoiseSpeechDir(noisyInputDir, outputDir)
    % Get all .wav files in the directory
    fileList = dir(fullfile(noisyInputDir, '*.wav'));

    % Extract numeric part from each filename
    fileNums = arrayfun(@(f) sscanf(f.name, '%d'), fileList);

    % Sort files by numeric value in ascending order
    [~, sortIdx] = sort(fileNums, 'ascend');
    sortedFiles = fileList(sortIdx);

    numFiles = length(sortedFiles);
    denoisedAudioArray = cell(1, numFiles);

    % Denoise each file in sorted order
    for i = 1:numFiles
        inputFile = fullfile(noisyInputDir, sortedFiles(i).name);
        denoisedAudioArray{i} = denoiseSpeechFile(inputFile, outputDir);
    end
end

%[appendix]{"version":"1.0"}
%---
