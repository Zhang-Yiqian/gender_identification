clear 
close all
rng(2019)

addpath("lib/voicebox")
addpath("lib/SDC")

global file_root
global data_root
file_root = '~/Documents/github/gender_identification/data/unbalanced/';
data_root = '~/Documents/dataset/TIMIT';
num_components = 8;

training_set_file_F1 = 'crossval_1_F_TRAIN.txt';
training_set_file_M1 = 'crossval_1_M_TRAIN.txt';
val_set_file_F1 = 'crossval_1_F_TEST.txt';
val_set_file_M1 = 'crossval_1_M_TEST.txt';


training_set_file_F2 = 'crossval_2_F_TRAIN.txt';
training_set_file_M2 = 'crossval_2_M_TRAIN.txt';
val_set_file_F2 = 'crossval_2_F_TEST.txt';
val_set_file_M2 = 'crossval_2_M_TEST.txt';

training_set_file_F3 = 'crossval_3_F_TRAIN.txt';
training_set_file_M3 = 'crossval_3_M_TRAIN.txt';
val_set_file_F3 = 'crossval_3_F_TEST.txt';
val_set_file_M3 = 'crossval_3_M_TEST.txt';

training_set_file_F4 = 'crossval_4_F_TRAIN.txt';
training_set_file_M4 = 'crossval_4_M_TRAIN.txt';
val_set_file_F4 = 'crossval_4_F_TEST.txt';
val_set_file_M4 = 'crossval_4_M_TEST.txt';

training_set_file_F5 = 'crossval_5_F_TRAIN.txt';
training_set_file_M5 = 'crossval_5_M_TRAIN.txt';
val_set_file_F5 = 'crossval_5_F_TEST.txt';
val_set_file_M5 = 'crossval_5_M_TEST.txt';


% train GMM model 
famale_model = get_model(strcat(file_root, training_set_file_F1), num_components);
male_model = get_model(strcat(file_root, training_set_file_M1), num_components);
save("GMM-8-1.mat", "famale_model", "male_model")

% train GMM model 
famale_model = get_model(strcat(file_root, training_set_file_F2), num_components);
male_model = get_model(strcat(file_root, training_set_file_M2), num_components);
save("GMM-8-2.mat", "famale_model", "male_model")

% train GMM model 
famale_model = get_model(strcat(file_root, training_set_file_F3), num_components);
male_model = get_model(strcat(file_root, training_set_file_M3), num_components);
save("GMM-8-3.mat", "famale_model", "male_model")

% train GMM model 
famale_model = get_model(strcat(file_root, training_set_file_F4), num_components);
male_model = get_model(strcat(file_root, training_set_file_M4), num_components);
save("GMM-8-4.mat", "famale_model", "male_model")

% train GMM model 
famale_model = get_model(strcat(file_root, training_set_file_F5), num_components);
male_model = get_model(strcat(file_root, training_set_file_M5), num_components);
save("GMM-8-5.mat", "famale_model", "male_model")

% test model 
% res_F = GMMtester(val_set_file_M, famale_model, "val");
% res_M = GMMtester(val_set_file_M, male_model, "val");
% 
% A = res_M-res_F;
% sum(A>0)/length(A)





