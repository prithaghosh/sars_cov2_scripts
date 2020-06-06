#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import pandas as pd
import argparse
from argparse import RawTextHelpFormatter
import sys

def argument_parser():

    parser = argparse.ArgumentParser(description=__doc__, 
                        prog='probing_bfactor_pdb.py', formatter_class=RawTextHelpFormatter)
    parser.add_argument("-i", "--input_pdb", dest="pdb_in",   
                        help="Input PDB file.")
    parser.add_argument("-r", "--reactivtity_file", required=True, dest="react_in",
                        help="File with reactivity. [copied from sheet, or ractivity format]")
    parser.add_argument("-o", "--output_pdb", required=False, dest="pdb_out", default='',
                        help="Name of output PDB file.")
    parser.add_argument("-c", "--color_by", required=False, dest="color", default='all', 
                        choices=['all', 'base', 'back', 'sugar','basesug', 'backsug'],
                        help="Which part of RNA will have raectivities set as b factor.")
    parser.add_argument("-s", "--sequence", required=False, dest="seq_in", default='',
                        help="Name of output PDB file.")


    args = parser.parse_args()

    in_pdb = args.pdb_in
    out_pdb = args.pdb_out
    reactivity = args.react_in
    color_by = args.color
    sequence_in = args.seq_in

    return in_pdb, out_pdb, reactivity, color_by, sequence_in


def read_file(ss_pockets):
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
            pocket = next(file).strip()# .replace("P_","PP").replace("_P","PP") # adding onP before 
            pocket_ext = pocket.replace("P_","PP").replace("_P","PP")
            my_dict[segment] = [ss, pocket, pocket_ext]
        return my_dict



def main_function():

    in_pdb, out_pdb, reactivity, color_by, sequence_in = argument_parser()

    pdb_start_index, seq_start_index, seq_end_index, pdb_end_index, pdb_len = read_sequence()
#    quit()
    pdb_in_list = read_pdb()
    reactivities_df = read_react()
    color = check_color()

    change_bfactor()

    print('\nB factor changed succesfully!\nGood job!\n')

if __name__ == "__main__":
    main_function()
