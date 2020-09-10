#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
Author: Pritha Ghosh, Tomasz Wirecki, Bujnicki Lab, IIMCB in Warsaw
Date: June 2020

Script for finding pockets, basing on the secondary sturcture and pockets reported by Fpocket

Usage:
find_pockets_from_ss.py -i input_file

For more help use:
find_pockets_from_ss.py -h
"""

import argparse

des = "Script to annotate pairing partner in secondary structures to binding pockets"
input_help_text = "Input file format:\n>segment_name\n(((...)))\n__P______"
output_help_text = "Expected output file:\n>segment_name\n(((...)))\n__P___p__"

parser = argparse.ArgumentParser(
    description=f"{des}\n\n{input_help_text}\n\n{output_help_text}",
    formatter_class=argparse.RawTextHelpFormatter)

parser.add_argument("-i",
                    "--input",
                    help="Name of the input file")
parser.add_argument("-o",
                    "--output",
                    default="out.txt",
                    help="Name of the output file (default=out.txt)")
parser.add_argument("-p",
                    "--pocket",
                    default="p",
                    help="Pairing Partner Letter (default=p)")
args = parser.parse_args()


def get_fragments(ss_pockets):
    """
    Parses the input file and returns its content in the form of a
    dictionary where key is the name of the fragment and value is the list
    of secondary structure and pockets
    :param ss_pockets: Name of input file
    """
    my_dict = {}
    with open(ss_pockets) as file:
        for line in file:
            segment = line.strip()
            ss = next(file).strip()
            pocket = next(file).strip()# .replace("P_","PP").replace("_P","PP") # adding onP before and one P after
            pocket_ext = pocket# .replace("P_","PP").replace("_P","PP")
            my_dict[segment] = [ss, pocket, pocket_ext]
        return my_dict


def get_brackets(ss_string, type_open, type_close):
    """
    Returns the positions of brackets
    :param ss_string: Secondary Structure String
    :param type_open: Type of opening bracket (e.g. '(', '[')
    :param type_close: Type of closing bracket (e.g. ')', ']')
    """
    full_brackets = []
    start_loc = []
    for i, s in enumerate(ss_string):
        if s == type_open:
            start_loc.append(i)
        if s == type_close:
            element = (start_loc[-1], i)
            full_brackets.append(element)
            start_loc.pop(-1)
    return sorted(full_brackets)


def get_pocket_positions(pocket_str):
    """
    Returns positions of the pockets that are annotated by "P"
    :param pocket_str: Positions of Pockets
    """
    locations = []
    counter = 0
    for p in pocket_str:
        if p == "P":
            locations.append(counter)
        counter += 1
    return locations


def check_pocket_pairs(pockets, open_bracket, close_bracket):
    """
    Checks if the pairing partner of a "P" is also annotated with a "P",
    else annotates it as a "p"
    :param pockets: Positions of the pockets
    :param open_bracket: Type of opening bracket
    :param close_bracket: Type of closing bracket
    """
    letter = args.pocket
    corrected_pockets = {}
    for pkey, item_list in pockets.items():
        brackets = get_brackets(item_list[0], open_bracket, close_bracket)
        start_dict = {x[0]: x[1] for x in brackets}
        end_dict = {x[1]: x[0] for x in brackets}
        pocket_locations = get_pocket_positions(item_list[1])
        new_string = item_list[1]
        for loc in pocket_locations:
            if item_list[0][loc] == open_bracket:
                end_pos = start_dict[loc]
                if new_string[end_pos] == "_":
                    new_string = new_string[:end_pos] + letter + new_string[
                                                                 end_pos + 1:]
            elif item_list[0][loc] == close_bracket:
                start_pos = end_dict[loc]
                if new_string[start_pos] == "_":
                    new_string = new_string[:start_pos] + letter + new_string[
                                                                   start_pos + 1:]
        corrected_pockets[pkey] = new_string
    return corrected_pockets

def pairs_for_long_P(pocket, ss_list):
    
    pair_list = []
    for i in range(0,len(pocket)):
        if pocket[i] == "P":
            for k in range(0,len(ss_list)):
                if (ss_list[k][0] == i): 
                    pair_list.append(ss_list[k])
                elif ss_list[k][1] == i:
                    pair_list.append(ss_list[k])
    uniq_pair_list = uniq_pairs(pair_list)
    
    return uniq_pair_list


def uniq_pairs(pairs): 
  
    uniq = [] 
      
    for x in pairs: 
        if x not in uniq: 
            uniq.append(x) 
    return uniq
    
    
def bracket_to_pair(ss):

    db_list = [['(',')'],['[',']']]

    stack_list = []
    pairs_list = []

    # stack-pop for all versions of brackets form the db_list    
    for i in range(0, len(db_list)):
        for c, s in enumerate(ss):
            if s == db_list[i][0]:
                stack_list.append(c)
            elif s == db_list[i][1]:
                if len(stack_list) == 0:
                    raise IndexError("There is no opening bracket for nt position "+str(c+1)+'-'+ss[c])
                elif s == db_list[i][1]:
                    pairs_list.append([stack_list.pop(), c])

        if len(stack_list) > 0:
            err = stack_list[i].pop()
            raise IndexError("There is no closing bracket for nt position "+str(err)+'-'+ss[err])
    return pairs_list


def remove_short_P(string):
    
    string = "x"+string+"x"
    string = string.replace("P_","Px_").replace("_P","_xP")
    string = string.replace("xPx","_").replace("xPPx","__").replace("xPPPx","___").replace("xPPPPx","____") # now 5P will be included ##.replace("xPPPPPx","_____") # now 6P will be included
    #string = string.replace("xPx","_").replace("xPPx","__").replace("xPPPx","___")# now 4P will be included   ##.replace("xPPPPx","____").replace("xPPPPPx","_____") # now 6P will be included
    string = string.replace("x","")
    return string

def get_partners_for_long_P(long_P, all_P, pairs_long_P):
    
    part_added_P = long_P.copy()
    
    for i in range(0, len(all_P)):
        if all_P[i] == "P":
            for k in range(0, len(pairs_long_P)):
                if (pairs_long_P[k][0] == i):
                    part_added_P[i] = "P"
                elif (pairs_long_P[k][1] == i):
                    part_added_P[i] = "P"  
    
    added_P = part_added_P.copy()
    for i in range(0, len(part_added_P)):
        if (part_added_P[i] == "P") and (long_P[i] == "_"):
            position = i
            try:
                while (all_P[position] == "P"): # and (all_P[position] == True):
                    added_P[position] = "P"
                    if position > 0:
                        position -= 1
                    else:
                        break    
            except:
                pass
            position = i
            try:
                while (all_P[position] == "P"): # and (all_P[position] == True):
                    added_P[position] = "P"
                    position += 1
            except:
                pass
                
    final = "".join(added_P)
    return final


def add_small_p(pocket_P, pairs_P):
    
    pocket_p = pocket_P.copy()
    
    for i in range(0, len(pocket_P)):
        if pocket_P[i] == "P":
             for k in range(0, len(pairs_P)):
                if (pairs_P[k][0] == i) and (pocket_P[pairs_P[k][1]] == "_"):
                    pocket_p[pairs_P[k][1]] = "p"
                elif (pairs_P[k][1] == i) and (pocket_P[pairs_P[k][0]] == "_"):
                    pocket_p[pairs_P[k][0]] = "p"
    return "".join(pocket_p)

def separate_pockets(pockets_all, pairs_all):
    

    sep = pockets_all.copy()

    string_pockets_all = "".join(pockets_all)
    
    xstring = string_pockets_all.replace("p","P").replace("_P","_xP").replace("P_","Px_")
    print(string_pockets_all)
    xstring_splitted = xstring.split("x")
    count = ['1','2','3','4','5','6','7','8','9','0','A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','X','Y','Z',\
            'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','x','y','z']
    number =0
    for i in range(0, len(xstring_splitted)):
        if "P" in xstring_splitted[i]:
            xstring_splitted[i] = xstring_splitted[i].replace("P",count[number])
            number+=1
    pockets_numbered = "".join(xstring_splitted)
    pockets_numbered_list = list(pockets_numbered)
        
    list_of_pairs_fragments = [[] for i in range(0,len(count))]
    for x in range(0,len(count)):
        pair_x = list_of_pairs_fragments[x]
        for i in range(0, len(pockets_numbered_list)):
            if pockets_numbered_list[i] == str(count[x]):
                for k in range(0,len(pairs_all)):
                    if (pairs_all[k][0] == i) or (pairs_all[k][1] == i):
                        pair_x.append(pairs_all[k])
    pockets = []
    for i in range(0,len(list_of_pairs_fragments)):
        pockets.append([])
        for k in range(1,len(list_of_pairs_fragments)):
            is_common = common_data(list_of_pairs_fragments[i], list_of_pairs_fragments[k])
            if is_common == True:
                pockets[i].append(str(k+1))
                pockets[i].append(str(i+1))
    pockets = [x for x in pockets if x != []]
    
    
    for i in range(0, len(pockets)):
        
        for k in range(0,len(pockets)):
            is_common = common_data(pockets[i], pockets[k])
            if is_common ==True:
                pockets[i] = sorted(uniq_pairs(pockets[i]+pockets[k]))
                
    pockets_uniq = uniq_pairs(pockets)
    pockets_sorted = []
    alphabet = {'1':'1','2':'2','3':'3','4':'4','5':'5','6':'6','7':'7','8':'8','9':'9','10':'0','11':'A','12':'B','13':'C',\
                '14':'D','15':'E','16':'F','17':'G','18':'H','19':'I','20':'J','21':'K','22':'L','23':'M','24':'N','25':'O',\
                '26':'P','27':'Q','28':'R','29':'S','30':'T','31':'U','32':'V','33':'X','34':'Y','35':'Z',\
                '36':'a','37':'b','38':'c','39':'d','40':'e','41':'f','42':'g','43':'h','44':'i','45':'j','46':'k','47':'l',\
                '48 ':'m','49':'n','50':'o','51':'p','52':'q','53':'r','54':'s','55':'t','56':'u','57':'v','58':'x','59':'y','60':'z'}
 
    for i in range(0, len(pockets_uniq)):
        for k in range(0, len(pockets_uniq[i])):
            pockets_uniq[i][k] = alphabet[pockets_uniq[i][k]]
        pockets_sorted.append(sorted(pockets_uniq[i]))
    
    print(sorted(pockets_sorted))
    final_list_pockets = sorted(pockets_sorted)
    
    final_list_pockets_string = []
    for i in range(0, len(final_list_pockets)):
        string = ''
        for k in range(0,len(pockets_numbered_list)):
            if pockets_numbered_list[k] in final_list_pockets[i]:
                string += pockets_numbered_list[k]
            else:
                string += '_'
        print(string)
        final_list_pockets_string.append(string)
        
    
    joined_pockets = list("_"*len(string_pockets_all)) 
    for i in range(0,len(final_list_pockets_string)):
        for k in range(0, len(final_list_pockets_string[i])):
            if final_list_pockets_string[i][k] != "_":
                joined_pockets[k] = "z"
    print("".join(joined_pockets),'joined_pockets')
    joined_pockets_string = "".join(joined_pockets)
    
    lonely_pocket = list("_"*len(pockets_all))
    for i in range(0, len(pockets_all)):
        if (pockets_all[i] == "P") and (joined_pockets[i] != "z"):
            lonely_pocket[i] = "z"
        else:
            lonely_pocket[i] = "_"
    print("".join(pockets_all), 'all')
    print("".join(lonely_pocket), "lonely pocket")
        
    print(string_pockets_all)
    print("\n")
    if "z" in ("".join(lonely_pocket)):
        final_list_pockets_string.append("".join(lonely_pocket))
    return(final_list_pockets_string)


    
    
def common_data(list1, list2): 
    result = False
  
    for x in list1: 
        for y in list2: 
            if x == y: 
                result = True
                return result  
                  
    return result 

    
def main_function():
    if args.input is None:
        raise FileNotFoundError("Please provide input file with '--input' "
                                "argument. Use -h for more help.")
    all_pockets = get_fragments(args.input)

    for pkey, item_list in all_pockets.items():
        pairs = bracket_to_pair(item_list[0])
        all_pockets[pkey].append(pairs)

    for pkey, item_list in all_pockets.items():
        capital_P = item_list[2]
        short_P_removed = remove_short_P(capital_P)
        all_pockets[pkey].append(short_P_removed)

    for pkey, item_list in all_pockets.items():
        pocket_P = item_list[4]
        pairs_all = item_list[3]
        pairs_P = pairs_for_long_P(pocket_P, pairs_all)
        all_pockets[pkey].append(pairs_P)
    
    for pkey, item_list in all_pockets.items():
        long_P = list(item_list[4])
        all_P = list(item_list[2])
        pairs_long_P = item_list[5]
        elongated_short_P = get_partners_for_long_P(long_P, all_P, pairs_long_P) # long_P, all_P, pairs_long_P
        all_pockets[pkey].append(elongated_short_P)

    for pkey, item_list in all_pockets.items():
        elongated_short_P = item_list[6]
        pairs_all = item_list[3]
        pairs_elongated_P = pairs_for_long_P(elongated_short_P, pairs_all)
        all_pockets[pkey].append(pairs_elongated_P)
        
    for pkey, item_list in all_pockets.items():
        pocket_P = list(item_list[6])
        pairs_P = item_list[7]
        Pp = add_small_p(pocket_P, pairs_P)
        all_pockets[pkey].append(Pp)
    
    for pkey, item_list in all_pockets.items():
        pockets_all= list(item_list[8])
        pairs_all = item_list[3]
        pockets_separated = separate_pockets(pockets_all, pairs_all)
        all_pockets[pkey].append(pockets_separated)
    
    with open(args.output, "w") as f:
        for key in all_pockets:
            print(key, file=f)
            print(all_pockets[key][0], file=f)
            print(all_pockets[key][1], file=f)
            print(all_pockets[key][8], file=f)
            print("\n".join(all_pockets[key][9]), file=f)


if __name__ == "__main__":
    main_function()



##############################################################
'''
all_pockets dictionary format: 

key: name of fragment

item_list[0] - sec struct dot bracket
item_list[1] - Pritha annotation P (pockets derived from analysis of pdbs)
item_list[2] - P+-1
item_list[3] - sec struct as a list of pairs derived from dot-bracket for whoe structure
item_list[4] - P annotation for streches of P =< 6 (or 5)
item_list[5] - list of pairs for residues fro P streches longer-equal than 6 (or 5)
item_list[6] - P annotation with added small p which are the base pair partners for capital P
item_list[7] - list of pairs for P and p annotated (from item_list[6])
item_list[8] - strecht of P extended by the residues initially in the strech (from item_list[2])
item_list[9] - final list of separated pockets

'''
