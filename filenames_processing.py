#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Nov 12 20:25:24 2019

@author: zhangyiqian
"""

import os
import random
import copy

def f_or_m(l):
    f = []
    m = []
    for i in l:
        gender = i.split('/')[-2][0]
        if gender == 'M':
            m.append(i)
        if gender == 'F':
            f.append(i)
    pass
    return f, m

def writefile(l, index, gender, state):
    f = open("/Users/zhangyiqian/Documents/course files/Speech ENG/final/mycode/data/file_lists/"
              + "crossval_" + str(index) + "_" + gender + "_" + state + ".txt","w")
    for i in l:
        file = root + i.split(".")[0] + ".WRD"
        with open(file, "r") as f1:
            l1 = f1.readlines()
            start_time = l1[0].split()[0]
            end_time = l1[-1].split()[1]
            line = i.split()[0] + '\t' + start_time + '\t' + end_time + '\n'
            f.writelines(line)
    f.close()
    

f1 = open("/Users/zhangyiqian/Documents/course files/Speech ENG/final/training_data_given.txt","r+")
root = '/Users/zhangyiqian/Documents/MATLAB/TIMIT'
fs = f1.readlines()
l = []
for f in fs:
    name = f.split('\\')
    path = '/'+name[5]+'/'+name[6]+'/'+name[7].strip()+'/'
    for i in os.listdir(root + path):
        if os.path.splitext(i)[1] == '.WAV':
            l.append(path + i + '\n')

random.shuffle(l)
step = int(len(l) * 0.2)
start = 0
for i in range(1, 6):
    l1 = copy.deepcopy(l)
    try:
        test_set = l1[start: start + step]
        l1[start: start + step] = [] 
    except TypeError:
        test_set = l1[start: ]
        l1[start: ] = []  
    start = start + step
    train_set = l1
    f_test, m_test = f_or_m(test_set)
    f_train, m_train = f_or_m(train_set)
    writefile(f_test, i, 'F', 'TEST')
    writefile(m_test, i, 'M', 'TEST')
    writefile(f_train, i, 'F', 'TRAIN')
    writefile(m_train, i, 'M', 'TRAIN')
    


#with open("data/myfiles.txt","w") as f:
#    f.writelines(l)












