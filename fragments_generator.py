#!/usr/bin/env python3
# -*- coding: utf-8 -*-


import argparse
from argparse import RawTextHelpFormatter
import os    
import numpy as np
#from operator import itemgetter

def argument_parser():

    parser = argparse.ArgumentParser(description=__doc__, prog='map_ss_to_ali', formatter_class=RawTextHelpFormatter)
    parser.add_argument("-s", "--seq_in", required=True, dest="seq_in",
                            help="Input alignment file. Multiple sequence alignment in one-line FASTA format.")
    parser.add_argument("-r", "--react_in", required=True, dest="react_in",
                            help="Input alignment file. Multiple sequence alignment in one-line FASTA format.")
    parser.add_argument("-m", "--median_in", required=True, dest="median_in",
                            help="Input alignment file. Multiple sequence alignment in one-line FASTA format.")


    args = parser.parse_args() 

    seq_in = args.seq_in
    react_in = args.react_in
    median_in = args.median_in
    
    return seq_in, react_in, median_in
    

def sliding_window():
    #print('sliding window')
    
    #mean_list = []
    c =250
    window_min = 25
    window_max = 250
 
    fragment_list = []   
    for i in range(c, len(median_list), 50):
        #print(i)   
        try:
            frag1, frag2 = growing_window(i)
            #if frag1 != [1, [1,1], 1]:
            #    fragment_list.append(frag1)
            if frag2 != [1, [1,1], 1]:
                fragment_list.append(frag2)
            #print(len(fragment_list))
        except:
            pass
    
    #print(len(fragment_list))
    #print(fragment_list)
    genome_size = len(median_list)
    genome_string = ''.join(seq_list)
    out_string = '>COVID_genome\n'+genome_string+'\n'
    for i in range(0,len(fragment_list)):
        cmd = "mkdir ./inputs_sk/"+str(i)
        os.popen(cmd)

    
    for i in range(0,len(fragment_list)):
        #print(fragment_list[i][1])
        coords0 = fragment_list[i][1][0]
        #print(coords0)
        coords1 = fragment_list[i][1][1]
        seq_frag = ''.join(seq_list[coords0:coords1])
        react_frag = react_list[coords0:coords1]
        #print(seq_frag,'\n', react_frag)
        seq_string = '_'*coords0+seq_frag+'_'*(genome_size-coords1)
        fragment_name = '>Fragment_TW_No'+str(i)+'_'+str(coords0)+'_to_'+str(coords1)+'_averageSHAPE='+str(fragment_list[i][0])+'_length='+str(coords1-coords0)
        out_string += fragment_name+'\n'+seq_string+'\n'
        
        seq_for_sk = seq_frag
        react_for_sk = ','.join(react_frag)
        print(seq_for_sk)
        print(react_for_sk)
#        cmd = "mkdir ./inputs_sk/"+str(i)
#        os.popen(cmd)
        out_seq = open("./inputs_sk/"+str(i)+"/Fragment_TW_No"+str(i)+'_'+str(coords0)+'_to_'+str(coords1)+".seq", "w")
        out_seq.write('>Fragment_TW_No'+str(i)+'_'+str(coords0)+'_to_'+str(coords1)+'\n')
        out_seq.write(seq_for_sk)
        out_seq.close
        
        out_react = open("./inputs_sk/"+str(i)+"/Fragment_TW_No"+str(i)+'_'+str(coords0)+'_to_'+str(coords1)+".react", "w")
        out_react.write(react_for_sk)
        out_react.close()
        
        
    #print(out_string)    
    
#    output = open('incarnato_covid_react_mean.txt','w')
#    output.write(','.join(str(k) for k in mean_list))
#    output.close()
    
def growing_window(c):
    
    window_min = 25
    window_max = 250
    #cutoff = 0.283
    cutoff = 0.283
    
    frag_list = []
    #print('fragments for ', c)
    
    for i in range(window_min, window_max+1, 1):
        list = median_list[c-i:c+i]
        mean = get_mean(list)
        list2 = react_list[c-i:c+i]
        mean_react =  get_mean(list2)
        if mean < cutoff:
            coords = [c-i,c+i]
            frag_len = (c+i)-(c-i)
            frag_info = [mean, coords, frag_len]
            frag_list.append(frag_info)
        
    #print(frag_list,'\n')
    frag_list_sorted_by_median = sorted(frag_list, key=lambda x: x[0])
    #print(frag_list_sorted_by_median, 'sorted\n')
    frag_list_sorted_by_len = sorted(frag_list, key=lambda x: x[2], reverse=True)
    #print(frag_list_sorted_by_len, 'sorted\n')
    if len(frag_list_sorted_by_len) != 0:
    
        fragment_longest = frag_list_sorted_by_len[0]
    else:
        fragment_longest = [1, [1,1], 1]
    
    if len(frag_list_sorted_by_median) != 0:
        fragment_lowest = frag_list_sorted_by_median[0]
        #print('fragments for ', c)

        #print(fragment_longest,fragment_lowest, '\n')
        return fragment_longest, fragment_lowest
    else:
        fragment_lowest = [1, [1,1], 1]
#    print(fragment_longest,fragment_lowest)

        
def get_mean_all():
    #print('mean for all')
    react_sorted = react.copy() 
    react_sorted.sort()
    react_array = np.array(react_sorted).astype(np.float)
    mean_all = round(np.nanmean(react_array),3)
    
    #print(react_array)            
    #print(mean_all)
    return mean_all

def get_mean(list):
    list_sorted = list.copy() 
    list_sorted.sort()
    list_array = np.array(list).astype(np.float)
    mean_list = round(np.nanmean(list_array),3)
    return mean_list
    
def read_files():
    
    with open(react_in) as f:
        react_in_str = f.readline()
        react_in_list = react_in_str.split(",")
    
    #print(react_in_list)
    
    with open(median_in) as f:
        median_in_str = f.readline()
        median_in_list = median_in_str.split(",")

    #print(mean_in_list)

    with open(seq_in) as f:
        seq_in_str = f.readlines()
        seq_in_list = list(seq_in_str[1])#.split("")

    #print(seq_in_list)
    #print(len(react_in_list), len(median_in_list), len(seq_in_list))
    
    return seq_in_list, react_in_list, median_in_list
    
    
    
if __name__ == '__main__':

    # 0.283 median all
    seq_in, react_in, median_in = argument_parser()
    seq_list, react_list, median_list = read_files()
    sliding_window()