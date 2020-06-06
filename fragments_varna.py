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



def draw_VaRNA(seq, fold_ss, result_varna_method, colormap, col):

    col2 = col.replace("0.00", "0.001")

    cmd = 'java -cp ' + config_paths.VaRNA_path + ' fr.orsay.lri.varna.applications.VARNAcmd -sequenceDBN ' + seq + \
        " -structureDBN '" + fold_ss + "' -o " + result_varna_method + "_radiate.png -title '" + result_varna_method + "'  \
          -colorMapMin '0.0' -colorMapMax '1.0' -colorMapStyle '"+colormap+"' -colorMap '" + col2 + \
          "' -resolution 10.0 -titleSize 8"
    if '(' not in fold_ss[1:-1]: # safety fuse for structures without any structure (only dots)
        cmd += " -bpStyle none -bp '#ffffff'"
    
    os.system(cmd)
    
    cmd = cmd.replace("_radiate.png", "_circular.png")
    cmd += " -algorithm circular"

    os.system(cmd)

    cmd = cmd.replace("circular", "line")
    cmd = cmd.replace("_circular.png", "_line.png")
    os.system(cmd)



def draw_VaRNA_nt(seq, fold_ss, result_varna_method, colormap, col):

    col2 = col.replace("0.00", "0.001")
    
    if greynt == 'on' and ((method == 'dms') or (method=='dms_custom') or (method =='cmct') or (method =='cmct_custom')):
        if (method == 'dms') or (method == 'dms_custom'):
            nt1="U"
            nt2="G"
        elif (method == 'cmct') or (method == 'cmct_custom'):
            nt1="A"
            nt2="C"
        c=0
        greyout=''
        c2 = col2.split(";")
        z = zip(seq,c2)
        for i,j in z:
            c +=1
            if (i ==nt1 or i == nt2) and j!='-1.0':
                greyout +=str(c)+','
                c2[c-1]='0.0'
        col2 = ';'.join(c2)
    
    
    cmd = 'java -cp ' + config_paths.VaRNA_path + ' fr.orsay.lri.varna.applications.VARNAcmd -sequenceDBN ' + seq + \
        " -structureDBN '" + fold_ss + "' -o " + result_varna_method + "_radiate.png  \
          -colorMapMin '0.0' -colorMapMax '1.0' -colorMapStyle '"+colormap+"' -colorMap '" + col2 + \
          "' -resolution 10.0"
    if greynt == 'on' and ((method == 'dms') or (method=='dms_custom') or (method =='cmct') or (method =='cmct_custom')):
        cmd +=" -basesStyle1 fill=#bdbdbd,outline=#bdbdbd,label=#bdbdbd -applyBasesStyle1on '" + greyout +"'"
    if '(' not in fold_ss[1:-1]: # safety fuse for structures without any structure (only dots)
        cmd += " -bpStyle none -bp '#ffffff'"

    os.system(cmd)
    

    cmd = cmd.replace("_radiate.png", "_circular.png")
    cmd += " -algorithm circular"
    os.system(cmd)

    cmd = cmd.replace("circular", "line")
    cmd = cmd.replace("_circular.png", "_line.png")
    os.system(cmd)



def read_file(input_file):

    my_dict = {}
    with open(input_file) as file:
        for line in file:
            if line[0] == ">":
                pocket_list = []
                fragment = line.strip()
                name = next(file).strip()
                ss = next(file).strip()
            else:
                pocket = line.strip()
                pocket_list.append(pocket) 
            
            my_dict[fragment] = [name, ss, pocket_list]
    
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
            
def get_varna_merged(name, ss, merged_pockets):
    print("varna merged")

    '''
    cmd = 'java -cp ' + config_paths.VaRNA_path + ' fr.orsay.lri.varna.applications.VARNAcmd -sequenceDBN ' + seq + \
        " -structureDBN '" + fold_ss + "' -o " + result_varna_method + "_radiate.png  \
          -colorMapMin '0.0' -colorMapMax '1.0' -colorMapStyle '"+colormap+"' -colorMap '" + col2 + \
          "' -resolution 10.0"
    '''
    

    cmd = 'java -cp ' + VaRNA_path + ' fr.orsay.lri.varna.applications.VARNAcmd ' + \
        " -structureDBN '" + ss + "' -o " + name + ".png -resolution 10.0" + \
        " -basesStyle1 fill=#FF0000 -applyBasesStyle1on 20"
    os.system(cmd)

def iterate_fragments(fragments):
    
    print("iterate_fragments")

    for pkey, item_list in fragments.items():
        pockets_P = item_list[2]
        pockets_num = P_to_numbers(pockets_P)
        fragments[pkey].append(pockets_num)
    print(fragments)
    
    for pkey, item_list in fragments.items():
        pockets_num = item_list[3]
        if len(pockets_num) > 1:
            merged_pockets = merge_pockets(pockets_num)
        else:
            merged_pockets = "".join(pockets_num)
        fragments[pkey].append(merged_pockets)
    print(fragments)
    
    for pkey, item_list in fragments.items():
        name = item_list[0]
        ss = item_list[1]
        merged_pockets = item_list[4]
        get_varna_merged(name, ss, merged_pockets)

def main_function():

    input_file = argument_parser()
    #print(input_file)
    fragments = read_file(input_file)
    iterate_fragments(fragments)
    
    print("done")

if __name__ == "__main__":

    VaRNA_path = "/home/fryzjer/Projects/shape-backend/VARNAv3-93.jar"

    main_function()
