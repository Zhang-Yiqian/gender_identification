# Gender Identification Based on GMM


Welcome to my gender identification code

The github page is https://github.com/Zhang-Yiqian/gender_identification


## Software Requirement 

MATLAB 2019 and above

## File Strcuture 

data/ : Store the train/val/test file path  
graphs/ : Some graphs in the report  
lib/ : MATLAB libraries  
model/ : All the trained model; the best performace model is named "best-model.bat"  
res/ : The validation results  
utils/ : Some self-defined functions  

## How To Recognise Your Own Audio
1. Open "GMM_test.m"
2. Change to your own "file_root", which is the root of your test file list
3. Change to your own "data_root", which is the root of audio data
4. Change to your own "test_list", which is the name of test file list
5. The results will be written in to a .txt file "challenge_results"
6. Run and enjoy the amazing performance



