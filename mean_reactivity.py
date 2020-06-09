#!/usr/bin/env python3
# -*- coding: utf-8 -*-


import argparse
from argparse import RawTextHelpFormatter
import os    
import numpy as np


def argument_parser():

    parser = argparse.ArgumentParser(description=__doc__, prog='map_ss_to_ali', formatter_class=RawTextHelpFormatter)
    parser.add_argument("-f", "--file", required=True, dest="file",
                            help="Input alignment file. Multiple sequence alignment in one-line FASTA format.")

    args = parser.parse_args() 

    infile = args.file

    return infile
    

def get_mean_reactivities():
    print('getting mean for window')
    
    mean_list = []
    c =37
    for i in range (0,c+1):
        list = react[0:i+c]
        #print(c,i)
        #print(list, len(list))
        mean = get_mean(list)
        #print(mean, '\n')
        mean_list.append(mean)
        #if c < 75:
        #    c+=1
    for i in range (c, len(react)-1):#-c):
        list = react[i-c:i+c+1]
        #print(c,i)
        #print(list, len(list))
        mean = get_mean(list)
        #print(mean, '\n')
        mean_list.append(mean)
    #print(len(react))
    #print(len(mean_list))
    
    output = open('incarnato_covid_react_median.txt','w')
    output.write(','.join(str(k) for k in mean_list))
    output.close()
    
    #print(len(list))
        #print(c,i)
    #print(mean_list, len(mean_list))
    #print(mean_list, 'last_list')
    
    #for i in range(0,10):#len(react)):
    #    list = react[i:c]
    #    print(list)
    #    c+=1
    
    
def get_mean_all():
    print('mean for all')
    react_sorted = react.copy() 
    react_sorted.sort()
    react_array = np.array(react_sorted).astype(np.float)
    mean_all = round(np.nanmedian(react_array),3)
    
    #print(react_array)            
    print(mean_all)
    return mean_all

def get_mean(list):
    list_sorted = list.copy() 
    list_sorted.sort()
    list_array = np.array(list).astype(np.float)
    mean_list = round(np.nanmedian(list_array),3)
    return mean_list
    
def read_file():
    with open(infile) as f:
        react_all_str = f.readline()
        react_all = react_all_str.split(",")
    
    #print(react_all)
    return react_all
    
    
    
if __name__ == '__main__':

    infile = argument_parser()
    react = read_file()
    mean_all = get_mean_all()
    get_mean_reactivities()
