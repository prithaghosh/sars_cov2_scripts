#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import pandas as pd
import argparse
from argparse import RawTextHelpFormatter
import os
from itertools import groupby
from operator import itemgetter
import more_itertools as mit


def argument_parser():

    parser = argparse.ArgumentParser(description=__doc__, 
                        prog='fragments_varna.py', formatter_class=RawTextHelpFormatter)
    parser.add_argument("-i", "--input", dest="input",   
                        help="Input file.")
    parser.add_argument("-s", "--scores", dest="scores",   
                        help="Input file.")

    args = parser.parse_args()

    input = args.input
    scores = args.scores

    return input, scores



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
        #print(pockets_num[i])
        pocket_num_list = list(pockets_num[i])
        #print(pocket_num_list)
        for k in range(0, len(pocket_num_list)):
            if pocket_num_list[k] != "_":
                pocket_merged[k] = pocket_num_list[k]
    #print("".join(pocket_merged))
    return("".join(pocket_merged))
            
def get_varna_merged(name, seq, ss, pockets_num, fscore):
    #print("varna merged")
    print("\n"+name)
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
#    print(seq_color)
    
    string_for_color = ''
    '''
    col1 = " -basesStyle1 outline=#FF0000,label=#FFFFFF -applyBasesStyle1on " + str(seq_color[0])
    col2 = " -basesStyle2 fill=#228B22,label=#FFFFFF -applyBasesStyle2on " + str(seq_color[1])
    col3 = " -basesStyle3 fill=#0000FF,label=#FFFFFF -applyBasesStyle3on " + str(seq_color[2])
    col4 = " -basesStyle4 fill=#FF9900,label=#FFFFFF -applyBasesStyle4on " + str(seq_color[3])
    col5 = " -basesStyle5 fill=#9900FF,label=#FFFFFF -applyBasesStyle5on " + str(seq_color[4])
    col6 = " -basesStyle6 fill=#FFFF00,label=#FFFFFF -applyBasesStyle6on " + str(seq_color[5])
    '''
    
    col1 = " -basesStyle1 outline=#FF0000 -applyBasesStyle1on " + str(seq_color[0])
    col2 = " -basesStyle2 outline=#228B22 -applyBasesStyle2on " + str(seq_color[1])
    col3 = " -basesStyle3 outline=#0000FF -applyBasesStyle3on " + str(seq_color[2])
    col4 = " -basesStyle4 outline=#FF9900 -applyBasesStyle4on " + str(seq_color[3])
    col5 = " -basesStyle5 outline=#9900FF -applyBasesStyle5on " + str(seq_color[4])
    col6 = " -basesStyle6 outline=#FFFF00 -applyBasesStyle6on " + str(seq_color[5])

    #print(len(pockets_num))
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
#    print(pockets_num[0], 'pocket_num [0]')
    fscore_list = fscore.split(";")
    fscore_list = [float(i) for i in fscore_list]
#    print(fscore_list)
    max_color= str(max(fscore_list))
    max_color = '100'
    string_for_color = ''
    
#    print(seq_color)

    back_color = []
#    print(pockets_num)
#    print(len(pockets_num))
    for i in range(0, len(pockets_num)):

        pocket = list(pockets_num[i])
        #print(pocket)
        number = []
        for k in range(0, len(pocket)):
            min=''
            if pocket[k] != "_":
                number.append(k+1)
                #number = number+str(k)+"-"+str(k)+":fill=#FF0000;"
                #number += str(k+1)+","
        #print(number)
        if number!=[]:
            ranges = list(find_ranges(number))
            back_color.append(ranges)
        #else:
        #    ranges = []
        #back_color.append(ranges)#.rstrip(";")
        
    #print(back_color, 'back_color', len(back_color))
    
    
#    ranges = [list(group) for group in mit.consecutive_groups(back_color[0])]
#    print(list(find_ranges(back_color[0])))
#    quit()

    back1 = 'fill=#FF0000'
    back2 = 'fill=#228B22'
    back3 = 'fill=#0000FF'
    back4 = 'fill=#FF9900'
    back5 = 'fill=#9900FF'
    back6 = 'fill=#FFFF00'

    back = ['fill=#FF0000','fill=#228B22','fill=#0000FF','fill=#FF9900','fill=#9900FF','fill=#FFFF00']
    # red, green, blue, orange, pruple, yellow
    back = ['fill=#F4CCCC','fill=#93C47D','fill=#9FC5E8','fill=#F9CB9C','fill=#B4A7D6','fill=#FFD966']
    back = ['fill=#','fill=#','fill=#','fill=#','fill=#','fill=#']
    back = ['fill=#E06666','fill=#00FF00','fill=#00FFFF','fill=#FF9900','fill=#9900FF','fill=#FFFF00']
    string_background = ""
    
    for i in range(0,len(back_color)):
        for k in range(len(back_color[i])):
            beg = str(back_color[i][k][0])
            end = str(back_color[i][k][1])
            string_background = string_background + beg+"-"+end+":"+back[i]+",outline=#FFFFFF;"
    #print(string_background.rstrip(";"))
