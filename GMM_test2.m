clear 
close all

cd ~/Documents/github/gender_identification/model/100-300;
val_root = "validation/";
model_list = dir("*.mat");
for i = 1 : length(model_list)
    load(model_list(i).name)
    file = regexp(model_list(i).name, "-", "split");
    index = file{3}(1);
    famale_val_file = strcat(val_root, "crossval_", index, "_F_TEST.txt");
    male_val_file = strcat(val_root, "crossval_", index, "_M_TEST.txt");
    f_fm = GMMtester(famale_val_file, famale_model, 'val');
    f_mm = GMMtester(famale_val_file, male_model, 'val');
    m_fm = GMMtester(male_val_file, famale_model, 'val');
    m_mm = GMMtester(male_val_file, male_model, 'val');
    acc_f = sum((f_fm - f_mm) > 0) / length(f_fm);
    acc_m = sum((m_mm - m_fm) > 0) / length(m_fm);
    disp("------------------------")
    disp(model_list(i).name)
    disp(acc_f)
    disp(acc_m)
    disp("------------------------")
end
