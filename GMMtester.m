function r = GMMtester(audio_list, model, stage)

global file_root
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
for i = 1: len
  if stage == "val"
    [au, fs] = audioreader(list{1}{i}, stage);
  else
    [au, fs] = audioreader(list(i), stage);
  end
  % extract MFCC features
  mfcc = v_melcepst(au, fs);

  % extract SDC features
  sdc = mfcc2sdc(mfcc, 7, 1, 3, 7);
  
  res = log(sum(pdf(model, sdc)));
  
  r = [r; res];
end

end