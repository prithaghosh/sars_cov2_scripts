#!/usr/bin/env python3
# -*- coding: utf-8 -*-


"""
Author: Pritha Ghosh, Bujnicki Lab, IIMCB in Warsaw
Date: 1 June 2020

Script to annotate pairing partner in secondary structures to binding pockets

Usage:
python3 find_pairing_partners.py --input input_file

For more help use:
python3 find_pairing_partners.py -h
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
            pocket = next(file).strip().replace("P_","PP").replace("_P","PP") # adding onP before and one P after
            my_dict[segment] = [ss, pocket]
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

    #ss = "(((((((((........((.((((.[..)))).)).(((.].))).....)))))))))...................((((.(((((((....))))))).))))"

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
#    print pairs_list, ' p_list'
    #print(stack_list)
    return pairs_list


def remove_short_P(string):
    
    string = "x"+string+"x"
    string = string.replace("P_","Px_").replace("_P","_xP")
    string = string.replace("xPx","_").replace("xPPx","__").replace("xPPPx","___").replace("xPPPPx","____").replace("xPPPPPx","_____")
    string = string.replace("x","")
    return string

def get_partners_for_long_P(long_P, all_P, pairs_long_P):
    
    #long_P = list("____________________________________________________PPPPPP___________________________________________PPPPPPP______PPPPPPPPP_______PPPPPPPP__________________________________________")
    #all_P  = list("_________________________________________PPP________PPPPPP______PPPPP_________________PPPPP______PPP_PPPPPPP______PPPPPPPPP_______PPPPPPPP____________________________PPPP__________")
    #pairs_long_P = [[45, 52], [44, 53], [43, 54], [42, 55], [56, 111], [57, 110], [92, 101], [65, 102], [64, 103], [63, 104], [62, 105], [61, 106], [60, 107], [114, 131], [115, 130], [116, 129], [117, 128], [122, 174], [113, 132], [112, 133], [136, 167], [137, 166]]
    #part_added_P = list("_"*len(all_P))
    part_added_P = long_P.copy()
    print(len(pairs_long_P))
    print("".join(long_P).count("P"))
    print("".join(part_added_P), "part_added")
    print("".join(all_P),"all P")
    print("".join(long_P),"long P")
    
    for i in range(0, len(all_P)):
        if all_P[i] == "P":
            for k in range(0, len(pairs_long_P)):
                if (pairs_long_P[k][0] == i):
                    part_added_P[i] = "P"
                elif (pairs_long_P[k][1] == i):
                    part_added_P[i] = "P"  
    
            #print("kupka")
            
    print("".join(part_added_P), "part added")        
            
    added_P = part_added_P.copy()
    for i in range(0, len(part_added_P)):
        if (part_added_P[i] == "P") and (long_P[i] == "_"):
            position = i
            #print(i)
            #print(position, len(all_P))
            try:
                while (all_P[position] == "P"): # and (all_P[position] == True):
                #print(position, "pos")
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
                #print(position, "pos")
                    added_P[position] = "P"
                #print(position,'inside')
                    position += 1
            except:
                pass
                
    print("".join(part_added_P), "part added")
    print("".join(part_added_P).count("P"))
    print("".join(added_P), "added_P")
    final = "".join(added_P)
    return final


def add_small_p(pocket_P, pairs_P):
    
    #pocket_P = list("_________________________________________PPP________PPPPPP______PPPPP________________________________PPPPPPP______PPPPPPPPP_______PPPPPPPP____________________________PPPP__________")
    pocket_p = pocket_P.copy()
    #pairs_P = [[0, 41], [42, 55], [43, 54], [45, 52], [44, 53], [56, 111], [57, 110], [64, 103], [65, 102], [67, 86], [68, 85], [92, 101], [63, 104], [62, 105], [61, 106], [60, 107], [114, 131], [115, 130], [116, 129], [117, 128], [122, 174], [113, 132], [112, 133], [136, 167], [137, 166]]
    #db = "((((((...(((.(((((.....)))))..)))...))))))(((((....)))))((((((((((.(((.((((....)))).))).....((......))))))))))))((((((....[[[[..))))))..(((((((((((((....)).))).))))))))...]]]]....." 
    
    for i in range(0, len(pocket_P)):
        if pocket_P[i] == "P":
             for k in range(0, len(pairs_P)):
                if (pairs_P[k][0] == i) and (pocket_P[pairs_P[k][1]] == "_"):
                    pocket_p[pairs_P[k][1]] = "p"
                elif (pairs_P[k][1] == i) and (pocket_P[pairs_P[k][0]] == "_"):
                    pocket_p[pairs_P[k][0]] = "p"
    print("\n")
    #print(db)
    #print("".join(pocket_P))
    #print("".join(pocket_p))
    #quit()
    return "".join(pocket_p)

def separate_pockets(pockets_all, pairs_all):
    

    #pockets_all = list("p________________________________________PPPpp______PPPPPP__ppppPPPPP________________pp_____p________PPPPPPP__ppppPPPPPPPPP_____ppPPPPPPPP____________________________PPPP____p_____")
    #pairs_all = [[17, 23], [16, 24], [15, 25], [14, 26], [13, 27], [11, 30], [10, 31], [9, 32], [5, 36], [4, 37], [3, 38], [2, 39], [1, 40], [0, 41], [46, 51], [45, 52], [44, 53], [43, 54], [42, 55], [74, 79], [73, 80], [72, 81], [71, 82], [69, 84], [68, 85], [67, 86], [93, 100], [92, 101], [65, 102], [64, 103], [63, 104], [62, 105], [61, 106], [60, 107], [59, 108], [58, 109], [57, 110], [56, 111], [117, 128], [116, 129], [115, 130], [114, 131], [113, 132], [112, 133], [148, 153], [147, 154], [146, 156], [145, 157], [144, 158], [143, 160], [142, 161], [141, 162], [140, 163], [139, 164], [138, 165], [137, 166], [136, 167], [125, 171], [124, 172], [123, 173], [122, 174]]
#    db = 	       "......(((((.(((((....)))))..)))))...........(((((.....))))).((((.......))))........((((((((.((..(((.(((.....))).))).)).))))))))......................"
#    pockets_all = list('PPPPPPPPpp___________________PPPPPPPPPPPPPPPPP___________PPPPP___________PPPPPPP___pp________________________________________PPPPPPPP________________')
#    pairs_all = [[16, 21], [15, 22], [14, 23], [13, 24], [12, 25], [10, 28], [9, 29], [8, 30], [7, 31], [6, 32], [48, 54], [47, 55], [46, 56], [45, 57], [44, 58], [63, 71], [62, 72], [61, 73], [60, 74], [102, 108], [101, 109], [100, 110], [98, 112], [97, 113], [96, 114], [93, 116], [92, 117], [90, 119], [89, 120], [88, 121], [87, 122], [86, 123], [85, 124], [84, 125], [83, 126]]
    #db = '((((((.((((..(((((...(((.(((((((((((..((((((.(((((......)))))..))))))......)))(((((((...........)))))))(((....)))))))))))))).))))).))))....))))))......(((((((...........((((((...))))))....)))))).)...(((((.((((((.((.(((.....)))..))...)))))).)))))' 
    #pockets_all = list("PP__________________________ppPPPPPPP_p_____________________________PPPPPP_ppp___________________________________PPPPP_________________________pPPPPPPPPP__ppPPPPP_______________________PPPPPP__p_p_________________________________________________")
    #pairs_all = [[49, 56], [48, 57], [47, 58], [46, 59], [45, 60], [43, 63], [42, 64], [41, 65], [40, 66], [39, 67], [38, 68], [35, 75], [34, 76], [33, 77], [84, 96], [83, 97], [82, 98], [81, 99], [80, 100], [79, 101], [78, 102], [105, 110], [104, 111], [103, 112], [32, 113], [31, 114], [30, 115], [29, 116], [28, 117], [27, 118], [26, 119], [25, 120], [23, 121], [22, 122], [21, 123], [17, 125], [16, 126], [15, 127], [14, 128], [13, 129], [10, 131], [9, 132], [8, 133], [7, 134], [5, 139], [4, 140], [3, 141], [2, 142], [1, 143], [0, 144], [174, 178], [173, 179], [172, 180], [171, 181], [170, 182], [169, 183], [157, 188], [156, 189], [155, 190], [154, 191], [153, 192], [152, 193], [151, 195], [217, 223], [216, 224], [215, 225], [213, 228], [212, 229], [210, 233], [209, 234], [208, 235], [207, 236], [206, 237], [205, 238], [203, 240], [202, 241], [201, 242], [200, 243], [199, 244]]
    
    sep = pockets_all.copy()

    string_pockets_all = "".join(pockets_all)
    
    xstring = string_pockets_all.replace("p","P").replace("_P","_xP").replace("P_","Px_")
    print(string_pockets_all)
    print(xstring)
    xstring_splitted = xstring.split("x")
    #count =1
    count = ['1','2','3','4','5','6','7','8','9','0','A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','X','Y','Z',\
            'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','x','y','z']
    number =0
    for i in range(0, len(xstring_splitted)):
        if "P" in xstring_splitted[i]:
            xstring_splitted[i] = xstring_splitted[i].replace("P",count[number])
            number+=1
    pockets_numbered = "".join(xstring_splitted)
    pockets_numbered_list = list(pockets_numbered)
        
    print("".join(pockets_all))
    print(pockets_numbered) 
    #print(db)
    
    '''
    for k in range(0, len(count)):
        for i in range(0, len(pockets_numbered_list)):
        #print(number,'number')
            if pockets_numbered_list[i] == count[number]:
                print(count[number])            
    
    for i in range(0, len(count)):
        for k in range(0, len(pockets_numbered_list)):
            if pockets_numbered_list[k] == count[i]:
                print(count[i])
                for l in range(0, len(pairs_all)):
                    #print(pockets_numbered_list[l], 'inside')
                    if (pockets_all[k] == "P") or (pockets_all[k] == "p"):# == pairs_all[l][0]:
                        #print(pockets_numbered_list[l], 'inside')
                        print(pairs_all[l])
    '''
    list_of_pairs_fragments = [[] for i in range(0,len(count))]
    print(list_of_pairs_fragments)
    for x in range(0,len(count)):
        print(x)
        pair_x = list_of_pairs_fragments[x]
        for i in range(0, len(pockets_numbered_list)):
            if pockets_numbered_list[i] == str(count[x]):
                for k in range(0,len(pairs_all)):
                    if (pairs_all[k][0] == i) or (pairs_all[k][1] == i):
                        print(pairs_all[k])
                        pair_x.append(pairs_all[k])
    print(list_of_pairs_fragments, '325')
    pockets = []
    for i in range(0,len(list_of_pairs_fragments)):
        pockets.append([])
        for k in range(1,len(list_of_pairs_fragments)):
            #print(list_of_pairs_fragments[i])
            #print(list_of_pairs_fragments[k])
            
            is_common = common_data(list_of_pairs_fragments[i], list_of_pairs_fragments[k])
            if is_common == True:
                pockets[i].append(str(k+1))
                pockets[i].append(str(i+1))
                print(i+1,'with', k+1)
                print('true up')
        #quit()
        #print(common_data(list_of_pairs_fragments[i], list_of_pairs_fragments[i+1]))
        
        
    print(pockets)
    pockets = [x for x in pockets if x != []]
    
    print(pockets)
    
    for i in range(0, len(pockets)):
        
        for k in range(0,len(pockets)):
            is_common = common_data(pockets[i], pockets[k])
            if is_common ==True:
                pockets[i] = sorted(uniq_pairs(pockets[i]+pockets[k]))
                
        #del pockets[to_delete]
        
    print(uniq_pairs(pockets),'uniq_pockets')
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
        
        #print(db)
        print(pockets_numbered)    
    print("\n")
    print(final_list_pockets_string)    
    return(final_list_pockets_string)


    
    
def common_data(list1, list2): 
    result = False
  
    # traverse in the 1st list 
    for x in list1: 
  
        # traverse in the 2nd list 
        for y in list2: 
    
            # if one common 
            if x == y: 
                result = True
                return result  
                  
    return result 

    
def main_function():
    if args.input is None:
        raise FileNotFoundError("Please provide input file with '--input' "
                                "argument. Use -h for more help.")
    all_pockets = get_fragments(args.input)
    #print(all_pockets)

    for pkey, item_list in all_pockets.items():
        pairs = bracket_to_pair(item_list[0])
        all_pockets[pkey].append(pairs)
    #print(all_pockets)

    for pkey, item_list in all_pockets.items():
        capital_P = item_list[1]
        short_P_removed = remove_short_P(capital_P)
        #print(short_P_removed)
        #quit()	
        all_pockets[pkey].append(short_P_removed)
    #print(all_pockets)
    #quit()
    for pkey, item_list in all_pockets.items():
        pocket_P = item_list[3]
#        print('\n\n',pkey,item_list,'\n')
#        print(item_list[1])
#        print(pocket_P)
        pairs_all = item_list[2]
#        print(pairs_all,'\n')
        pairs_P = pairs_for_long_P(pocket_P, pairs_all)
        all_pockets[pkey].append(pairs_P)
    print(all_pockets)    
    
    for pkey, item_list in all_pockets.items():
        print(pkey)
        long_P = list(item_list[3])
        all_P = list(item_list[1])
        pairs_long_P = item_list[4]
        elongated_short_P = get_partners_for_long_P(long_P, all_P, pairs_long_P) # long_P, all_P, pairs_long_P
        all_pockets[pkey].append(elongated_short_P)

    for pkey, item_list in all_pockets.items():
        elongated_short_P = item_list[5]
        pairs_all = item_list[2]
        pairs_elongated_P = pairs_for_long_P(elongated_short_P, pairs_all)
        all_pockets[pkey].append(pairs_elongated_P)
        
    print(all_pockets)
    for pkey, item_list in all_pockets.items():
        pocket_P = list(item_list[5])
        pairs_P = item_list[6]
        Pp = add_small_p(pocket_P, pairs_P)
        all_pockets[pkey].append(Pp)
    
    print(all_pockets)
    for pkey, item_list in all_pockets.items():
        pockets_all= list(item_list[7])
        pairs_all = item_list[2]
        pockets_separated = separate_pockets(pockets_all, pairs_all)
        all_pockets[pkey].append(pockets_separated)
    
    print(all_pockets)
    
    
    
    with open(args.output, "w") as f:
        for key in all_pockets:
            print(key, file=f)
            print(all_pockets[key][0], file=f)
            print(all_pockets[key][7], file=f)
            print("\n".join(all_pockets[key][8]), file=f)
    quit()
    
    
    
    all_pockets = {x: [all_pockets[x][0], new_pockets[x]] for x in
                   all_pockets.keys()}
    new_pockets = check_pocket_pairs(all_pockets, "[", "]")

    with open(args.output, "w") as f:
        for key in all_pockets:
            print(key, file=f)
            print(all_pockets[key][0], file=f)
            print(new_pockets[key], file=f)


if __name__ == "__main__":
    main_function()