#    quit()



    colormap_style = '0:#fff2cc;25.0:#ff9900;50.0:#ff0000;100.0:#980000'
    cmd = 'java -cp ' + VaRNA_path + ' fr.orsay.lri.varna.applications.VARNAcmd ' + " -sequenceDBN '" + seq + "'"+\
        " -baseNum '#FFFFFF' -baseName '#000000' -structureDBN '" + ss + "' -o " + name + "_linear.png -resolution 10.0" + string_for_color + " -title '" + name + "' -titleSize 6 "+\
        " -colorMapMin '0.0' -colorMapMax '"+max_color+"' -colorMap '" + fscore + "' -colorMapStyle '"+colormap_style+"' -highlightRegion '"+string_background.rstrip(";")+"'" #10-10:fill=#FF0000;12-13:fill=#FF0000'" # ,radius=15'"    #'0:#000000;50:#228B22;100:#FFFFFF' -colorMap '" + fscore + "'"

    cmd2 = 'java -cp ' + VaRNA_path + ' fr.orsay.lri.varna.applications.VARNAcmd ' + " -sequenceDBN '" + seq + "'"+\
        " -baseNum #FFFFFF -baseName '#000000' -structureDBN '" + ss + "' -title '" + name + "' -titleSize 6 -resolution 10.0"+\
        " -colorMapMin '0.0' -colorMapMax '"+max_color+"' -colorMap '" + fscore + "' -colorMapStyle '"+colormap_style+"' -highlightRegion '"+string_background.rstrip(";")+"'"
    print(cmd2)
    #quit()
#    print(fscore)
    os.system(cmd)
    #quit()
#    quit()
#    cmd +=  " -algorithm naview"
#    cmd = cmd.replace("_linear.png", "_naview.png") 
#    os.system(cmd)


def find_ranges(iterable):
    """Yield range of consecutive numbers."""
    for group in mit.consecutive_groups(iterable):
        group = list(group)
        if len(group) == 1:
            yield [group[0], group[0]]
        else:
            yield [group[0], group[-1]]
    return group

def read_scores(input):
    
    score_list = []
    with open(input) as file:
        for line in file:
            if line[0] == ">":
                name = line.strip()
                score = next(file).replace(",",";").strip()
                score_list.append([name,score])
    
    #print(score_list)
    return score_list


def add_score(score_list, pkey):
    
    for i in range(0, len(score_list)):
        if pkey == score_list[i][0]:
            score = score_list[i][1]
    return score
    
    
def iterate_fragments(fragments, score_list):
    
    #print("iterate_fragments")

    for pkey, item_list in fragments.items():
        pockets_P = item_list[3]
        pockets_num = P_to_numbers(pockets_P)
        fragments[pkey].append(pockets_num)
    #print(fragments)
    
    for pkey, item_list in fragments.items():
        pockets_num = item_list[4]
        if len(pockets_num) > 1:
            merged_pockets = merge_pockets(pockets_num)
        else:
            merged_pockets = "".join(pockets_num)
        fragments[pkey].append(merged_pockets)
    #print(fragments)
    
    for pkey, item_list in fragments.items():
        score_to_add = add_score(score_list, pkey)
        fragments[pkey].append(score_to_add)
    #print(fragments)
    #quit()
    for pkey, item_list in fragments.items():
        name = item_list[0]
        seq = item_list[1]
        ss = item_list[2]
        pockets = item_list[4]
        score = item_list[6]
        get_varna_merged(name,seq, ss, pockets, score)

def main_function():

    input_file, input_scores = argument_parser()
    #print(input_file)
    fragments = read_file(input_file)
    score_list = read_scores(input_scores)
    iterate_fragments(fragments, score_list)
    
    print("done")

if __name__ == "__main__":

    VaRNA_path = "/home/fryzjer/Projects/shape-backend/VARNAv3-93.jar"

    main_function()
