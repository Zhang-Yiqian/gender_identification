
function [filtered_au, fs] = audioreader(path, stage)
% 1. read audio file 
% 2. denoise the audio

global data_root
if stage == "train"  
  file = cell2mat(path(1));
  start = cell2mat(path(2));
  end_ = cell2mat(path(3));
  file_path = strcat(data_root,file);
  
  % load audio
  [au, fs] = audioread(file_path);
  
  % crop the audio based on start and end point provided by WRD file 
  au = au(start: end_);
else
  file_path = strcat(data_root, path);
  % load raw audio
  [au, fs] = audioread(file_path);
  
  % regulize the sample rate
  au = resample(au, 16000, fs);
  
  % detect end and start point
  [s, e] = terminal(au);
  au = au(s:e);
end
% bandpass filter the frequency of non-human voice  
au = bandpass(au, [300,3400], 16000);

% noise cancelling
filtered_au = v_specsub(au, fs);

% voice activity detector -> 0/1
flags = v_vadsohn(filtered_au, fs);

% delete silence in the audio
silence = find(flags == 0);
filtered_au(silence) = [];

end
