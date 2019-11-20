clear 
close all

cd ~/Documents/github/gender_identification/model/fused;
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
    
    
    
    % calculate accuracy of unfused model
    right_famale = sum((f_fm - f_mm) > 0);
    right_male = sum((m_mm - m_fm) > 0);
    acc_f = right_famale / length(f_fm);
    acc_m = right_male / length(m_fm);
    disp('unfused correct famale:', num2str(right_famale), '/', num2str(acc_f),...
      '/', length(f_fm))
    disp('unfused correct male:', num2str(right_male), '/', num2str(acc_m),...
      '/', length(m_fm))
    
    % calculate accuracy of fused model
    
    S1 = feature_fusion(f_fm, f_mm, pff);
    S2 = feature_fusion(m_fm, m_mm, pmf);
    right_famale2 = sum(S1 > 0);
    right_male2 = sum(S2 > 0);
    acc_f2 = right_famale2 / length(f_fm);
    acc_m2 = right_male2 / length(m_fm);
    disp('fused correct famale:', num2str(right_famale2), '/', num2str(acc_f2),...
      '/', length(f_fm))
    disp('fused correct male:', num2str(right_male2), '/', num2str(acc_m2),...
      '/', length(m_fm))

    
    disp("------------------------")
    
    
    
    
end
