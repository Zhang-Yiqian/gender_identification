function [r, pitchs] = GMMtester(audio_list, model, stage)
% function [probs, pitchs] = extractor(audio_list, model, stage)

global file_root
global data_root

file_path = strcat(file_root, audio_list); 
fid = fopen(file_path);
if stage == "val"
  list = textscan(fid, '%s%d%d');
elseif tage == "test"
  list = textscan(fid, '%s');
  list = cell2mat(list);
end
fclose(fid);

if stage == "val"
  len = length(list{1});
else
  len = length(list);
end

r = [];
% probs = {};
pitchs = [];

for i = 1: len
  if stage == "val"
    [au, fs] = audioreader(list{1}{i}, stage);
  elseif tage == "test"
    [au, fs] = audioreader(list(i), stage);
  end
  
  % extract MFCC features
  mfcc = v_melcepst(au, fs);

  % extract SDC features
  sdc = mfcc2sdc(mfcc, 7, 1, 3, 7);
  % res = log(sum(pdf(model, sdc)));
  res = sum(log(pdf(model, sdc)));
  r = [r; res];
  
  % probs = [probs, pdf(model, sdc)];
  pitchs = [pitchs; mean(pitch(au, 16000))];
  
end
end
