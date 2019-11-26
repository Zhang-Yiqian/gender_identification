# gender_identification


Welcome to my gender identification code

The github page is https://github.com/Zhang-Yiqian/gender_identification

Check it for the newest version.

## file strcuture 

data: store the train/val/test file path
graphs: some graphs in the report
lib: MATLAB libraries
model: all the trained model; the best performace model is named "best-model.bat"
res: the validation results
utils: self-defined functions

## how to test your own audio
1. open "GMM_test.m"
2. change to your own "file_root", which is the root of your test file list
3. change to your own "data_root", which is the root of audio data
4. change to your own "test_list", which is the name of test file list
5. the results will be written in to a .txt file "challenge_results"
6. run and enjoy the amazing performance



