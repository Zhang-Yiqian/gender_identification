clear 
close all
rng(2019)

addpath("lib/voicebox")
addpath("lib/SDC")

global file_root
global data_root
file_root = '~/Documents/course files/Speech ENG/final/mycode/data/';
data_root = '~/Documents/MATLAB/TIMIT';
num_components = 16;

training_set_file_F = 'crossval_2_F_TRAIN.txt';
training_set_file_M = 'crossval_2_M_TRAIN.txt';
val_set_file_F = 'crossval_2_F_TEST.txt';
val_set_file_M = 'crossval_2_M_TEST.txt';

% train GMM model 
famale_model = get_model(strcat(file_root, training_set_file_F), num_components);
male_model = get_model(strcat(file_root, training_set_file_M), num_components);

% test model 
res_F = GMMtester(val_set_file_F, famale_model, "val");
res_M = GMMtester(val_set_file_F, male_model, "val");

A = res_F-res_M;
sum(A>0)/length(A)







