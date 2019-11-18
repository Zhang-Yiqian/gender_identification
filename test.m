clear
close all
cd '~/Documents/course files/Speech ENG/final/mycode'
% load toolboxs
addpath('lib/voicebox')
addpath('lib/netlab3_3')
addpath('lib/EmGm')
addpath('lib/SDC')

% change to your own root directory
root = '~/Documents/MATLAB/TIMIT';

train_file = 'data/crossval_1_M_TRAIN.txt';
fid = fopen(train_file);

% load file list
train_list = textscan(fid, '%s%d%d');
fclose(fid);

% prepare training data/matrix
training = [];
for i = 1: length(train_list{1})
  au_file = strcat(root, train_list{1}{i});
  [au, fs] = audioread(au_file);
  
  % crop the audio based on start and end point provided by WRD file 
  croped_au = au(train_list{2}(i, 1): train_list{3}(i, 1));
  
  % noise cancelling
  filtered_au = v_specsub(au, fs);
  
  % voice activity detector -> 0/1
  flags = v_vadsohn(filtered_au, fs);
  
  % delete silence in the audio
  silence = find(flags == 0);
  filtered_au(silence) = [];
 
  % extract MFCC features
  mfcc = v_melcepst(filtered_au, fs);

  % extract SDC features
  sdc = mfcc2sdc(mfcc, 7, 1, 3, 7);

  % normalize
  % sdc = mapstd(sdc);
  
  % append to the training matrix
  training = [training; sdc];
  
end

options = statset('MaxIter',1000);
GMModel = fitgmdist(training,16,'CovarianceType','diagonal', 'RegularizationValue',0.001,'Options',options, 'SharedCovariance', true);
max(pdf(GMModel, training(4:200, :)))



