clear 
close all

global data_root
global file_root
data_root = "~/Documents/dataset/TIMIT";
file_root = "~/Documents/github/gender_identification/data/";
addpath("lib/SDC")
addpath("lib/voicebox")

cd ~/Documents/github/gender_identification/model/100-350-unbalanced;
val_root = "validation/";

model_list = dir("*.mat");
for i = 1 : length(model_list)
    load(model_list(i).name)
    file = regexp(model_list(i).name, "-", "split");
    index = file{3}(1);
    famale_val_file = strcat(val_root, "crossval_", index, "_F_TEST.txt");
    male_val_file = strcat(val_root, "crossval_", index, "_M_TEST.txt");
    
    [f_fm, pff] = GMMtester(famale_val_file, famale_model, 'val');
    [f_mm, pfm] = GMMtester(famale_val_file, male_model, 'val');
    [m_fm, pmf] = GMMtester(male_val_file, famale_model, 'val');
    [m_mm, pmm] = GMMtester(male_val_file, male_model, 'val');
    
    disp("---------@@@@@@@@@--------")
    disp(model_list(i).name)
    
    % calculate accuracy based on pitch
    
%     right_famale = sum(pff > 205);
%     right_male = sum(pmf < 205);
%     acc_f = right_famale / length(pff);
%     acc_m = right_male / length(pmm);
%     disp(strcat("pitch correct famale:", num2str(right_famale), "/", ...
%         num2str(acc_f), "/", num2str(length(pff))))
%     disp(strcat('pitch correct male:', num2str(right_male), '/', ...
%         num2str(acc_m), '/', num2str(length(pmm))))
    
    
    % calculate accuracy of unfused model
    right_famale = sum((f_fm - f_mm) > 0);
    right_male = sum((m_mm - m_fm) > 0);
    acc_f = right_famale / length(f_fm);
    acc_m = right_male / length(m_fm);
    disp(strcat("unfused correct famale:", num2str(right_famale), "/", ...
        num2str(acc_f), "/", num2str(length(f_fm))))
    disp(strcat('unfused correct male:', num2str(right_male), '/', ...
        num2str(acc_m), '/', num2str(length(m_fm))))
    
    disp("------------------------")
    
    
    
    
end
