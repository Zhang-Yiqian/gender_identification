clear 
close all
addpath("utils")
% define your test file root
global file_root
file_root = "~/Documents/github/gender_identification/data/testdata/";

% define your data root
global data_root
data_root = "~/Documents/github/gender_identification/data/testdata/";
model_file = "model/best-model.mat";

% fill your test file path here (reletive path)
test_list = "list.txt";
load(model_file)

% got the prediction score
[fm, pff] = GMMtester(test_list, famale_model, 'test');
[mm, pfm] = GMMtester(test_list, male_model, 'test');

females = (fm - mm) > 0;

res = strings(length(females),1);
for i = 1: length(females)
  if females(i) == 1
    res(i, 1) = 'F \n';
  elseif females(i) == 0
    res(i, 1) = 'M \n';
  end
end
% write into .txt file
fp = fopen("challenge_results", "wt");
fprintf(fp, "%s", res);
fclose(fp);
