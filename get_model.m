function model = get_model(audio_list, num_components)

fid = fopen(audio_list);
list = textscan(fid, '%s%d%d');
fclose(fid);

data = [];

for i = 1: length(list{1})
  item = {list{1}{i}, list{2}(i), list{3}(i)};
  [au, fs] = audioreader(item, "train");
  
  % extract MFCC features
  mfcc = v_melcepst(au, fs);

  % extract SDC features
  sdc = mfcc2sdc(mfcc, 7, 1, 3, 7);
  
  % stack data
  data = [data; sdc];
  
  p = pitch(au, 16000, 'WindowLength', 256, 'OverlapLength', 0);
  i=1;
end

% train the model
model = GMMtrainer(data, num_components);

end