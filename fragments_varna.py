#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import pandas as pd
import argparse
from argparse import RawTextHelpFormatter
import os



def argument_parser():

    parser = argparse.ArgumentParser(description=__doc__, 
                        prog='fragments_varna.py', formatter_class=RawTextHelpFormatter)
    parser.add_argument("-i", "--input", dest="input",   
                        help="Input file.")

    args = parser.parse_args()

    input = args.input

    return input



def read_file(input_file):

    my_dict = {}
    with open(input_file) as file:
        for line in file:
            if line[0] == ">":
                pocket_list = []
                fragment = line.strip()
                name = next(file).strip()
                seq = next(file).strip()
                ss = next(file).strip()
            else:
                pocket = line.strip()
                pocket_list.append(pocket) 
            
            my_dict[fragment] = [name, seq, ss, pocket_list]
    
    #print(my_dict)
    return my_dict
    
    
    
def P_to_numbers(fragments_P):
    
    fragments_num_list = []
    #print(fragments_P)
    for i in range(0, len(fragments_P)):
        #print(fragments_P[i])
        fragments_P_list = list(fragments_P[i])
        fragment ="_"*len(fragments_P_list)
        fragment_list = list(fragment) 
        #print(fragment_list)
        for k in range(0,len(fragments_P_list)):
            if fragments_P_list[k] == "P": 
                fragment_list[k] = str(i+1)
            else:
                fragment_list[k] = "_"
        fragments_num_list.append("".join(fragment_list))
    
    #print(fragments_num_list)
    return fragments_num_list
    
    
def merge_pockets(pockets_num):
    
    pocket_merged = list("_"* len(pockets_num[0]))
    for i in range(0, len(pockets_num)):
        print(pockets_num[i])
        pocket_num_list = list(pockets_num[i])
        print(pocket_num_list)
        for k in range(0, len(pocket_num_list)):
            if pocket_num_list[k] != "_":
                pocket_merged[k] = pocket_num_list[k]
    print("".join(pocket_merged))
    return("".join(pocket_merged))
            
def get_varna_merged(name, seq, ss, pockets_num):
    print("varna merged")

    '''
    cmd = 'java -cp ' + config_paths.VaRNA_path + ' fr.orsay.lri.varna.applications.VARNAcmd -sequenceDBN ' + seq + \
        " -structureDBN '" + fold_ss + "' -o " + result_varna_method + "_radiate.png  \
          -colorMapMin '0.0' -colorMapMax '1.0' -colorMapStyle '"+colormap+"' -colorMap '" + col2 + \
          "' -resolution 10.0"
    '''
    seq_color = [[],[],[],[],[],[]]
    #print(pockets_num)
    for i in range(0, len(pockets_num)):
        
        pocket = list(pockets_num[i])
        #print(pocket)
        number = ""
        for k in range(0, len(pocket)):
            if pocket[k] != "_":
                number += str(k+1)+","
        #print(number)
        seq_color[i]= number.rstrip(",")
    #print(seq_color)
    
    string_for_color = ''
    
    col1 = " -basesStyle1 fill=#FF0000,label=#FFFFFF -applyBasesStyle1on " + str(seq_color[0])
    col2 = " -basesStyle2 fill=#228B22,label=#FFFFFF -applyBasesStyle2on " + str(seq_color[1])
    col3 = " -basesStyle3 fill=#0000FF,label=#FFFFFF -applyBasesStyle3on " + str(seq_color[2])
    col4 = " -basesStyle4 fill=#FF9900,label=#FFFFFF -applyBasesStyle4on " + str(seq_color[3])
    col5 = " -basesStyle5 fill=#9900FF,label=#FFFFFF -applyBasesStyle5on " + str(seq_color[4])
    col6 = " -basesStyle6 fill=#FFFF00,label=#FFFFFF -applyBasesStyle6on " + str(seq_color[5])
    
    print(len(pockets_num))
    if  '1' not in pockets_num[0]:
        string_for_color = ''
    elif (len(pockets_num) == 1) and '1' in pockets_num[0]:
        string_for_color = col1
    elif len(pockets_num) == 2:
        string_for_color = col1 +col2
    elif len(pockets_num) == 3:
        string_for_color = col1 +col2 +col3
    elif len(pockets_num) == 4:
        string_for_color = col1 +col2 +col3 +col4
    elif len(pockets_num) == 5:
        string_for_color = col1 +col2 +col3 +col4 +col5
    elif len(pockets_num) == 6:
        string_for_color = col1 +col2 +col3 +col4 +col5 +col6
    else:
        string_for_color = ''
    #print(string_for_color)
    print(pockets_num[0], 'pocket_num [0]')
    #if any(c not in '123456' for c in pockets_num[0]):  # Don't use str as a name.
     
     #   cmd = 'java -cp ' + VaRNA_path + ' fr.orsay.lri.varna.applications.VARNAcmd ' + \
      #  " -structureDBN '" + ss + "' -o " + name + "_linear.png -resolution 10.0"
#    os.system(cmd)
        #print(len(pockets_num), 'len pock num')
    
    cmd = 'java -cp ' + VaRNA_path + ' fr.orsay.lri.varna.applications.VARNAcmd ' + " -sequenceDBN '" + seq + "'"+\
        " -structureDBN '" + ss + "' -o " + name + "_linear.png -resolution 10.0" + string_for_color + " -title '" + name + "' -titleSize 6"# -annotations 'P1:anchor=60'"  

    os.system(cmd)
#    quit()
    cmd +=  " -algorithm naview"
    cmd = cmd.replace("_linear.png", "_naview.png") 
    os.system(cmd)
    
def iterate_fragments(fragments):
    
    print("iterate_fragments")

    for pkey, item_list in fragments.items():
        pockets_P = item_list[3]
        pockets_num = P_to_numbers(pockets_P)
        fragments[pkey].append(pockets_num)
    print(fragments)
    
    for pkey, item_list in fragments.items():
        pockets_num = item_list[4]
        if len(pockets_num) > 1:
            merged_pockets = merge_pockets(pockets_num)
        else:
            merged_pockets = "".join(pockets_num)
        fragments[pkey].append(merged_pockets)
    print(fragments)
    
    for pkey, item_list in fragments.items():
        name = item_list[0]
        seq = item_list[1]
        ss = item_list[2]
        pockets = item_list[4]
        get_varna_merged(name,seq, ss, pockets)

def main_function():

    input_file = argument_parser()
    #print(input_file)
    fragments = read_file(input_file)
    iterate_fragments(fragments)
    
    print("done")

if __name__ == "__main__":

    VaRNA_path = "/home/fryzjer/Projects/shape-backend/VARNAv3-93.jar"

    main_function()
