#!/usr/bin/python3.8

"""
Author: Pritha Ghosh, Bujnicki Lab, IIMCB in Warsaw
Date: 1 June 2020

Script to annotate pairing partner in secondary structures to binding pockets

Usage:
python3 find_ss_pairing_partners.py --input input_file

For more help use:
python3 find_ss_pairing_partners.py -h
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
            pocket = next(file).strip()
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


def main_function():
    if args.input is None:
        raise FileNotFoundError("Please provide input file with '--input' "
                                "argument. Use -h for more help.")
    all_pockets = get_fragments(args.input)
    new_pockets = check_pocket_pairs(all_pockets, "(", ")")
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
